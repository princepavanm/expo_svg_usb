///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMAD_KHADEER, LOKESH, MADHURA.                        //     
//      Revision tag      :  06/10/2023                                                          //     
//      Module Name       :  usb_env                                                             //     
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Environment                                                         //
//      Description       :  This module covered all agents and virtual sequencer.               //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class usb_env extends uvm_env;
  
  `uvm_component_utils(usb_env)

  reset_agent		reset_agent_h;
  buff_mst_agent	buff_mst_agent_h;
  phy_rx_agent		phy_rx_agent_h;

  usb_virtual_sqr 	v_sqr_h;

  function new(string name="usb_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    v_sqr_h = usb_virtual_sqr::type_id::create("v_sqr_h", this);

    reset_agent_h = reset_agent::type_id::create("reset_agent_h", this);
    buff_mst_agent_h = buff_mst_agent::type_id::create("buff_mst_agent_h", this);
    phy_rx_agent_h = phy_rx_agent::type_id::create("phy_rx_agent_h", this);
	
  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    v_sqr_h.reset_sqr_h 	      = reset_agent_h.reset_sqr_h;
    v_sqr_h.buff_mst_agent_sqr_h  = buff_mst_agent_h.sqr_h;
    v_sqr_h.phy_rx_agent_sqr_h    = phy_rx_agent_h.sqr_h;
  endfunction:connect_phase

endclass:usb_env
