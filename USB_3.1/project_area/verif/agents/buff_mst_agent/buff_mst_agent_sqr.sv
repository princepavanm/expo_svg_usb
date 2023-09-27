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

class buff_mst_agent_sqr extends uvm_sequencer#(buff_tx);

  `uvm_component_utils(buff_mst_agent_sqr)

  function new(string name="buff_mst_agent_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:buff_mst_agent_sqr
