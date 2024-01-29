class wb_mon extends uvm_monitor;

  `uvm_component_utils(wb_mon)

  wb_tx   tx_h;

  uvm_analysis_port #(wb_tx)       wb_mon_port;

  function new(string name="wb_mon", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    wb_mon_port = new("wb_mon_port", this);
    tx_h = wb_tx::type_id::create("tx_h", this);

  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("wb_mon","Monitor Run Phase", UVM_LOW)

  endtask:run_phase

endclass:wb_mon
