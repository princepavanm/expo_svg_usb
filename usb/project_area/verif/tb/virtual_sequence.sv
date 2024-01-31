///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company           :  Expolog Technologies.                                               //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMAD_KHADEER, LOKESH, MADHURA.                        //
//      Revision tag      :  06/10/2023.                                                         //
//      Module Name       :  usb_virtual_sequence.                                               //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  uvm_sequence ( Virtual_sequence )                                   //
//      Description       :  This module virtual sequence to start multiple sequences            //
//                           on different sequencer.                                             //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class usb_virtual_sequence extends uvm_sequence #(uvm_sequence_item);
 
  `uvm_object_utils(usb_virtual_sequence)
	
  usb_virtual_sqr 	    v_seqr;

  reset_sequence 	              reset_seq_h;
  wb_reg_reset_read_seq               wb_reg_reset_read_seq_h;
  wb_reg_write_read_seq               wb_reg_write_read_seq_h;
  wb_reg_reset_read_reg_model_seq     wb_reg_reset_read_reg_model_seq_h;
  wb_reg_write_read_reg_model_seq     wb_reg_write_read_reg_model_seq_h;
  utmi_speed_neg_seq                  utmi_speed_neg_seq_h;
  utmi_fs_speed_neg_seq               utmi_fs_speed_neg_seq_h;

  usb_env		    env_h;

  //Default constructor
  function new(string name="usb_virtual_sequence");
    super.new(name);
  endfunction

  virtual task pre_body();
    super.pre_body();
    if ( (starting_phase != null) && (get_parent_sequence() == null) )
      starting_phase.raise_objection( this );
  endtask : pre_body

  virtual task body();
    reset_seq_h=reset_sequence::type_id::create("reset_seq_h");
    wb_reg_reset_read_seq_h=wb_reg_reset_read_seq::type_id::create("wb_reg_reset_read_seq_h");
    wb_reg_write_read_seq_h = wb_reg_write_read_seq::type_id::create("wb_reg_write_read_seq_h");
    wb_reg_reset_read_reg_model_seq_h = wb_reg_reset_read_reg_model_seq::type_id::create("wb_reg_reset_read_reg_model_seq_h");
    wb_reg_write_read_reg_model_seq_h = wb_reg_write_read_reg_model_seq::type_id::create("wb_reg_write_read_reg_model_seq_h");
    utmi_speed_neg_seq_h              = utmi_speed_neg_seq::type_id::create("utmi_speed_neg_seq_h");
    utmi_fs_speed_neg_seq_h           = utmi_fs_speed_neg_seq::type_id::create("utmi_fs_speed_neg_seq_h");

    if(!$cast(env_h, uvm_top.find("uvm_test_top.env_h"))) `uvm_error(get_name(), "env is not found");    
  endtask

  virtual task post_body();
    super.post_body();
    if ( (starting_phase != null) && (get_parent_sequence() == null) )
      starting_phase.drop_objection( this );
  endtask : post_body

endclass

