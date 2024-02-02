class base_pkt extends uvm_sequence_item;

  rand bit [7:0] pid;
  rand pkt_type_t pkt_type;
  bit	[7:0]	token0, token1;

  `uvm_object_utils_begin(base_pkt)
    `uvm_field_int(pid, UVM_ALL_ON)
    `uvm_field_enum(pkt_type_t, pkt_type, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="base_pkt");
    super.new(name);
  endfunction

  constraint pid_c {
  	pid[3:0] == ~pid[7:4];
  }
  
  virtual function bit [4:0] calc_crc5();
    //return;
    //purposefull keeping it empty, but declared as virtual
  endfunction
  
  virtual function bit [15:0] calc_crc16();
    //return;
    //purposefull keeping it empty, but declared as virtual
  endfunction
  
endclass
