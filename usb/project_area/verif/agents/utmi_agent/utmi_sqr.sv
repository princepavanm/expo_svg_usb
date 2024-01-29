class utmi_sqr extends uvm_sequencer#(base_pkt);
  `uvm_component_utils(utmi_sqr)

  function new(string name="utmi_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:utmi_sqr
