class wb_sqr extends uvm_sequencer#(wb_tx);

  `uvm_component_utils(wb_sqr)

  function new(string name="wb_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:wb_sqr
