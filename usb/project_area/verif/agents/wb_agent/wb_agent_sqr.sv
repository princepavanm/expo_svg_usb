class wb_agent_sqr extends uvm_sequencer#(wb_tx);

  `uvm_component_utils(wb_agent_sqr)

  function new(string name="wb_agent_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:wb_agent_sqr
