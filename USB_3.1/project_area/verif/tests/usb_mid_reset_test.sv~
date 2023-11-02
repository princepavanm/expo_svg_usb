///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  mid_reset_test                                                       //
//      Project Name      :  USB 3.1                                                             /et nu
//
//      Component Name    :  mid_reset_test                                                       //
//      Description       :	 This module provides a test to generate clocks                      //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
 //`include "usb_base_test.sv"

class mid_reset_test extends usb_base_test;

  `uvm_component_utils(mid_reset_test)

  //usb_virtual_sqr 	        v_sqr_h;

  mid_reset_sequence			mid_reset_seq_h;
  //usb_base_seq 		        usb_base_seq_h;
  //usb_phy_rx_seq	        usb_phy_rx_seq_h;
  //usb_virtual_sequence      virtual_seq_h;
  
  //virtual reset_intf		reset_pif;

  function new(string name="mid_reset_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	//v_sqr_h = usb_virtual_sqr::type_id::create("v_sqr_h", this);
	
	mid_reset_seq_h=mid_reset_sequence::type_id::create("mid_reset_seq_h", this);

    //usb_base_seq_h = usb_base_seq::type_id::create("usb_base_seq_h", this);
    //usb_phy_rx_seq_h = usb_phy_rx_seq::type_id::create("usb_phy_rx_seq_h", this);
    //virtual_seq_h = usb_virtual_sequence::type_id::create("virtual_seq_h", this);
	
	
endfunction:build_phase


   task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_name(), "run_phase", UVM_HIGH)
    phase.raise_objection(this);
     	  virtual_seq_h.start(env_h.v_sqr_h);
	  	  
	  phase.phase_done.set_drain_time(this, 500ns);
          phase.drop_objection(this);
  endtask	
  
 
endclass:mid_reset_test

