class wb_drv extends uvm_driver#(wb_tx);

  `uvm_component_utils(wb_drv)

  wb_tx               tx_h;

  virtual wb_intf     vif;

  function new(string name="wb_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual wb_intf)::get(this, " ", "wb_vif", vif))
      `uvm_fatal("DRV", "***** Could not get vif *****")
  endfunction:build_phase

  task run_phase(uvm_phase phase);
    @(posedge vif.wb_rst);
    forever begin
     seq_item_port.get_next_item(req);
       //req.print();
       drive_tx(req);
     seq_item_port.item_done();
    end
  endtask:run_phase

  task drive_tx(wb_tx     tx_h);
    //tx_h.print();
    @(vif.wb_drv_cb);
    vif.wb_drv_cb.wb_addr_i <= tx_h.addr;
    if (tx_h.wr_rd == 1) vif.wb_drv_cb.wb_data_i <= tx_h.data;
    vif.wb_drv_cb.wb_we_i   <= tx_h.wr_rd;
    vif.wb_drv_cb.wb_stb_i  <= 1;
    vif.wb_drv_cb.wb_cyc_i  <= 1;
    wait (vif.wb_drv_cb.wb_ack_o == 1);
    if(tx_h.wr_rd == 1) $display("%t :: WB Write - Addr = %h and Data = %h", $time, tx_h.addr, tx_h.data);
    if(tx_h.wr_rd == 0) begin
      $display("%t :: WB Read  - Addr = %h and Data = %h", $time, tx_h.addr, vif.wb_drv_cb.wb_data_o);
      if (tx_h.wr_rd == 0) begin
	    tx_h.data = vif.wb_drv_cb.wb_data_o;
	    if ((tx_h.addr == 'h00) && (tx_h.data[1] == 'b1)) `uvm_info("WB_DRV", "CSR Reg 2nd field Reading :: HIGH Seed is Detected", UVM_LOW); 
	    if ((tx_h.addr == 'h00) && (tx_h.data[1] == 'b0)) `uvm_info("WB_DRV", "CSR Reg 2nd field Reading :: FULL Seed is Detected", UVM_LOW);
      end
    end
    @(vif.wb_drv_cb);
    vif.wb_drv_cb.wb_addr_i <= 0;
    if (tx_h.wr_rd == 1) vif.wb_drv_cb.wb_data_i <= 0;
    vif.wb_drv_cb.wb_we_i   <= 0;
    vif.wb_drv_cb.wb_stb_i  <= 0;
    vif.wb_drv_cb.wb_cyc_i  <= 0;
  endtask:drive_tx

endclass:wb_drv
