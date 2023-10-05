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

class usb_virtual_sqr extends uvm_sequencer;
  
  `uvm_component_utils(usb_virtual_sqr)

  reset_sqr  		    reset_sqr_h; 
  buff_mst_agent_sqr 	buff_mst_agent_sqr_h;
  phy_rx_agent_sqr 	 	phy_rx_agent_sqr_h;

  function new(string name="usb_virtual_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    reset_sqr_h = reset_sqr::type_id::create("reset_sqr_h", this);
    buff_mst_agent_sqr_h = buff_mst_agent_sqr::type_id::create("buff_mst_agent_sqr_h", this);
    phy_rx_agent_sqr_h = phy_rx_agent_sqr::type_id::create("phy_rx_agent_sqr_h", this);
  endfunction:build_phase
    
endclass:usb_virtual_sqr
