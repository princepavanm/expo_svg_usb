///////////////////////////////////////////////////////////////////////////////////////////////////
//    Company:  Expolog Technologies.                                                            //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          : ANGAPPAN, MOHAMMAD_KHADEER, LOKESH AND MADHURA.                      //
//      Revision tag      : 06/10/2023                                                           //
//      Module Name       : reset_tr                                                              //
//      Project Name      : USB 3.1                                                              //
//      component name    : Sequence_item                                                        //
//      Description       : This module having the signals declarations and field declarations.  //           
//     Additional Comments:                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////


class reset_tr extends uvm_sequence_item;
  
  typedef enum {DEASSERT, ASSERT} kind_e;
  rand kind_e kind;
  rand int unsigned cycles =1;
  rand bit  phy_ulpi_dir;
  
  `uvm_object_utils_begin(reset_tr)
    `uvm_field_enum(kind_e, kind, UVM_ALL_ON)
    `uvm_field_int(cycles, UVM_ALL_ON)
    `uvm_field_int(phy_ulpi_dir, UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "reset_tr");
    super.new(name);
    `uvm_info("RESET_TX",$sformatf("%m"),UVM_HIGH);
  endfunction
 
endclass

