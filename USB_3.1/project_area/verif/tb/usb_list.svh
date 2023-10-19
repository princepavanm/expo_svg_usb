///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision tag      :  06/10/2023                                                          //                                                   
//      Project Name      :  USB 3.1                                                             //
//      component name    :  usb_list                                                            //
//      Description       :  All sequence files are listed.                                      //  
//                                                                                               //
//                                                                                               //
//                                                                                               //
//     Additional Comments:                                                                      //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

  //List of Include Files
  `include "reset_intf.sv"
  `include "buff_mst_agent_intf.sv"
  `include "phy_rx_agent_intf.sv"
  
  `include "reset_tx.sv"
  //`include "reset_mon.sv"
  `include "reset_driver.sv"
  `include "reset_agent.sv"

  `include "buff_mst_agent_tx.sv"
  `include "buff_mst_agent_drv.sv"
  `include "buff_mst_agent_sqr.sv"
  `include "buff_mst_agent_cov.sv"
  `include "buff_mst_agent_mon.sv"
  `include "buff_mst_agent.sv"

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
