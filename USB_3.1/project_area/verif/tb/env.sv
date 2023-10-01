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

class usb_env extends uvm_env;
  `uvm_component_utils(usb_env)

  usb_reset_agent	usb_reset_agent_h;
  buff_mst_agent	buff_mst_agent_h;
  phy_rx_agent	phy_rx_agent_h;

  usb_virtual_sqr 	 v_sqr_h;

  function new(string name="usb_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    v_sqr_h = usb_virtual_sqr::type_id::create("v_sqr_h", this);

    usb_reset_agent_h = usb_reset_agent::type_id::create("usb_reset_agent_h", this);
    buff_mst_agent_h = buff_mst_agent::type_id::create("buff_mst_agent_h", this);
    phy_rx_agent_h = phy_rx_agent::type_id::create("phy_rx_agent_h", this);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    v_sqr_h.reset_seqr_h = usb_reset_agent_h.reset_seqr_h;
    v_sqr_h.buff_mst_agent_sqr_h = buff_mst_agent_h.sqr_h;
    v_sqr_h.phy_rx_agent_sqr_h = phy_rx_agent_h.sqr_h;

  endfunction:connect_phase

  

  
endclass:usb_env
