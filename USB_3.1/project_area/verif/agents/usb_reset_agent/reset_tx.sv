///////////////////////////////////////////////////////////////////////////////////////////////////
//    Company:  Expolog Technologies.                                                            //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          : ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                         //
//      Revision Tag      : 06/10/2023                                                           //
//      Module Name       : reset_tr                                                             //
//      Project Name      : USB 3.1                                                              //
//      Component Name    : uvm_sequence_item                                                    //
//      Description       : This module having the signals declarations and field declarations.  //
//                                                                                               //
//                                                                                               //           
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class reset_tr extends uvm_sequence_item;
  
  typedef enum {DEASSERT, ASSERT} kind_e;
  rand kind_e kind;
  rand int unsigned cycles =1;
  rand bit  phy_ulpi_dir;
  rand bit[7:0] phy_ulpi_d;
  rand bit phy_ulpi_nxt; 
  rand bit opt_enable_hs; 
  rand bit dbg_linestate; 
  rand bit se0_reset; 
  rand bit phy_stp_out; 
  
 
 `uvm_object_utils_begin(reset_tr)
    `uvm_field_enum(kind_e, kind, UVM_ALL_ON)
    `uvm_field_int(cycles, UVM_ALL_ON)
    `uvm_field_int(phy_ulpi_nxt, UVM_ALL_ON)
    `uvm_field_int(phy_ulpi_d, UVM_ALL_ON)
    `uvm_field_int(dbg_linestate, UVM_ALL_ON)
    `uvm_field_int(se0_reset, UVM_ALL_ON)
    `uvm_field_int(phy_stp_out, UVM_ALL_ON)
    `uvm_field_int(opt_enable_hs, UVM_ALL_ON)
    `uvm_field_int(phy_ulpi_dir, UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "reset_tr");
    super.new(name);
    `uvm_info("RESET_TX",$sformatf("%m"),UVM_HIGH);
  endfunction
 
endclass

