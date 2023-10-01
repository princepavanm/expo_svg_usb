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
	usb_virtual_sqr v_seqr;

	//sequencers_list
 	uvm_sequencer #(buff_tx) reset_seqr_h;
	buff_mst_agent_sqr  	 buff_mst_agent_sqr_h;
  	phy_rx_agent_sqr 	 phy_rx_agent_sqr_h;
	
	//sequences_list
	usb_reset_seq usb_reset_seq_h;
	usb_base_seq usb_base_seq_h;
	usb_phy_rx_seq 	usb_phy_rx_seq_h;

	
  	`uvm_object_utils(usb_virtual_sequence)

	//Default constructor
	
	function new(string name="usb_virtual_sequence");
    		super.new(name);
  	endfunction

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
		usb_base_seq_h.start(buff_mst_agent_sqr_h);
		usb_phy_rx_seq_h.start(phy_rx_agent_sqr_h);
		end	
	endtask

endclass
