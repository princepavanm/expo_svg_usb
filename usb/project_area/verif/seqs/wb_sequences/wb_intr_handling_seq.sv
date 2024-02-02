class wb_intr_handling_seq extends wb_base_seq;
  `uvm_object_utils(wb_intr_handling_seq)
  
  function new(string name="wb_intr_handling_seq");
    super.new(name);
  endfunction

  task body();
    forever begin
      @(top.dut.inta_o or top.dut.intb_o);
      if (top.dut.inta_o == 1 || top.dut.intb_o == 1) begin
      	usb_rm.int_src.read(status, data, .parent(this)); //data reading from the design
	`uvm_info("INT_SRC_READ", $sformatf("Data = %h", data), UVM_NONE);
      	//`uvm_warning("INT_SRC_READ", $psprintf("data=%h",data))
      	if (data[25] == 1) begin
      	  //`uvm_warning("INT_SRC_READ", "USB Device attached");
	  `uvm_info("INT_SRC_READ", "USB Device attached", UVM_NONE);
      	end
      	if (data[28] == 1) begin
      	  //`uvm_warning("INT_SRC_READ", "USB reset applied");
	  `uvm_info("INT_SRC_READ", "USB reset applied", UVM_NONE);
      	end
      end
    end
  endtask
endclass
