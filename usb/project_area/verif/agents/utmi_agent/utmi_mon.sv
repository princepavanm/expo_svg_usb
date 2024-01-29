class utmi_mon extends uvm_monitor;

  `uvm_component_utils(utmi_mon)

  base_pkt   pkt_h;

  uvm_analysis_port #(base_pkt)       utmi_mon_port;

  function new(string name="utmi_mon", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    utmi_mon_port = new("utmi_mon_port", this);
    pkt_h = base_pkt::type_id::create("pkt_h", this);

  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("utmi_mon","Monitor Run Phase", UVM_LOW)

  endtask:run_phase

endclass:utmi_mon
