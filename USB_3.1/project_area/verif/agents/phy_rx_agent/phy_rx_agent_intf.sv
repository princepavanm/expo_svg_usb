///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  phy_intf                                                           //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Interface                                                           //
//      Description       :  This module cover signals for interface .                           //
//     Additional Comments:                                                                      //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

interface phy_intf( input logic  reset_n,
                    input logic  ext_clk,
                    input logic  phy_pipe_pclk,
                    input logic  phy_ulpi_clk  );

  logic		clk_125_out;
  logic		reset_n_out;
  //logic	phy_pipe_pclk
  logic	[15:0]	phy_pipe_rx_data;
  logic	[1:0]	phy_pipe_rx_datak;
  logic		phy_pipe_rx_valid;
  logic		phy_pipe_tx_clk;
  logic	[15:0]	phy_pipe_tx_data;
  logic	[1:0]	phy_pipe_tx_datak;
  
  logic		phy_reset_n;
  logic		phy_out_enable;
  logic		phy_phy_reset_n;
  logic		phy_tx_detrx_lpbk;
  logic		phy_tx_elecidle;
  wand		phy_rx_elecidle;  
  logic	[2:0]	phy_rx_status;
  logic	[1:0]	phy_power_down;
  wand		phy_phy_status;
  logic		phy_pwrpresent;
  
  logic		phy_tx_oneszeros;
  logic	[1:0]	phy_tx_deemph;
  logic	[2:0]	phy_tx_margin;
  logic		phy_tx_swing;
  logic		phy_rx_polarity;
  logic		phy_rx_termination;
  logic		phy_rate;
  logic		phy_elas_buf_mode;
  
  logic	[8:0]	buf_in_addr;
  logic	[7:0]	buf_in_data;
  logic		buf_in_wren;
  logic		buf_in_request;
  logic		buf_in_ready;
  logic		buf_in_commit;
  logic	[9:0]	buf_in_commit_len;
  logic		buf_in_commit_ack;
  
  logic	[8:0]	buf_out_addr;
  logic	[7:0]	buf_out_q;
  logic	[10:0]	buf_out_len;
  logic		buf_out_hasdata;
  logic		buf_out_arm;
  logic		buf_out_arm_ack;
  
  logic		vend_req_act;
  logic	[7:0]	vend_req_request;
  logic	[15:0]	vend_req_val;

  //*********  clocking blocks phy_rx_Driver  ***********//

  clocking phy_rx_driver_cb@(posedge ext_clk);
    default input #1 output #1;

    output	ext_clk;
    input	clk_125_out;
    output	reset_n;
    input	reset_n_out;
    
    output	phy_pipe_pclk;
    output	phy_pipe_rx_data;
    output	phy_pipe_rx_datak;
    output	phy_pipe_rx_valid;
    input	phy_pipe_tx_clk;
    input	phy_pipe_tx_data;
    input	phy_pipe_tx_datak;
    
    input	phy_reset_n;
    input	phy_out_enable;
    input	phy_phy_reset_n;
    input	phy_tx_detrx_lpbk;
    input	phy_tx_elecidle;
    inout	phy_rx_elecidle;
    output	phy_rx_status;
    input	phy_power_down;
    inout	phy_phy_status;
    output	phy_pwrpresent;
    
    input	phy_tx_oneszeros;
    input	phy_tx_deemph;
    input	phy_tx_margin;
    input	phy_tx_swing;
    input	phy_rx_polarity;
    input	phy_rx_termination;
    input	phy_rate;
    input	phy_elas_buf_mode;
    
    output	buf_in_addr;
    output	buf_in_data;
    output	buf_in_wren;
    input	buf_in_request;
    input	buf_in_ready;
    output	buf_in_commit;
    output	buf_in_commit_len;
    input	buf_in_commit_ack;
    
    output	buf_out_addr;
    input	buf_out_q;
    input	buf_out_len;
    input	buf_out_hasdata;
    output	buf_out_arm;
    input	buf_out_arm_ack;
    
    input	vend_req_act;
    input	vend_req_request;
    input	vend_req_val;
  
  endclocking
 
  //*********  clocking blocks phy_rx_monitor  ***********//
  
  clocking phy_rx_monitor_cb@(posedge ext_clk);
    default input #1 output #1;
  
    input	ext_clk;
    input	clk_125_out;
    input	reset_n;
    input	reset_n_out;
    
    input	phy_pipe_pclk;
    input	phy_pipe_rx_data;
    input	phy_pipe_rx_datak;
    input	phy_pipe_rx_valid;
    input	phy_pipe_tx_clk;
    input   	phy_pipe_tx_data;
    input	phy_pipe_tx_datak;
    
    input	phy_reset_n;
    input	phy_out_enable;
    input	phy_phy_reset_n;
    input	phy_tx_detrx_lpbk;
    input	phy_tx_elecidle;
    inout	phy_rx_elecidle;
    input	phy_rx_status;
    input	phy_power_down;
    inout	phy_phy_status;
    input	phy_pwrpresent;
    
    input	phy_tx_oneszeros;
    input	phy_tx_deemph;
    input	phy_tx_margin;
    input   	phy_tx_swing;
    input	phy_rx_polarity;
    input	phy_rx_termination;
    input	phy_rate;
    input	phy_elas_buf_mode;
    
    input	buf_in_addr;
    input	buf_in_data;
    input	buf_in_wren;
    input	buf_in_request;
    input	buf_in_ready;
    input	buf_in_commit;
    input	buf_in_commit_len;
    input	buf_in_commit_ack;
    
    input	buf_out_addr;
    input	buf_out_q;
    input	buf_out_len;
    input	buf_out_hasdata;
    input	buf_out_arm;
    input	buf_out_arm_ack;
    
    input	vend_req_act;
    input	vend_req_request;
    input	vend_req_val;

  endclocking

//modport for buff_driver 
  modport PHY_DRIVER(clocking phy_rx_driver_cb);
    
// modport for buff_monitor
  modport PHY_MONITOR(clocking phy_rx_monitor_cb);

endinterface:phy_intf

