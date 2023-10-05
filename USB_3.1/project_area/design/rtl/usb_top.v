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

/***************************usb3_top instatiation *************************/

usb3_top usb3_top_inst (
	.ext_clk		    		(ext_clk),
	.clk_125_out    	    	(clk_125_out),         
	.reset_n  	            	(reset_n),
	.reset_n_out                (reset_n_out),
	.phy_pipe_pclk              (phy_pipe_pclk),
	.phy_pipe_rx_data           (phy_pipe_rx_data),
	.phy_pipe_rx_datak          (phy_pipe_rx_datak),
	.phy_pipe_rx_valid          (phy_pipe_rx_valid),
	.phy_pipe_tx_clk            (phy_pipe_tx_clk),
	.phy_pipe_tx_data           (phy_pipe_tx_data),
	.phy_pipe_tx_datak          (phy_pipe_tx_datak),
                                
	.phy_reset_n                (phy_reset_n),                        
	.phy_out_enable            	(phy_out_enable),
	.phy_phy_reset_n           	(phy_phy_reset_n),
	.phy_tx_detrx_lpbk         	(phy_tx_detrx_lpbk),
	.phy_tx_elecidle           	(phy_tx_elecidle),
	.phy_rx_elecidle           	(phy_rx_elecidle),
	.phy_rx_status             	(phy_rx_status),
	.phy_power_down            	(phy_power_down),
	.phy_phy_status            	(phy_phy_status),
	.phy_pwrpresent            	(phy_pwrpresent),   
	.phy_tx_oneszeros          	(phy_tx_oneszeros),                   
	.phy_tx_deemph             	(phy_tx_deemph),
	.phy_tx_margin             	(phy_tx_margin),
	.phy_tx_swing              	(phy_tx_swing),
	.phy_rx_polarity           	(phy_rx_polarity),
	.phy_rx_termination        	(phy_rx_termination),
	.phy_rate                  	(phy_rate),
	.phy_elas_buf_mode         	(phy_elas_buf_mode),
                                 
	.buf_in_addr				(buf_in_addr),       	
	.buf_in_data	           	(buf_in_data),
	.buf_in_wren	           	(buf_in_wren),
	.buf_in_ready	   			(buf_in_ready),
	.buf_in_commit	    		(buf_in_commit),
	.buf_in_commit_len			(buf_in_commit_len),
	.buf_in_commit_ack			(buf_in_commit_ack),
	                   	        
	.buf_out_addr               (buf_out_addr),    
	.buf_out_q        	       	(buf_out_q),       
	.buf_out_len      	       	(buf_out_len),     
	.buf_out_hasdata  	       	(buf_out_hasdata), 
	.buf_out_arm      	       	(buf_out_arm),     
	.buf_out_arm_ack  	       	(buf_out_arm_ack),                    
	                   	       	 
	.vend_req_act               (vend_req_act),      
	.vend_req_request 	       	(vend_req_request),  
	.vend_req_val      	       	(vend_req_val));                              
	             			
/***************************usb2_top instatiation *************************/	
						
usb2_top usb2_inst (

	.ext_clk					(ext_clk),
	.reset_n					(reset_n),
	.reset_n_out				(reset_n_out),
	.phy_ulpi_clk				(phy_ulpi_clk),
	.phy_ulpi_d					(phy_ulpi_d),
	.phy_ulpi_dir				(phy_ulpi_dir),
	.phy_ulpi_stp				(phy_ulpi_stp),
	.phy_ulpi_nxt				(phy_ulpi_nxt),
	.opt_disable_all			(opt_disable_all),
	.opt_enable_hs				(opt_enable_hs),
	.opt_ignore_vbus			(opt_ignore_vbus),
	.stat_connected				(stat_connected),
	.stat_fs					(stat_fs),
	.stat_hs					(stat_hs),
	.stat_configured			(stat_configured),
	.buf_in_addr				(buf_in_addr),
	.buf_in_data				(buf_in_data),
	.buf_in_wren				(buf_in_wren),
	.buf_in_ready				(buf_in_ready),
	.buf_in_commit				(buf_in_commit),
	.buf_in_commit_len			(buf_in_commit_len),
	.buf_in_commit_ack			(buf_in_commit_ack),
	.buf_out_addr				(buf_out_addr),
	.buf_out_q					(buf_out_q),
	.buf_out_len				(buf_out_len),
	.buf_out_hasdata			(buf_out_hasdata),
	.buf_out_arm				(buf_out_arm),
	.buf_out_arm_ack			(buf_out_arm_ack),
	.vend_req_act				(vend_req_act),
	.vend_req_request			(vend_req_request),
    .vend_req_val				(vend_req_val),
	.err_crc_pid				(err_crc_pid),
	.err_crc_tok				(err_crc_tok),
	.err_crc_pkt				(err_crc_pkt),
	.err_pid_out_of_seq			(err_pid_out_of_seq),
	.err_setup_pkt				(err_setup_pkt),
	.dbg_frame_num				(dbg_frame_num),
	.dbg_linestate				(dbg_linestate)
	
	);
                                
                                        
endmodule                               
	                              
	
