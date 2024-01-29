class wb_reg_reset_read_reg_model_seq extends wb_base_seq;
  `uvm_object_utils(wb_reg_reset_read_reg_model_seq)

  function new(string name="wb_reg_reset_read_reg_model_seq");
    super.new(name);
  endfunction

  task body();
    foreach (regQ[i]) begin
      spec_reset_value = regQ[i].get_reset();    //reset value as per the specification
      regQ[i].read(status, data, .parent(this)); //data reading from the design
      if (spec_reset_value != data) begin
        `uvm_error("REG_SEQ", $sformatf("Reset read error for %s: Expected: %0h Actual: %0h", regQ[i].get_name(), spec_reset_value, data))
      end
      //else `uvm_info("REG_SEQ", $sformatf("Reset read for %s: Expected: %0h Actual: %0h", regQ[i].get_name(), spec_reset_value, data), UVM_MEDIUM);
    end
  endtask
endclass

