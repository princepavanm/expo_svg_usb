class utmi_agent_sqr extends uvm_sequencer#(utmi_tx);

  `uvm_component_utils(utmi_agent_sqr)

  function new(string name="utmi_agent_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:utmi_agent_sqr
