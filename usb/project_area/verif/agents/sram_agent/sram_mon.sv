class sram_mon extends uvm_monitor;

  `uvm_component_utils(sram_mon)

  sram_tx   tx_h;

  uvm_analysis_port #(sram_tx)       sram_mon_port;

  function new(string name="sram_mon", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    sram_mon_port = new("sram_mon_port", this);
    tx_h = sram_tx::type_id::create("tx_h", this);

  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("sram_mon","Monitor Run Phase", UVM_LOW)

  endtask:run_phase

endclass:sram_mon
