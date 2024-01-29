class wb_cov extends uvm_subscriber#(wb_tx);

  `uvm_component_utils(wb_cov)

  uvm_analysis_imp#(wb_tx, wb_cov)       wb_cov_port;

  wb_tx   tx_h;

  covergroup cg();

    // Implement Cover bins here

  endgroup:cg

  function new(string name="wb_cov", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wb_cov_port = new("wb_cov_port", this);
    tx_h = wb_tx::type_id::create("tx_h", this);
  endfunction:build_phase

  function void write(wb_tx   t);

    `uvm_info("wb_agent_COV", "From Coverage Write function", UVM_LOW)

  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("wb_agent_COV","From Coverage Run Phase", UVM_LOW)

  endtask:run_phase

endclass:wb_cov
