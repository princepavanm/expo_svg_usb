class wb_reg_write_read_reg_model_seq extends wb_base_seq;
  `uvm_object_utils(wb_reg_write_read_reg_model_seq)

  function new(string name="wb_reg_write_read_reg_model_seq");
    super.new(name);
  endfunction

  task body();
    //write all the USB2.0 core registers with a random data
    foreach (regQ[i]) begin
      assert(this.randomize());
      regQ[i].write(status, data, .parent(this));
    end
    //read all the registers and compare it with the data that we wrote
    foreach (regQ[i]) begin
      regQ[i].read(status, data, .parent(this));  //data : data read from DUT register
      ref_data = regQ[i].get();                   //data that we wrote to the design(using write method)
      if (ref_data != data) begin
        `uvm_error("REG_SEQ:", $sformatf("Write read error for %s: Expected: %0h Actual: %0h", regQ[i].get_name(), ref_data, data))
      end
    end
  endtask
endclass
