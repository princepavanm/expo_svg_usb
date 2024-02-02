class utmi_drv extends uvm_driver#(base_pkt);

  `uvm_component_utils(utmi_drv)

  base_pkt     pkt_h;
  sof_pkt      sof_pkt_h;
  token_pkt    token_pkt_h;
  data_pkt     data_pkt_h;
  hs_pkt       hs_pkt_h;
  
  bit [7:0] crc16_7_0_inverse;
  bit [7:0] crc16_15_8_inverse;
  bit [7:0] token0, token1;
  byte byteQ[$];

  virtual utmi_intf     vif;

  function new(string name="utmi_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual utmi_intf)::get(this, " ", "utmi_vif", vif))
      `uvm_fatal("DRV", "***** Could not get vif *****")
  endfunction:build_phase

  task run_phase(uvm_phase phase);
    reset_signaling();
    fork
    forever begin
      seq_item_port.get_next_item(req);
        req.print();
        drive_tx(req);
      seq_item_port.item_done();
    end
    
      forever begin
        @(posedge vif.utmi_clk);
        if (vif.TxValid_o == 1) begin
          vif.TxReady_i = 1;
        end
        //else begin
        //  vif.TxReady_i = 0;
        //end
        @(posedge vif.utmi_clk);
        vif.TxReady_i = 0;
      end

    join
  endtask:run_phase

  task reset_signaling();
    `uvm_info("RESET", "Reset Signaling Started", UVM_LOW)
    //wait for 100ms
    //100ms/50 = 2ms
    //60Mhz = 1000/60 ns = 16.666ns
    //2ms/16.66ns = 2*10**-3/83.33 *10**-9 = 2*10**6/16.666 = 120,000
    repeat(2500) @(posedge vif.utmi_clk);
    reset_signaling_completed = 1;
    `uvm_info("RESET", "Reset Signaling Completed", UVM_LOW)
  endtask

  task drive_tx(base_pkt     pkt_h);
    case (pkt_h.pkt_type)
      SPEED_NEG           : begin
                              @(posedge vif.utmi_clk)
                              vif.LineState_i = 2'b01;                //IDLE -> J(in FS)
                              repeat(60) @(posedge vif.utmi_clk);
                              //2.5us to 3ms => 5us
                              //5us/83.33ns = 5000/83.33 = 60
                              //repeat(5000) @(posedge vif.utmi_clk); 
			                  //here we have to wait until FSM move to next state which is SPEED_NEG and SPEED_NEG_K State
			                  //we can use both concept giving clk delay or wait statements
			                  //here I am using wait
                              wait (top.dut.u0.u0.state == 15'h400);  //SPEED_NEG state
                              wait (top.dut.u0.u0.state == 15'h800);  //SPEED_NEG_K state
                              repeat(6) begin
                                 vif.LineState_i = 2'b10; //K
                                 repeat(2) @(posedge vif.utmi_clk);
                                 vif.LineState_i = 2'b01; //J
                                 repeat(2) @(posedge vif.utmi_clk);
                              end
                              wait (top.dut.u0.u0.state == 15'h2000);  //SPEED_NEG_HS state
                              if (vif.XcvSelect_o == 0 && vif.TermSel_o == 0) begin
                              	hs_mode_f = 1;
                              end
                              repeat(60) @(posedge vif.utmi_clk);
                              `uvm_info("UTMI_DRV", "HIGH Seed Negotiaion is Done", UVM_LOW);
	                        end

      SPEED_NEG_FS        : begin
	                          @(posedge vif.utmi_clk)
                              vif.LineState_i = 2'b01;                //IDLE -> J(in FS)
		                      repeat(60) @(posedge vif.utmi_clk);
                              wait (top.dut.u0.u0.state == 15'h400);  //SPEED_NEG state
                              wait (top.dut.u0.u0.state == 15'h800);  //SPEED_NEG_K state
		                      //Start doing Chirpk-j pattern
                              vif.LineState_i = 2'b00;   //SE0
                              wait (top.dut.u0.u0.state == 15'h4000);  //SPEED_NEG_FS state
		                      @(posedge vif.utmi_clk);
			                  `uvm_info("UTMI_DRV", "Full Seed Negotiaion is Done", UVM_LOW);
		                    end

      SOF                 : begin
                              //1st drive SOF
                              $cast(sof_pkt_h, pkt_h);
		                      //pack in to byteQ
                              {token1[2:0], token0} = sof_pkt_h.frame_num;
                              token1[7:3] = sof_pkt_h.crc5;
                              byteQ = {>>byte{sof_pkt_h.pid, token0, token1}};
		                      //byteQ = {>>byte{sof_pkt_h.pid, frame_num[7:0], crc5, frame_num[10:8]}};
		                      //logic to drive the byteQ
		                      drive_byteQ(byteQ);
                              byteQ.delete(); //delete byteQ entries
	                        end

      SETUP, IN, OUT      : begin
		                      //TOKEN
		                      //pack in to byteQ
		                      $cast(token_pkt_h, pkt_h);
                              token0[6:0] = token_pkt_h.addr;
                              {token1[2:0], token0[7]} = token_pkt_h.endp;
                              token1[7:3] = token_pkt_h.crc5;
                              byteQ = {>>byte{token_pkt_h.pid, token0, token1}};
		                      //byteQ = {>>byte{token_pkt_h.pid, endp[0], addr, endp[3:1], crc5}};
		                      //logic to drive the byteQ
		                      drive_byteQ(byteQ);
		                      byteQ.delete(); //delete byteQ entries
                            end

      DATA0, DATA1, DATA2 : begin
		                      //DATA STAGE
		                        $cast (data_pkt_h, pkt_h);
		                        //Below is logic to pack entire data in to byteQ
		                        byteQ.push_back(data_pkt_h.pid);
		                        foreach ( data_pkt_h.dataQ[j]) begin
                                  byteQ.push_back(data_pkt_h.dataQ[j]);
		                        end
                                crc16_15_8_inverse = {
                     	          data_pkt_h.crc16[8],
                     	          data_pkt_h.crc16[9],
                     	          data_pkt_h.crc16[10],
                     	          data_pkt_h.crc16[11],
                     	          data_pkt_h.crc16[12],
                     	          data_pkt_h.crc16[13],
                     	          data_pkt_h.crc16[14],
                     	          data_pkt_h.crc16[15]
                                };
                                byteQ.push_back(crc16_15_8_inverse);
                                crc16_7_0_inverse = {
                     	          data_pkt_h.crc16[0],
                     	          data_pkt_h.crc16[1],
                     	          data_pkt_h.crc16[2],
                     	          data_pkt_h.crc16[3],
                     	          data_pkt_h.crc16[4],
                     	          data_pkt_h.crc16[5],
                     	          data_pkt_h.crc16[6],
                     	          data_pkt_h.crc16[7]
                                };
                                byteQ.push_back(crc16_7_0_inverse);
		                        //logic to drive the data_pkt byteQ to the design
		                        drive_byteQ(byteQ);
		                        byteQ.delete(); //delete byteQ entries
                            end

      ACK                 : begin
                              $cast(hs_pkt_h, pkt_h);
                              byteQ[0] = hs_pkt_h.pid;
                              drive_byteQ(byteQ);
                              byteQ.delete();     //delete byteQ entries
	                    end

      SUSPEND    : begin
	           end
      RESUME     : begin
	           end
    endcase
  endtask:drive_tx

  task drive_byteQ(byte byteQ[$]);
    foreach (byteQ[i]) begin
      @(posedge vif.utmi_clk);
      vif.DataIn_i   = byteQ[i];
      vif.RxValid_i  = 1;
      vif.RxActive_i = 1;
      vif.RxError_i  = 0;
    end
    @(posedge vif.utmi_clk);
    vif.DataIn_i   = 0;
    vif.RxValid_i  = 0;
    vif.RxActive_i = 0;
    repeat(3) @(posedge vif.utmi_clk);
  endtask
endclass:utmi_drv
