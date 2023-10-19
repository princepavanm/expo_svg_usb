///////////////////////////////////////////////////////////////////////////////////////////////////
//    Company:  Expolog Technologies.                                                            //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  phy_rx_agent_sqr                                                    //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  uvm_sequencer                                                       //
//      Description       :  The sequencer controls the flow of request and response             //
//                           sequence items between sequences and the driver.                    //
//                                                                                               //           
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class phy_rx_agent_sqr extends uvm_sequencer#(phy_rx);

  `uvm_component_utils(phy_rx_agent_sqr)

  function new(string name="phy_rx_agent_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:phy_rx_agent_sqr
