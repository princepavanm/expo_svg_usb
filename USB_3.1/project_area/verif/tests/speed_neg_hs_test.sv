///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  speed_neg_hs_test                                                       //
//      Project Name      :  USB 3.1                                                             /et nu
//
//      Component Name    :  speed_neg_hs_test                                                       //
//      Description       :	 This module provides a test to generate clocks                      //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
 //`include "usb_base_test.sv"

class speed_neg_hs_test extends usb_base_test;

  `uvm_component_utils(speed_neg_hs_test)


  
  function new(string name="speed_neg_hs_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	

  endfunction:build_phase


   task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_name(), "run_phase", UVM_HIGH)
    phase.raise_objection(this);
     	  virtual_seq_h.start(env_h.v_sqr_h);
	  	  
	  phase.phase_done.set_drain_time(this, 500ns);
          phase.drop_objection(this);
  endtask	
  
 
endclass:speed_neg_hs_test


