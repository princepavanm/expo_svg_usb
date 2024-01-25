class sram_agent_sqr extends uvm_sequencer#(sram_tx);

  `uvm_component_utils(sram_agent_sqr)

  function new(string name="sram_agent_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:sram_agent_sqr
