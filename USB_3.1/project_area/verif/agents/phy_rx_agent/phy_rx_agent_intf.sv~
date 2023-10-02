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

interface phy_intf(input logic phy_pipe_pclk);

	
	bit		ext_clk;
	bit		clk_125_out;
	bit		reset_n;
	bit		reset_n_out;
//	bit		phy_pipe_pclk
	bit	[15:0]	phy_pipe_rx_data;
	bit	[1:0]	phy_pipe_rx_datak;
	bit		phy_pipe_rx_valid;
	bit		phy_pipe_tx_clk;
	bit	[15:0]	phy_pipe_tx_data;
	bit	[1:0]	phy_pipe_tx_datak;

	bit		phy_reset_n;
	bit		phy_out_enable;
	bit		phy_phy_reset_n;
	bit		phy_tx_detrx_lpbk;
	bit		phy_tx_elecidle;
	wand		phy_rx_elecidle;  
	bit	[2:0]	phy_rx_status;
	bit	[1:0]	phy_power_down;
	wand		phy_phy_status;
	bit		phy_pwrpresent;

	bit		phy_tx_oneszeros;
	bit	[1:0]	phy_tx_deemph;
	bit	[2:0]	phy_tx_margin;
	bit		phy_tx_swing;
	bit		phy_rx_polarity;
	bit		phy_rx_termination;
	bit		phy_rate;
	bit		phy_elas_buf_mode;

	bit	[8:0]	buf_in_addr;
	bit	[7:0]	buf_in_data;
	bit		buf_in_wren;
	bit		buf_in_request;
	bit		buf_in_ready;
	bit		buf_in_commit;
	bit	[9:0]	buf_in_commit_len;
	bit		buf_in_commit_ack;

	bit	[8:0]	buf_out_addr;
	bit	[7:0]	buf_out_q;
	bit	[10:0]	buf_out_len;
	bit		buf_out_hasdata;
	bit		buf_out_arm;
	bit		buf_out_arm_ack;

	bit		vend_req_act;
	bit	[7:0]	vend_req_request;
	bit	[15:0]	vend_req_val;


  //********* clocking blocks phy_rx_Driver and phy_rx_monitor ***********//

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
	input   phy_pipe_tx_data;
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
	input   phy_tx_swing;
	input	phy_rx_polarity;
	input	phy_rx_termination;
	input	phy_rate;
	input	phy_elas_buf_mode;

	input	buf_in_addr;
	input		buf_in_data;
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
