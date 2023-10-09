///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN MOHAMMED_KHADEER LOKESH MADHURA                            //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  reset_agent                                                         //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Agent                                                               //
//      Description       :  This module includes the Sequencer,driver and                       //
//                           monitor.created and connected.                                      //
//     Additional Comments:                                                                      //
//                                                                                               //
//                                                                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

typedef uvm_sequencer#(reset_tr) reset_sqr;

class reset_agent extends uvm_agent;

  `uvm_component_utils(reset_agent)
  
  //reset_mon      	  reset_mon_h; 

  virtual reset_intf      reset_pif;

  reset_drv       	  reset_drv_h; 
  reset_sqr     	  reset_sqr_h;

  function new(string name="reset_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    //reset_mon_h = reset_mon::type_id::create("reset_mon_h", this);
    reset_drv_h = reset_drv::type_id::create("reset_drv_h", this);
    reset_sqr_h = reset_sqr::type_id::create("reset_sqr_h", this);

    if(!uvm_config_db#(virtual reset_intf)::get(this,"","reset_pif",reset_pif))
      `uvm_fatal("RESET_AGENT", "***** Could not get reset_pif *****")

    uvm_config_db#(virtual reset_intf)::set(this,"*","reset_pif",reset_pif);
  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
      reset_drv_h.seq_item_port.connect(reset_sqr_h.seq_item_export);
  endfunction:connect_phase

endclass:reset_agent
