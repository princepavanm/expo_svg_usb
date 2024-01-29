class utmi_cov extends uvm_subscriber#(base_pkt);

  `uvm_component_utils(utmi_cov)

  uvm_analysis_imp#(base_pkt, utmi_cov)       utmi_cov_port;

  base_pkt   pkt_h;

  covergroup cg();

    // Implement Cover bins here

  endgroup:cg

  function new(string name="utmi_cov", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    utmi_cov_port = new("utmi_cov_port", this);
    pkt_h = base_pkt::type_id::create("pkt_h", this);
  endfunction:build_phase

  function void write(base_pkt   t);

    `uvm_info("utmi_agent_COV", "From Coverage Write function", UVM_LOW)

  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("utmi_agent_COV","From Coverage Run Phase", UVM_LOW)

  endtask:run_phase

endclass:utmi_cov
