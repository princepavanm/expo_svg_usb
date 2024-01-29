///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company           :  Expolog Technologies.                                               //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  reset_intf                                                          //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  Interface                                                           //
//      Description       :  This module cover signals for interface .                           //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

interface reset_intf(input clk_i);

  logic			reset_n;

  clocking reset_cb@(posedge clk_i);
    default input #1 output #1;
    output reset_n;
  endclocking : reset_cb

  modport DUT (clocking reset_cb);
  
endinterface: reset_intf

