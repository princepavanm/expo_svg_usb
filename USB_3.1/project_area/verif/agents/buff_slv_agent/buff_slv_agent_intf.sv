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

interface buff_intf(input logic ext_clk, reset_n);
	
  	bit		reset_n_out; 

 	bit		phy_ulpi_clk;
 	bit    [7:0]	phy_ulpi_d;
 	bit		phy_ulpi_dir;
	bit		phy_ulpi_stp;
  	bit		phy_ulpi_nxt;

  	bit		opt_disable_all;
  	bit		opt_enable_hs;
  	bit		opt_ignore_vbus;
	bit		stat_connected;
	bit		stat_fs;
	bit		stat_hs;
	bit		stat_configured;

  	bit  [8:0]	buf_in_addr;
  	bit  [7:0]	buf_in_data;
  	bit		buf_in_wren;
	 
	bit		buf_in_ready;
  	bit		buf_in_commit;
  	bit  [9:0]	buf_in_commit_len;
	bit		buf_in_commit_ack;
  	bit  [8:0]	buf_out_addr;
	bit  [7:0]	buf_out_q;
	bit  [9:0]	buf_out_len;
	bit		buf_out_hasdata;
  	bit		buf_out_arm;
	bit		buf_out_arm_ack;

	bit		vend_req_act;
	bit  [7:0]	vend_req_request;
	bit  [15:0]	vend_req_val;

	bit		err_crc_pid;
	bit		err_crc_tok;
	bit		err_crc_pkt;
	bit		err_pid_out_of_seq;
	bit		err_setup_pkt;

	bit  [10:0]	dbg_frame_num;
	bit  [1:0]	dbg_linestate;



//********* clocking blocks buff_Driver and buff_monitor ***********//

  clocking buff_driver_cb@(posedge ext_clk);
    default input #1 output #1;

	output		ext_clk;
	output		reset_n;
	input 		reset_n_out;

	output		phy_ulpi_clk;
	inout 		phy_ulpi_d;
	output		phy_ulpi_dir;
	input 		phy_ulpi_stp;
	output		phy_ulpi_nxt;

	output		opt_disable_all;
	output		opt_enable_hs;
	output		opt_ignore_vbus;
	input 		stat_connected;
	input 		stat_fs;
	input 		stat_hs;
	input 		stat_configured;

	output		buf_in_addr;
	output		buf_in_data;
	output		buf_in_wren;
	input 		buf_in_ready;
	output		buf_in_commit;
	output		buf_in_commit_len;
	input 		buf_in_commit_ack;
	output		buf_out_addr;
	input 		buf_out_q;
	input 		buf_out_len;
	input 		buf_out_hasdata;
	output		buf_out_arm;
	input 		buf_out_arm_ack;

	input 		vend_req_act;
	input 		vend_req_request;
	input 		vend_req_val;

	input 		err_crc_pid;
	input 		err_crc_tok;
	input 		err_crc_pkt;
	input 		err_pid_out_of_seq;
	input 		err_setup_pkt;

	input 		dbg_frame_num;
	input 		dbg_linestate;

endclocking

     clocking buff_monitor_cb@(posedge ext_clk);
   	 default input #1 output #1;

	input		ext_clk;
	input		reset_n;
	input 		reset_n_out;

	input		phy_ulpi_clk;
	inout 		phy_ulpi_d;
	input		phy_ulpi_dir;
	input 		phy_ulpi_stp;
	input		phy_ulpi_nxt;

	input		opt_disable_all;
	input		opt_enable_hs;
	input		opt_ignore_vbus;
	input 		stat_connected;
	input 		stat_fs;
	input 		stat_hs;
	input 		stat_configured;

	input		buf_in_addr;
	input		buf_in_data;
	input		buf_in_wren;
	input 		buf_in_ready;
	input		buf_in_commit;
	input		buf_in_commit_len;
	input 		buf_in_commit_ack;
	input 		buf_out_addr;
	input 		buf_out_q;
	input 		buf_out_len;
	input 		buf_out_hasdata;
	input		buf_out_arm;
	input 		buf_out_arm_ack;

	input 		vend_req_act;
	input 		vend_req_request;
	input 		vend_req_val;

	input 		err_crc_pid;
	input 		err_crc_tok;
	input 		err_crc_pkt;
	input 		err_pid_out_of_seq;
	input 		err_setup_pkt;

	input 		dbg_frame_num;
	input   	dbg_linestate;

endclocking

//modport for buff_driver 
  modport BUFF_DRIVER(clocking buff_driver_cb);
    
// modport for buff_monitor
  modport BUFF_MONITOR(clocking buff_monitor_cb);


endinterface:buff_intf
