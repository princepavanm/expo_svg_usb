`include "usb3_top.v"

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
input	wire			ext_clk,
input	wire			reset_n,
output	wire			reset_n_out,
output	wire			clk_125_out,

// signals specific to usb 3.0
input	wire			phy_pipe_pclk,
input	wire	[15:0]		phy_pipe_rx_data,
input	wire	[1:0]		phy_pipe_rx_datak,
input	wire			phy_pipe_rx_valid,
output	wire			phy_pipe_tx_clk,
output	wire	[15:0]		phy_pipe_tx_data,
output	wire	[1:0]		phy_pipe_tx_datak,

output	wire			phy_reset_n,
output	wire			phy_out_enable,
output	wire			phy_phy_reset_n,
output	wire			phy_tx_detrx_lpbk,
output	wire			phy_tx_elecidle,
inout	wire			phy_rx_elecidle,
input	wire	[2:0]		phy_rx_status,
output	wire	[1:0]		phy_power_down,
inout	wire			phy_phy_status,
input	wire			phy_pwrpresent,

output	wire			phy_tx_oneszeros,
output	wire	[1:0]		phy_tx_deemph,
output	wire	[2:0]		phy_tx_margin,
output	wire			phy_tx_swing,
output	wire			phy_rx_polarity,
output	wire			phy_rx_termination,
output	wire			phy_rate,
output	wire			phy_elas_buf_mode,



// signals specific to usb 2.0
input	wire			phy_ulpi_clk,
inout	wire	[7:0]		phy_ulpi_d,
input	wire			phy_ulpi_dir,
output	wire			phy_ulpi_stp,
input	wire			phy_ulpi_nxt,

input	wire			opt_enable_hs,
output	wire			stat_connected,
output	wire			stat_fs,
output	wire			stat_hs,
output	wire			stat_configured,

input	wire	[8:0]		buf_in_addr,
input	wire	[7:0]		buf_in_data,
input	wire			buf_in_wren,
output	wire			buf_in_ready,
input	wire			buf_in_commit,
input	wire	[9:0]		buf_in_commit_len,
output	wire			buf_in_commit_ack,
input	wire	[8:0]		buf_out_addr,
output	wire	[7:0]		buf_out_q,
output	wire	[9:0]		buf_out_len,
output	wire			buf_out_hasdata,
input	wire			buf_out_arm,
output	wire			buf_out_arm_ack,

output	wire			vend_req_act,
output	wire	[7:0]		vend_req_request,
output	wire	[15:0]		vend_req_val,

output	wire			err_crc_pid,
output	wire			err_crc_tok,
output	wire			err_crc_pkt,
output	wire			err_pid_out_of_seq,
output	wire			err_setup_pkt

);


/***************************usb3_top instatiation *************************/

usb3_top usb3_top_inst (
	.ext_clk		    (ext_clk),
	.clk_125_out    	    (clk_125_out),         
	.reset_n  	            (reset_n),
	.reset_n_out                (reset_n_out),
	.phy_pipe_pclk              (phy_pipe_pclk),
	.phy_pipe_rx_data           (phy_pipe_rx_data),
	.phy_pipe_rx_datak          (phy_pipe_rx_datak),
	.phy_pipe_rx_valid          (phy_pipe_rx_valid),
	.phy_pipe_tx_clk            (phy_pipe_tx_clk),
	.phy_pipe_tx_data           (phy_pipe_tx_data),
	.phy_pipe_tx_datak          (phy_pipe_tx_datak),
                                
	.phy_reset_n                (phy_reset_n),                        
	.phy_out_enable            (phy_out_enable),
	.phy_phy_reset_n           (phy_phy_reset_n),
	.phy_tx_detrx_lpbk         (phy_tx_detrx_lpbk),
	.phy_tx_elecidle           (phy_tx_elecidle),
	.phy_rx_elecidle           (phy_rx_elecidle),
	.phy_rx_status             (phy_rx_status),
	.phy_power_down            (phy_power_down),
	.phy_phy_status            (phy_phy_status),
	.phy_pwrpresent            (phy_pwrpresent),   
	.phy_tx_oneszeros          (phy_tx_oneszeros),                   
	.phy_tx_deemph             (phy_tx_deemph),
	.phy_tx_margin             (phy_tx_margin),
	.phy_tx_swing              (phy_tx_swing),
	.phy_rx_polarity           (phy_rx_polarity),
	.phy_rx_termination        (phy_rx_termination),
	.phy_rate                  (phy_rate),
	.phy_elas_buf_mode         (phy_elas_buf_mode),
                                 
	.buf_in_addr			(buf_in_addr),       	
	.buf_in_data	           	(buf_in_data),
	.buf_in_wren	           	(buf_in_wren),
	.buf_in_ready	   		(buf_in_ready),
	.buf_in_commit	    		(buf_in_commit),
	.buf_in_commit_len		(buf_in_commit_len),
	.buf_in_commit_ack		(buf_in_commit_ack),
	                   	        
	.buf_out_addr                 	(buf_out_addr),    
	.buf_out_q        	       	(buf_out_q),       
	.buf_out_len      	       	(buf_out_len),     
	.buf_out_hasdata  	       	(buf_out_hasdata), 
	.buf_out_arm      	       	(buf_out_arm),     
	.buf_out_arm_ack  	       	(buf_out_arm_ack),                    
	                   	       	 
	.vend_req_act                 	(vend_req_act),      
	.vend_req_request 	       	(vend_req_request),  
	.vend_req_val      	       	(vend_req_val));                              
	             			
	                                
                                        
endmodule                               
	
