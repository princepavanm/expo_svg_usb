class utmi_agent_cov extends uvm_subscriber#(utmi_tx);

  `uvm_component_utils(utmi_agent_cov)

  uvm_analysis_imp#(utmi_tx, utmi_agent_cov)       utmi_agent_cov_port;

  utmi_tx   tx_h;

  covergroup cg();

    // Implement Cover bins here

  endgroup:cg

  function new(string name="utmi_agent_cov", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    utmi_agent_cov_port = new("utmi_agent_cov_port", this);
    tx_h = utmi_tx::type_id::create("tx_h", this);
  endfunction:build_phase

  function void write(utmi_tx   t);

    `uvm_info("utmi_agent_COV", "From Coverage Write function", UVM_LOW)

  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("utmi_agent_COV","From Coverage Run Phase", UVM_LOW)

  endtask:run_phase

endclass:utmi_agent_cov
