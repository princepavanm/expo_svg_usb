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

class phy_rx_agent_cov extends uvm_subscriber#(phy_tx);

  `uvm_component_utils(phy_rx_agent_cov)

  uvm_analysis_imp#(phy_tx, phy_rx_agent_cov)       phy_rx_agent_cov_port;

  phy_tx   tx_h;

  covergroup cg();

    // Implement Cover bins here

  endgroup:cg

  function new(string name="phy_rx_agent_cov", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    phy_rx_agent_cov_port = new("phy_rx_agent_cov_port", this);
    tx_h = phy_tx::type_id::create("tx_h", this);
  endfunction:build_phase

  function void write(phy_tx   t);

    `uvm_info("phy_rx_agent_COV", "From Coverage Write function", UVM_LOW)

  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("phy_rx_agent_COV","From Coverage Run Phase", UVM_LOW)

  endtask:run_phase

endclass:phy_rx_agent_cov