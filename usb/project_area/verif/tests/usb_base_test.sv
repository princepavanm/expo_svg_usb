class usb_base_test extends uvm_test;

  usb_env      env_h; 

  `uvm_component_utils(usb_base_test)

  function new(string name="usb_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    env_h = usb_env::type_id::create("env_h", this);
    uvm_config_db#(uvm_object_wrapper)::set(this,"env_h.reset_agent_h.reset_sqr_h.reset_phase","default_sequence",reset_sequence::get_type());
  endfunction:build_phase

  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_factory factory = uvm_factory::get();
    uvm_top.print_topology();
    factory.print();
  endfunction:end_of_elaboration_phase

  task run_phase(uvm_phase phase);
     
endtask


endclass:usb_base_test
