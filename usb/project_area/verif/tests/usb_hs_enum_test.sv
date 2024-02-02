class usb_hs_enum_test extends usb_base_test;

  `uvm_component_utils(usb_hs_enum_test)

  utmi_speed_neg_seq     utmi_speed_neg_seq_h;
  utmi_enum_in_seq       utmi_enum_in_seq_h;
  wb_usb_config_seq      wb_usb_config_seq_h;
  wb_intr_handling_seq   wb_intr_handling_seq_h;

  function new(string name="usb_hs_enum_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);       
    utmi_speed_neg_seq_h   = utmi_speed_neg_seq::type_id::create("utmi_speed_neg_seq_h");
    utmi_enum_in_seq_h     = utmi_enum_in_seq::type_id::create("utmi_enum_in_seq_h");
    wb_usb_config_seq_h    = wb_usb_config_seq::type_id::create("wb_usb_config_seq_h");
    wb_intr_handling_seq_h = wb_intr_handling_seq::type_id::create("wb_intr_handling_seq_h");

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    virtual_seq_h.utmi_speed_neg_seq_h            = utmi_speed_neg_seq_h;
    virtual_seq_h.utmi_enum_in_seq_h              = utmi_enum_in_seq_h;
    virtual_seq_h.wb_usb_config_seq_h             = wb_usb_config_seq_h;
    virtual_seq_h.wb_intr_handling_seq_h          = wb_intr_handling_seq_h;
  endfunction:connect_phase

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
      fork 
        virtual_seq_h.wb_intr_handling_seq_h.start(env_h.v_sqr_h.wb_sqr_h);
      join_none
      virtual_seq_h.utmi_speed_neg_seq_h.start(env_h.v_sqr_h.utmi_sqr_h);
      virtual_seq_h.wb_usb_config_seq_h.start(env_h.v_sqr_h.wb_sqr_h);
      virtual_seq_h.utmi_enum_in_seq_h.start(env_h.v_sqr_h.utmi_sqr_h);
      phase.phase_done.set_drain_time(this, 200000);
    phase.drop_objection(this);
  endtask

endclass
