class utmi_agent_mon extends uvm_monitor;

  `uvm_component_utils(utmi_agent_mon)

  utmi_tx   tx_h;

  uvm_analysis_port #(utmi_tx)       utmi_agent_mon_port;

  function new(string name="utmi_agent_mon", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    utmi_agent_mon_port = new("utmi_agent_mon_port", this);
    tx_h = utmi_tx::type_id::create("tx_h", this);

  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("utmi_agent_mon","Monitor Run Phase", UVM_LOW)

  endtask:run_phase

endclass:utmi_agent_mon
