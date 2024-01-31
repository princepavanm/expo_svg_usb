class utmi_drv extends uvm_driver#(base_pkt);

  `uvm_component_utils(utmi_drv)

  base_pkt     pkt_h;

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
    forever begin
      seq_item_port.get_next_item(req);
        req.print();
        drive_tx(req);
      seq_item_port.item_done();
    end
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
    endcase
  endtask:drive_tx

endclass:utmi_drv
