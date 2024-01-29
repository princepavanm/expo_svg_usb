class sram_sqr extends uvm_sequencer#(sram_tx);

  `uvm_component_utils(sram_sqr)

  function new(string name="sram_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:sram_sqr
