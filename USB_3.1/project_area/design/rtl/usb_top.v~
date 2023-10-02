`include "usb3_top.v"

`include "usb2_top.v"

//
// usb 3.0 / 2.0 top-level
//
// Copyright (c) 2013 Marshall H.
// All rights reserved.
// This code is released under the terms of the simplified BSD license. 
// See LICENSE.TXT for details.
//

module usb_top (


// clocking and reset signals
input				ext_clk,
input				reset_n,
output				reset_n_out,
output				clk_125_out,

// signals specific to usb 3.0
input				phy_pipe_pclk,
input		[15:0]	phy_pipe_rx_data,
input		[1:0]	phy_pipe_rx_datak,
input				phy_pipe_rx_valid,
output				phy_pipe_tx_clk,
output		[15:0]	phy_pipe_tx_data,
output		[1:0]	phy_pipe_tx_datak,

output				phy_reset_n,
output				phy_out_enable,
output				phy_phy_reset_n,
output				phy_tx_detrx_lpbk,
output				phy_tx_elecidle,
inout				phy_rx_elecidle,
input		[2:0]	phy_rx_status,
output		[1:0]	phy_power_down,
inout				phy_phy_status,
input				phy_pwrpresent,

output				phy_tx_oneszeros,
output		[1:0]	phy_tx_deemph,
output		[2:0]	phy_tx_margin,
output				phy_tx_swing,
output				phy_rx_polarity,
output				phy_rx_termination,
output				phy_rate,
output				phy_elas_buf_mode,



// signals specific to usb 2.0

input				phy_ulpi_clk,
inout		[7:0]	phy_ulpi_d,
input				phy_ulpi_dir,
output				phy_ulpi_stp,
input				phy_ulpi_nxt,

input				opt_disable_all,
input				opt_enable_hs,
input				opt_ignore_vbus,
output				stat_connected,
output				stat_fs,
output				stat_hs,
output				stat_configured,

input		[8:0]	buf_in_addr,
input		[7:0]	buf_in_data,
input				buf_in_wren,
output				buf_in_ready,
input				buf_in_commit,
input		[9:0]	buf_in_commit_len,
output				buf_in_commit_ack,
input		[8:0]	buf_out_addr,
output		[7:0]	buf_out_q,
output		[10:0]	buf_out_len,
output				buf_out_hasdata,
input				buf_out_arm,
output				buf_out_arm_ack,

output				vend_req_act,
output		[7:0]	vend_req_request,
output		[15:0]	vend_req_val,

output				err_crc_pid,
output				err_crc_tok,
output				err_crc_pkt,
output				err_pid_out_of_seq,
output				err_setup_pkt,

output		[10:0]	dbg_frame_num,
output		[1:0]	dbg_linestate

);                                     
endmodule                               
	
