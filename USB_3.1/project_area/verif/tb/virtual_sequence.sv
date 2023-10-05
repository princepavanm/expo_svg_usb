///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  Angappan                                                            //
//      Revision tag      :                                                                      //
//      Module Name       :  usb_virtual_sequence                                                //
//      Project Name      :                                                                      //
//      component name    :                                                                      //
//      Description       :	This module provides a test to generate clocks                   //
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
  usb_base_seq 		usb_base_seq_h;
  usb_phy_rx_seq 	usb_phy_rx_seq_h;

  usb_env		    env_h;

<<<<<<< HEAD
  //Default constructor
  function new(string name="usb_virtual_sequence");
    super.new(name);
  endfunction

  virtual task pre_body();
    super.pre_body();
    if ( (starting_phase!=null) && (get_parent_sequence()==null) )
      starting_phase.raise_objection( this );
  endtask : pre_body

  virtual task body();
    reset_seq_h=reset_sequence::type_id::create("reset_seq_h");
    usb_base_seq_h=usb_base_seq::type_id::create("usb_base_seq_h");
    usb_phy_rx_seq_h=usb_phy_rx_seq::type_id::create("usb_phy_rx_seq_h");

    if(!$cast(env_h, uvm_top.find("uvm_test_top.env_h"))) `uvm_error(get_name(), "env is not found");

    //sequence start here
    begin
      reset_seq_h.start(env_h.v_sqr_h.reset_sqr_h);
	  #55000;
      usb_base_seq_h.start(env_h.v_sqr_h.buff_mst_agent_sqr_h);
      usb_phy_rx_seq_h.start(env_h.v_sqr_h.phy_rx_agent_sqr_h);
    end	
  endtask

  virtual task post_body();
    super.post_body();
    if ( (starting_phase!=null) && (get_parent_sequence()==null) )
      starting_phase.drop_objection( this );
  endtask : post_body
=======
	virtual task body();
		
		usb_reset_seq_h=usb_reset_seq::type_id::create("usb_reset_seq_h");
		usb_base_seq_h=	usb_base_seq::type_id::create("usb_base_seq_h");
		usb_phy_rx_seq_h=usb_phy_rx_seq::type_id::create("usb_phy_rx_seq_h");
		
		if(!$cast(v_seqr,m_sequencer)) begin:B1
			`uvm_error(get_full_name(),"Virtual cast pointer cast failed")
		end:B1
		
		//oject assignment of sequencers
		reset_seqr_h=v_seqr.reset_seqr_h;
		buff_mst_agent_sqr_h=v_seqr.buff_mst_agent_sqr_h;
		phy_rx_agent_sqr_h=v_seqr.phy_rx_agent_sqr_h;
		
		//sequence start here
		begin
		usb_reset_seq_h.start(reset_seqr_h);
		#55000;
		usb_base_seq_h.start(buff_mst_agent_sqr_h);
		usb_phy_rx_seq_h.start(phy_rx_agent_sqr_h);
		end	
	endtask
>>>>>>> 552930072af2aac20aed076c35e4a406c897fdcd

endclass

