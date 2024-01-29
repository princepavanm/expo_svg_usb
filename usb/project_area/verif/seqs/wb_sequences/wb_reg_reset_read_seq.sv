class wb_reg_reset_read_seq extends wb_base_seq;

  `uvm_object_utils(wb_reg_reset_read_seq)

  function new(string name="wb_reg_reset_read_seq");
    super.new(name);
  endfunction

  task body();
    //generate items to read all the registers
    for (int i = 0; i < 6; i++) begin
    	`uvm_do_with(req, {req.addr == 4*i; req.wr_rd == 1'b0;})
    end
    //EP registers
    for (int i = 0; i < 64; i++) begin
    	`uvm_do_with(req, {req.addr == 'h40+(4*i); req.wr_rd == 1'b0;})
    end
    //did we compare the read data with spec value?? No
    //without using register model, we are just performing register reads, no compare
  endtask

endclass
