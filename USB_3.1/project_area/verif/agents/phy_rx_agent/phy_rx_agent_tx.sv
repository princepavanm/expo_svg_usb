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

class phy_rx extends uvm_sequence_item;

  rand bit [15:0] 	phy_pipe_rx_data;
  rand bit [1:0]  	phy_pipe_rx_datak;
  rand bit 		phy_pipe_rx_valid;
  rand bit [2:0]	phy_rx_status;
  rand bit 		phy_pwrpresent;               

  `uvm_object_utils_begin(phy_rx)
    `uvm_field_int( phy_pipe_rx_data  , UVM_DEFAULT )
    `uvm_field_int( phy_pipe_rx_datak , UVM_DEFAULT )
    `uvm_field_int( phy_pipe_rx_valid , UVM_DEFAULT )
    `uvm_field_int( phy_rx_status     , UVM_DEFAULT )
    `uvm_field_int( phy_pwrpresent    , UVM_DEFAULT )
  `uvm_object_utils_end

  function new(input string name="phy_rx");
    super.new(name);
  endfunction : new

endclass
