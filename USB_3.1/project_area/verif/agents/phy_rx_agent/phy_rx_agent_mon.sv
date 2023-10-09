///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN MOHAMMED_KHADEER LOKESH MADHURA                            //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  phy_rx_agent_mon                                                  //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Monitor                                                             //
//      Description       :  This module a passive component used to capture DUT signals using a //
//                           virtual interface and translate them into a sequence item format    //
//     Additional Comments:                                                                      //
//                                                                                               //
//                                                                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////


class phy_rx_agent_mon extends uvm_monitor;

  `uvm_component_utils(phy_rx_agent_mon)

  phy_rx   tx_h;

  uvm_analysis_port #(phy_rx)       phy_rx_agent_mon_port;

  function new(string name="phy_rx_agent_mon", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    phy_rx_agent_mon_port = new("phy_rx_agent_mon_port", this);
    tx_h = phy_rx::type_id::create("tx_h", this);

  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("phy_rx_agent_mon","Monitor Run Phase", UVM_HIGH)

  endtask:run_phase

endclass:phy_rx_agent_mon
