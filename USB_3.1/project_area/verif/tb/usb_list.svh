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

//List of Include Files
  `include "buff_mst_agent_intf.sv"
  `include "phy_rx_agent_intf.sv"

  
  `include "buff_mst_agent_tx.sv"
  `include "buff_mst_agent_drv.sv"
  `include "buff_mst_agent_sqr.sv"
  `include "buff_mst_agent_cov.sv"
  `include "buff_mst_agent_mon.sv"
  `include "buff_mst_agent.sv"

  `include "usb_reset_driver.sv"
  `include "usb_reset_agent.sv"

  `include "phy_rx_agent_tx.sv"
  `include "phy_rx_agent_drv.sv"
  `include "phy_rx_agent_sqr.sv"
  `include "phy_rx_agent_cov.sv"
  `include "phy_rx_agent_mon.sv"
  `include "phy_rx_agent.sv"

  `include "buff_slv_agent_mon.sv"
  `include "buff_slv_agent.sv"

  `include "phy_tx_agent_mon.sv"
  `include "phy_tx_agent.sv"

  `include "virtual_sqr.sv"
     
// Sequence List
  `include "../seqs/sequence_list.sv"
  `include "env.sv"
  `include "virtual_sequence.sv"

// Test List
  `include "../tests/test_list.sv"
