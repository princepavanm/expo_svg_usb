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
    forever begin
      seq_item_port.get_next_item(req);
        req.print();
        drive_tx(req);
      seq_item_port.item_done();
    end
  endtask:run_phase

  task drive_tx(base_pkt     pkt_h);
  endtask:drive_tx

endclass:utmi_drv
