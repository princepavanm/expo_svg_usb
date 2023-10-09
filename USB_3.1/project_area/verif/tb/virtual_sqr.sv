///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  Angappan	Mohammad_Khadeer Lokesh Madhura                          //     
//      Revision tag      :  06/10/2023                                                          //     
//      Module Name       :  usb_virtual_sqr                                                     /1/     
//      Project Name      :  USB 3.1                                                             //
//      component name    :  virtual sequencer.                                                  //
//      Description       : This module covered all sequencer                                    //
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
