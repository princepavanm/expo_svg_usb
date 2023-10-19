///////////////////////////////////////////////////////////////////////////////////////////////////
//    Company:  Expolog Technologies.                                                            //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  buff_mst_agent_sqr                                                  //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  Sequencer                                                           //
//      Description       :  The sequencer controls the flow of request and response             //
//                           sequence items between sequences and the driver.                    //
//                                                                                               //          
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class buff_mst_agent_sqr extends uvm_sequencer#(buff_tx);

  `uvm_component_utils(buff_mst_agent_sqr)

  function new(string name="buff_mst_agent_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:buff_mst_agent_sqr
