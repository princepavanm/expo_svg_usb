class sram_tx extends uvm_sequence_item;

  //rand bit [31:0] data;

  `uvm_object_utils_begin(sram_tx)
    //`uvm_field_int(data, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="sram_tx");
    super.new(name);
  endfunction

endclass