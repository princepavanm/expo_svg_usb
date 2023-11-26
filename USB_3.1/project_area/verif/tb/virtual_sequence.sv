///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
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
	
  usb_virtual_sqr 	v_seqr;

  //sequences_list
  reset_sequence 	reset_seq_h;
  mid_reset_sequence	mid_reset_seq_h;

  speed_neg_hs_seq 	speed_neg_hs_seq_h;
  debug_sof_seq 	debug_sof_seq_h;
  usb_base_seq 		usb_base_seq_h;
  token_in_seq 		token_in_seq_h;
  
  
  
  usb_phy_rx_seq 	usb_phy_rx_seq_h;

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

    mid_reset_seq_h=mid_reset_sequence::type_id::create("mid_reset_seq_h");
    debug_sof_seq_h=debug_sof_seq::type_id::create("debug_sof_seq_h");
    speed_neg_hs_seq_h=speed_neg_hs_seq::type_id::create("speed_neg_hs_seq_h");
    token_in_seq_h=token_in_seq::type_id::create("token_in_seq_h");

    usb_base_seq_h=usb_base_seq::type_id::create("usb_base_seq_h");
    usb_phy_rx_seq_h=usb_phy_rx_seq::type_id::create("usb_phy_rx_seq_h");

    if(!$cast(env_h, uvm_top.find("uvm_test_top.env_h"))) `uvm_error(get_name(), "env is not found");

//sequence start here with respect to switches
    `ifdef RESET_SEQ
    	begin
     	 	reset_seq_h.start(env_h.v_sqr_h.reset_sqr_h);
      		//  #1000;
      		//usb_base_seq_h.start(env_h.v_sqr_h.buff_mst_agent_sqr_h);
      		//usb_phy_rx_seq_h.start(env_h.v_sqr_h.phy_rx_agent_sqr_h);
   	end
   `endif  


   `ifdef DEBUG_SOF_SEQ
      debug_sof_seq_h.start(env_h.v_sqr_h.reset_sqr_h);
   `endif   

    `ifdef MID_RESET_SEQ
       mid_reset_seq_h.start(env_h.v_sqr_h.reset_sqr_h);
    `endif

    `ifdef SPEED_NEG_HS_SEQ
      speed_neg_hs_seq_h.start(env_h.v_sqr_h.reset_sqr_h);
   `endif

   `ifdef TOKEN_IN_SEQ
      token_in_seq_h.start(env_h.v_sqr_h.reset_sqr_h);
   `endif


  endtask

  virtual task post_body();
    super.post_body();
    if ( (starting_phase != null) && (get_parent_sequence() == null) )
      starting_phase.drop_objection( this );
  endtask : post_body

endclass


