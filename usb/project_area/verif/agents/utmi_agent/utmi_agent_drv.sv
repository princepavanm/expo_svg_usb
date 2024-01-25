class utmi_agent_drv extends uvm_driver#(utmi_tx);

  `uvm_component_utils(utmi_agent_drv)

  utmi_tx               tx_h;

  virtual utmi_intf     vif;

  function new(string name="utmi_agent_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual utmi_intf)::get(this, " ", "utmi_pif", vif))
      `uvm_fatal("DRV", "***** Could not get vif *****")
  endfunction:build_phase

  task run_phase(uvm_phase phase);

     seq_item_port.get_next_item(req);
       req.print();
       drive_tx(req);
     seq_item_port.item_done();

  endtask:run_phase

  task drive_tx(utmi_tx     tx_h);

     //Implement driving logic here

  endtask:drive_tx

endclass:utmi_agent_drv
