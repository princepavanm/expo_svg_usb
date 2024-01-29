class usb_base_test extends uvm_test;

  usb_env                   env_h; 

  usb_virtual_sequence      virtual_seq_h;
  reset_sequence            reset_seq_h;

  `uvm_component_utils(usb_base_test)

  function new(string name="usb_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    env_h = usb_env::type_id::create("env_h", this);

    virtual_seq_h = usb_virtual_sequence::type_id::create("virtual_seq_h", this);
    reset_seq_h   = reset_sequence::type_id::create("reset_seq_h", this);
  endfunction:build_phase

  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_factory factory = uvm_factory::get();
    uvm_top.print_topology();
    //factory.print();
  endfunction:end_of_elaboration_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    virtual_seq_h.reset_seq_h = reset_seq_h;
  endfunction:connect_phase

  virtual task run_phase (uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
      virtual_seq_h.reset_seq_h.start(env_h.v_sqr_h.reset_sqr_h);
    phase.drop_objection(this);
  endtask	

endclass:usb_base_test
