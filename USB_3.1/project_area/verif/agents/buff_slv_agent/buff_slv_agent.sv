///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  buff_slv_agent                                                      //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  uvm_agent                                                           //
//      Description       :  This module creations for functional coverage                       //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class buff_slv_agent extends uvm_agent;

  buff_slv_agent_mon      mon_h; 

  virtual buff_intf     buff_pif;

  `uvm_component_utils(buff_slv_agent)

  function new(string name="buff_slv_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     mon_h = buff_slv_agent_mon::type_id::create("mon_h", this);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction:connect_phase

endclass:buff_slv_agent
