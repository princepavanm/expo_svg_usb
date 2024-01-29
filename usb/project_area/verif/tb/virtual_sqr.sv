class usb_virtual_sqr extends uvm_sequencer;
  
  `uvm_component_utils(usb_virtual_sqr)

  reset_sqr    reset_sqr_h;
  wb_sqr       wb_sqr_h;
  utmi_sqr     utmi_sqr_h;
  sram_sqr     sram_sqr_h;

  function new(string name="usb_virtual_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);

    super.build_phase(phase);

    reset_sqr_h  = reset_sqr::type_id::create("reset_sqr_h", this);
    wb_sqr_h     = wb_sqr::type_id::create("wb_sqr_h", this);
    utmi_sqr_h   = utmi_sqr::type_id::create("utmi_sqr_h", this);
    sram_sqr_h   = sram_sqr::type_id::create("sram_sqr_h", this);

  endfunction:build_phase

endclass:usb_virtual_sqr
