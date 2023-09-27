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

class phy_rx_agent_sqr extends uvm_sequencer#(phy_tx);

  `uvm_component_utils(phy_rx_agent_sqr)

  function new(string name="phy_rx_agent_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:phy_rx_agent_sqr
