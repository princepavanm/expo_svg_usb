///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN MOHAMMED_KHADEER LOKESH MADHURA                            //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  phy_tx_agent                                                      //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Agent                                                               //
//      Description       :  This module includes the Sequencer,driver and                       //
//                           monitor.created and connected.                                      //
//     Additional Comments:                                                                      //
//                                                                                               //
//                                                                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class phy_tx_agent extends uvm_agent;

  phy_tx_agent_mon      mon_h; 

  virtual phy_intf     phy_pif;

  `uvm_component_utils(phy_tx_agent)

  function new(string name="phy_tx_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_h = phy_tx_agent_mon::type_id::create("mon_h", this);
  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction:connect_phase

endclass:phy_tx_agent
