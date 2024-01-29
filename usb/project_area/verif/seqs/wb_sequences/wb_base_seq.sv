class wb_base_seq extends uvm_sequence#(wb_tx);

  `uvm_object_utils(wb_base_seq)

  uvm_reg               regQ[$];
  usb_reg_block         usb_rm;
  uvm_status_e          status;
  rand uvm_reg_data_t   data;
  bit [16:0]            buf_ptr;
  bit [13:0]            buf_sz;
  bit                   used;
  uvm_reg_data_t        spec_reset_value;
  uvm_reg_data_t        ref_data;

  function new(string name="wb_base_seq");
    super.new(name);
  endfunction

  virtual task pre_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.raise_objection(this);
    end
    //get the usb_rm from resource DB	
    if (!uvm_resource_db#(usb_reg_block)::read_by_name("GLOBAL", "USB_RM", usb_rm, this)) begin
       `uvm_fatal("WB_BASE_SEQ", "***** Could not read_by_name USB_RM *****")
    end
    usb_rm.get_registers(regQ);      //all register object handles gets filled in to the Queue
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
  
endclass:wb_base_seq

