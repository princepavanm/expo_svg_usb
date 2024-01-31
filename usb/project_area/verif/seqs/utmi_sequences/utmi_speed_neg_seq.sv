class utmi_speed_neg_seq extends utmi_base_seq;

  `uvm_object_utils(utmi_speed_neg_seq)

  function new(string name="utmi_speed_neg_seq");
    super.new(name);
  endfunction

  virtual task pre_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.raise_objection(this);
    end

  endtask:pre_body

  virtual task body();

  `uvm_do_with(req, {req.pkt_type == SPEED_NEG;}); 

  endtask:body

  virtual task post_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.drop_objection(this);
    end
  endtask:post_body
  
endclass:utmi_speed_neg_seq
