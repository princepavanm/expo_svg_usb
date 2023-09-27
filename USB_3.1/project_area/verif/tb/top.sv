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

`timescale 1ns/1ns;
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //include test library
  include "usb_list.svh";

module top;

//Rst and clock declarations
  reg ext_clk, reset_n;
  reg phy_pipe_pclk;

//Interface instantation
  buff_intf buff_pif(ext_clk, reset_n);
  phy_intf phy_pif(phy_pipe_pclk);

//Rst and Clock generation
  initial begin

    ext_clk = 0;
    phy_pipe_pclk = 0;

    reset_n = 1;
    #7.0;	reset_n = 0;

    #500us;
    $finish();
  end

  always #5.0 ext_clk = ~ext_clk;
  always #5.0 phy_pipe_pclk = ~phy_pipe_pclk;

//DUT Instantiation
//  usb dut();

//Register interfaces to config_db
  initial begin

    uvm_config_db#(virtual buff_intf)::set(null,"*","buff_pif",buff_pif);
    uvm_config_db#(virtual phy_intf)::set(null,"*","phy_pif",phy_pif);

  end

//Run test
  initial begin
    run_test();
  end

endmodule:top
