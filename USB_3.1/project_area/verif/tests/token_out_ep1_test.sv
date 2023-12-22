///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  token_in_test                                                       //
//      Project Name      :  USB 3.1                                                             /et nu
//
//      Component Name    :  token_in_test                                                       //
//      Description       :	 This module provides a test to generate clocks                      //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////
 //`include "usb_base_test.sv"

class token_out_ep1_test extends usb_base_test;

  `uvm_component_utils(token_out_ep1_test)


  token_out_ep1_seq      token_out_ep1_h;


  function new(string name="token_out_ep1_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	
	token_out_ep1_h=token_out_ep1_seq::type_id::create("token_out_ep1_h", this);

  endfunction:build_phase


   task run_phase (uvm_phase phase);
    //super.run_phase(phase);
    `uvm_info(get_name(), "run_phase", UVM_HIGH)
    phase.raise_objection(this);
     	  virtual_seq_h.start(env_h.v_sqr_h);
	  	  
	  phase.phase_done.set_drain_time(this, 500ns);
          phase.drop_objection(this);
  endtask	
  
 
endclass:token_out_ep1_test

