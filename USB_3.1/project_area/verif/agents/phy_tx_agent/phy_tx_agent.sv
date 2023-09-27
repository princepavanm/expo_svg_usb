///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :                                                                      //
//      Revision tag      :                                                                      //
//      Module Name       :                                                                      //
//      Project Name      :                                                                      //
//      component name    :                                                                      //
//      Description       :	This module provides a test to generate clocks                       //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
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
