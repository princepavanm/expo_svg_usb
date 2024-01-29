class usb_reg_reset_read_test extends usb_base_test;
  
  `uvm_component_utils(usb_reg_reset_read_test)

  wb_reg_reset_read_seq     wb_reg_reset_read_seq_h;
  
  function new(string name="usb_reg_reset_read_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wb_reg_reset_read_seq_h = wb_reg_reset_read_seq::type_id::create("wb_reg_reset_read_seq_h");
  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    virtual_seq_h.wb_reg_reset_read_seq_h = wb_reg_reset_read_seq_h;
  endfunction:connect_phase
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
      virtual_seq_h.wb_reg_reset_read_seq_h.start(env_h.v_sqr_h.wb_sqr_h);
      phase.phase_done.set_drain_time(this, 100);
    phase.drop_objection(this);
  endtask
  
endclass
