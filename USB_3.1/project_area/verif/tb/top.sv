///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :                                                                      //
//      Revision tag      :                                                                      //
//      Module Name       :                                                                      //
//      Project Name      :                                                                      //
//      component name    :                                                                      //
//      Description       :	This module provides a test to generate clocks                   //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ns
 
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //include test library:
  `include "usb_list.svh"

  `include "usb_top.v"

//******************************top**********************//
module top;

  //Rst and clock declarations
  logic ext_clk;
  logic phy_pipe_pclk;
  logic phy_ulpi_clk;
  logic reset_n;
  //logic temp_c0;
  //logic temp_c1;
  
  //Interface instantation  
  
  reset_intf reset_pif( .ext_clk(ext_clk));//.reset_n(reset_n)),
  
  buff_intf buff_pif(	.ext_clk(ext_clk), 
			.reset_n(reset_pif.reset_n),
			.phy_pipe_pclk(phy_pipe_pclk),
			.phy_ulpi_clk(phy_ulpi_clk));  

  phy_intf phy_pif(	.ext_clk(ext_clk),            
	  		.reset_n(reset_pif.reset_n),
                   	.phy_pipe_pclk(phy_pipe_pclk),
                   	.phy_ulpi_clk(phy_ulpi_clk));  
			
  //Rst and Clock generation
  initial begin
    ext_clk = 0;
    phy_pipe_pclk = 0;
    phy_ulpi_clk=0;
	
	 
    
    //reset_n = 1;  //we've separate agent for reset
    //#7.0;	reset_n = 0;

    //#500000us;
    //$finish();
	//assign top.DUT.iu3pll.c0 = temp_c0;
	//assign top.DUT.iu3pll.c1 = temp_c1;
  end

  always #2.0       ext_clk = ~ext_clk;			//TODO need to check in rtl side (which frequency)
  always #8.33      phy_ulpi_clk = ~phy_ulpi_clk;  	//60MHz clock geneartion 
  always #2.0       phy_pipe_pclk = ~phy_pipe_pclk;    	//250MHz clock geneartion
  
  //always #8			temp_c0 = ~ temp_c0;	// 62.5mhz
  //always #4			temp_c1 = ~ temp_c1;	// 125 mhz

  //DUT Instantiation
  usb_top DUT (
	.clk_125_out    	  		(phy_pif.clk_125_out),         
	.reset_n  	          		(phy_pif.reset_n),
	.reset_n_out              	(phy_pif.reset_n_out),
	.phy_pipe_pclk		   		(phy_pif.phy_pipe_pclk),
	.phy_pipe_rx_data         	(phy_pif.phy_pipe_rx_data),
	.phy_pipe_rx_datak        	(phy_pif.phy_pipe_rx_datak),
	.phy_pipe_rx_valid        	(phy_pif.phy_pipe_rx_valid),
	.phy_pipe_tx_clk          	(phy_pif.phy_pipe_tx_clk),
	.phy_pipe_tx_data         (phy_pif.phy_pipe_tx_data),
	.phy_pipe_tx_datak        (phy_pif.phy_pipe_tx_datak),
                                
	.phy_reset_n              (phy_pif.phy_reset_n),                        
	.phy_out_enable           (phy_pif.phy_out_enable),
	.phy_phy_reset_n          (phy_pif.phy_phy_reset_n),
	.phy_tx_detrx_lpbk        (phy_pif.phy_tx_detrx_lpbk),
	.phy_tx_elecidle          (phy_pif.phy_tx_elecidle),
	.phy_rx_elecidle          (phy_pif.phy_rx_elecidle),
	.phy_rx_status            (phy_pif.phy_rx_status),
	.phy_power_down           (phy_pif.phy_power_down),
	.phy_phy_status           (phy_pif.phy_phy_status),
	.phy_pwrpresent           (phy_pif.phy_pwrpresent),   
	.phy_tx_oneszeros         (phy_pif.phy_tx_oneszeros),                   
	.phy_tx_deemph            (phy_pif.phy_tx_deemph),
	.phy_tx_margin            (phy_pif.phy_tx_margin),
	.phy_tx_swing             (phy_pif.phy_tx_swing),
	.phy_rx_polarity          (phy_pif.phy_rx_polarity),
	.phy_rx_termination       (phy_pif.phy_rx_termination),
	.phy_rate                 (phy_pif.phy_rate),
	.phy_elas_buf_mode        (phy_pif.phy_elas_buf_mode),
                                 
	.buf_in_addr		  (phy_pif.buf_in_addr),       	
	.buf_in_data	          (phy_pif.buf_in_data),
	.buf_in_wren	          (phy_pif.buf_in_wren),
	.buf_in_ready	   	  (phy_pif.buf_in_ready),
	.buf_in_commit	    	  (phy_pif.buf_in_commit),
	.buf_in_commit_len	  (phy_pif.buf_in_commit_len),
	.buf_in_commit_ack	  (phy_pif.buf_in_commit_ack),
	                   	        
	.buf_out_addr             (phy_pif.buf_out_addr),    
	.buf_out_q        	  (phy_pif.buf_out_q),       
	.buf_out_len      	  (phy_pif.buf_out_len),     
	.buf_out_hasdata  	  (phy_pif.buf_out_hasdata), 
	.buf_out_arm      	  (phy_pif.buf_out_arm),     
	.buf_out_arm_ack  	  (phy_pif.buf_out_arm_ack),                    
	                   	       	 
	.vend_req_act             (phy_pif.vend_req_act),      
	.vend_req_request 	  (phy_pif.vend_req_request),  
	.vend_req_val      	  (phy_pif.vend_req_val),                            
	             			
/***************************usb2_top instatiation *************************/	
	.ext_clk				(buff_pif.ext_clk),
//	.reset_n				(buff_pif.reset_n),
//	.reset_n_out				(buff_pif.reset_n_out),
	.phy_ulpi_clk				(buff_pif.phy_ulpi_clk),
	.phy_ulpi_d				(buff_pif.phy_ulpi_d),
	.phy_ulpi_dir				(buff_pif.phy_ulpi_dir),
	.phy_ulpi_stp				(buff_pif.phy_ulpi_stp),
	.phy_ulpi_nxt				(buff_pif.phy_ulpi_nxt),
	.opt_disable_all			(buff_pif.opt_disable_all),
	.opt_enable_hs				(buff_pif.opt_enable_hs),
	.opt_ignore_vbus			(buff_pif.opt_ignore_vbus),
	.stat_connected				(buff_pif.stat_connected),
	.stat_fs				(buff_pif.stat_fs),
	.stat_hs				(buff_pif.stat_hs),
	.stat_configured			(buff_pif.stat_configured),
//	.buf_in_addr				(buff_pif.buf_in_addr),
//	.buf_in_data				(buff_pif.buf_in_data),
//	.buf_in_wren				(buff_pif.buf_in_wren),
//	.buf_in_ready				(buff_pif.buf_in_ready),
//	.buf_in_commit				(buff_pif.buf_in_commit),
//	.buf_in_commit_len			(buff_pif.buf_in_commit_len),
//	.buf_in_commit_ack			(buff_pif.buf_in_commit_ack),
//	.buf_out_addr				(buff_pif.buf_out_addr),
//	.buf_out_q				(buff_pif.buf_out_q),
//	.buf_out_len				(buff_pif.buf_out_len),
//	.buf_out_hasdata			(buff_pif.buf_out_hasdata),
//	.buf_out_arm				(buff_pif.buf_out_arm),
//	.buf_out_arm_ack			(buff_pif.buf_out_arm_ack),
//	.vend_req_act				(buff_pif.vend_req_act),
//	.vend_req_request			(buff_pif.vend_req_request),
//      .vend_req_val				(buff_pif.vend_req_val),
	.err_crc_pid				(buff_pif.err_crc_pid),
	.err_crc_tok				(buff_pif.err_crc_tok),
	.err_crc_pkt				(buff_pif.err_crc_pkt),
	.err_pid_out_of_seq			(buff_pif.err_pid_out_of_seq),
	.err_setup_pkt				(buff_pif.err_setup_pkt),
	.dbg_frame_num				(buff_pif.dbg_frame_num),
	.dbg_linestate				(buff_pif.dbg_linestate)
	
	);

//Register interfaces to config_db
  initial begin
	//uvm_resource_db#(virtual reset_intf)::set("reset_vif","",top.reset_pif);
	uvm_config_db#(virtual reset_intf)::set(null,"*","reset_pif",reset_pif);
    uvm_config_db#(virtual buff_intf)::set(null,"*","buff_pif",buff_pif);
    uvm_config_db#(virtual phy_intf)::set(null,"*","phy_pif",phy_pif);
  end

//Run test
  initial begin
    run_test();
  end

endmodule:top

