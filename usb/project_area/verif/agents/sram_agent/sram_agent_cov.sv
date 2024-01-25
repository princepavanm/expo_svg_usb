class sram_agent_cov extends uvm_subscriber#(sram_tx);

  `uvm_component_utils(sram_agent_cov)

  uvm_analysis_imp#(sram_tx, sram_agent_cov)       sram_agent_cov_port;

  sram_tx   tx_h;

  covergroup cg();

    // Implement Cover bins here

  endgroup:cg

  function new(string name="sram_agent_cov", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sram_agent_cov_port = new("sram_agent_cov_port", this);
    tx_h = sram_tx::type_id::create("tx_h", this);
  endfunction:build_phase

  function void write(sram_tx   t);

    `uvm_info("sram_agent_COV", "From Coverage Write function", UVM_LOW)

  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("sram_agent_COV","From Coverage Run Phase", UVM_LOW)

  endtask:run_phase

endclass:sram_agent_cov
