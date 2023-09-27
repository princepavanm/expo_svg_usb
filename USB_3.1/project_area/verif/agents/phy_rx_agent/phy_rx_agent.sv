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

class phy_rx_agent extends uvm_agent;

  phy_rx_agent_mon      mon_h; 

  virtual phy_intf     phy_pif;

  phy_rx_agent_drv      drv_h; 
  phy_rx_agent_sqr      sqr_h; 
  phy_rx_agent_cov      cov_h; 

  `uvm_component_utils(phy_rx_agent)

  function new(string name="phy_rx_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     mon_h = phy_rx_agent_mon::type_id::create("mon_h", this);

     drv_h = phy_rx_agent_drv::type_id::create("drv_h", this);
     sqr_h = phy_rx_agent_sqr::type_id::create("sqr_h", this);
     cov_h = phy_rx_agent_cov::type_id::create("cov_h", this);

    if(!uvm_config_db#(virtual phy_intf)::get(this," ","phy_pif",phy_pif))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
    uvm_config_db#(virtual phy_intf)::set(this,"*","phy_pif",phy_pif);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    drv_h.seq_item_port.connect(sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:phy_rx_agent
