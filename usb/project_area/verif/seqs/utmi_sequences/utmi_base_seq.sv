class utmi_base_seq extends uvm_sequence#(base_pkt);

  `uvm_object_utils(utmi_base_seq)

  sof_pkt      sof_pkt_h;
  token_pkt    token_pkt_h;
  data_pkt     data_pkt_h;
  hs_pkt       hs_pkt_h;
  
  function new(string name="utmi_base_seq");
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

   // Functionality of sequence are coded here

  endtask:body

  virtual task post_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.drop_objection(this);
    end
  endtask:post_body
  
endclass:utmi_base_seq

