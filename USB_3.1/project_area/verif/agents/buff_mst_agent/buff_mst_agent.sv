///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN MOHAMMED_KHADEER LOKESH MADHURA                            //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  buff_mst_agent                                                      //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Agent                                                               //
//      Description       :  This module includes the Sequencer,driver and                       //
//                           monitor.created and connected.                                      //
//     Additional Comments:                                                                      //
//                                                                                               //
//                                                                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class buff_mst_agent extends uvm_agent;

  buff_mst_agent_mon      mon_h; 

  virtual buff_intf     buff_pif;

  buff_mst_agent_drv      drv_h; 
  buff_mst_agent_sqr      sqr_h; 
  buff_mst_agent_cov      cov_h; 

  `uvm_component_utils(buff_mst_agent)

  function new(string name="buff_mst_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     mon_h = buff_mst_agent_mon::type_id::create("mon_h", this);

     drv_h = buff_mst_agent_drv::type_id::create("drv_h", this);
     sqr_h = buff_mst_agent_sqr::type_id::create("sqr_h", this);
     cov_h = buff_mst_agent_cov::type_id::create("cov_h", this);

    if(!uvm_config_db#(virtual buff_intf)::get(this," ","buff_pif",buff_pif))
      `uvm_fatal("AGENT", "***** Could not get vif *****")

    uvm_config_db#(virtual buff_intf)::set(this,"*","buff_pif",buff_pif);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    drv_h.seq_item_port.connect(sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:buff_mst_agent
