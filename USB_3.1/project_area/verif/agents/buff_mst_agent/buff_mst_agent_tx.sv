///////////////////////////////////////////////////////////////////////////////////////////////////
//    Company:  Expolog Technologies.                                                            //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  buff_tx                                                             //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  uvm_sequence_item                                                   //
//      Description       :  This module having the signals declarations and field declarations. //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class buff_tx extends uvm_sequence_item;
	
  rand bit         reset_n;
  rand bit [8:0]   buf_in_addr;
  rand bit [7:0]   buf_in_data;
  rand bit 	   buf_in_wren;
  rand bit         sop;
  rand bit         eop;
  rand bit [10:0]  buf_in_commit_len;
  rand bit [8:0]   buf_out_addr;                // interpacket gap

  `uvm_object_utils_begin(buff_tx)
    `uvm_field_int( reset_n           , UVM_DEFAULT )
    `uvm_field_int( buf_in_addr       , UVM_DEFAULT )
    `uvm_field_int( buf_in_data       , UVM_DEFAULT )
    `uvm_field_int( buf_in_wren       , UVM_DEFAULT )
    `uvm_field_int( sop               , UVM_DEFAULT )
    `uvm_field_int( eop               , UVM_DEFAULT )
    `uvm_field_int( buf_in_commit_len , UVM_DEFAULT )
    `uvm_field_int( buf_out_addr      , UVM_DEFAULT )
   `uvm_object_utils_end

  function new(input string name="buff_tx");
    super.new(name);
  endfunction : new

endclass
