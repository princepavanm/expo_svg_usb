///////////////////////////////////////////////////////////////////////////////////////////////////
//    Company:  Expolog Technologies.                                                            //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          : ANGAPPAN, MOHAMMAD_KHADEER, LOKESH AND MADHURA.                      //
//      Revision tag      : 06/10/2023                                                           //
//      Module Name       : phy_rx                                                              //
//      Project Name      : USB 3.1                                                              //
//      component name    : Sequence_item                                                        //
//      Description       : This module having the signals declarations and field declarations.  //           
//     Additional Comments:                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////

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
