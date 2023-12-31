///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMAD_KHADEER, LOKESH, MADHURA.                        //     
//      Revision tag      :  06/10/2023                                                          //     
//      Module Name       :  top                                                                 //     
//      Project Name      :  USB 3.1                                                             //
//      component name    :  TOP                                                                 //
//      Description       :  TestBench top is the module, it connects the DUT and Verification   //
//      		             environment components.Typical Testbench_top contains,              //
//      		             DUT instance,interface instance, run_test() method,                 //
//     			             virtual interface set config_db, clock nand reset generation        //
//     			             logic and wave dump logic.                                          //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ps/1ps
 
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  //include test library:
  `include "usb_list.svh"

  `include "usb_top.v"

  
`ifdef ASSERTION_ON
	`include "assertion.sv"
`endif

  //******************************top**********************//
module top;

  //Rst and clock declarations
  logic ext_clk;
  logic phy_pipe_pclk;
  logic phy_ulpi_clk;
  logic reset_n;
			
  //Rst and Clock generation
  initial begin
    ext_clk = 0;
    phy_pipe_pclk = 0;
    phy_ulpi_clk=0;
	

  end

  always #2000    ext_clk = ~ext_clk;			//TODO need to check in rtl side (which frequency)
  always #8333     phy_ulpi_clk = ~phy_ulpi_clk;  	//60MHz clock geneartion 
  always #2000      phy_pipe_pclk = ~phy_pipe_pclk;    	//250MHz clock geneartion
  
  
  //Interface instantation  
  
  reset_intf reset_pif( .phy_ulpi_clk(phy_ulpi_clk)); //changed ext clock --> phy_ulpi_ck
  
  buff_intf buff_pif(	.ext_clk(ext_clk), 
			            .reset_n(reset_pif.reset_n),
			            .phy_ulpi_clk(phy_ulpi_clk));  

  phy_intf phy_pif(	.ext_clk(ext_clk),            
	  		        .reset_n(reset_pif.reset_n),
                   	.phy_pipe_pclk(phy_pipe_pclk));  

		
/******************************* Binding_Assertions*****************/ 
 `ifdef ASSERTION_ON
  bind DUT assertion_2_buff  assertion_2_buff_h (
	.reset_n  	          		(reset_n),
	.ext_clk				(ext_clk),
	.phy_pipe_pclk		   		(phy_pif.phy_pipe_pclk),

	.phy_ulpi_clk				(phy_ulpi_clk),
	.phy_ulpi_d				(buff_pif.phy_ulpi_d),
	.phy_ulpi_dir				(buff_pif.phy_ulpi_dir),
	.phy_ulpi_nxt				(buff_pif.phy_ulpi_nxt),
	.opt_disable_all			(buff_pif.opt_disable_all),
	.opt_enable_hs				(buff_pif.opt_enable_hs),
	.opt_ignore_vbus			(buff_pif.opt_ignore_vbus),
	.buf_in_addr				(buff_pif.buf_in_addr),
	.buf_in_data				(buff_pif.buf_in_data),
	.buf_in_wren				(buff_pif.buf_in_wren),
	.buf_in_commit				(buff_pif.buf_in_commit),
	.buf_in_commit_len			(buff_pif.buf_in_commit_len),
	.buf_out_addr				(buff_pif.buf_out_addr),
	.buf_out_arm				(buff_pif.buf_out_arm));
  `endif
/************************************************************/
  //DUT Instantiation
  usb_top DUT (
	.clk_125_out    	  		(phy_pif.clk_125_out),         
	.reset_n  	          		(phy_pif.reset_n),
	.reset_n_out              	(phy_pif.reset_n_out),
	//  signals specific to usb 3.0
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
	// signals spe   cific to usb 2.0	
	.ext_clk				(buff_pif.ext_clk),
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
	.buf_in_addr				(buff_pif.buf_in_addr),
	.buf_in_data				(buff_pif.buf_in_data),
	.buf_in_wren				(buff_pif.buf_in_wren),
	.buf_in_ready				(buff_pif.buf_in_ready),
	.buf_in_commit				(buff_pif.buf_in_commit),
	.buf_in_commit_len			(buff_pif.buf_in_commit_len),
	.buf_in_commit_ack			(buff_pif.buf_in_commit_ack),
	.buf_out_addr				(buff_pif.buf_out_addr),
	.buf_out_q				(buff_pif.buf_out_q),
	.buf_out_len				(buff_pif.buf_out_len),
	.buf_out_hasdata			(buff_pif.buf_out_hasdata),
	.buf_out_arm				(buff_pif.buf_out_arm),
	.buf_out_arm_ack			(buff_pif.buf_out_arm_ack),
	.vend_req_act				(buff_pif.vend_req_act),
	.vend_req_request			(buff_pif.vend_req_request),
      .vend_req_val				(buff_pif.vend_req_val),
	.err_crc_pid				(buff_pif.err_crc_pid),
	.err_crc_tok				(buff_pif.err_crc_tok),
	.err_crc_pkt				(buff_pif.err_crc_pkt),
	.err_pid_out_of_seq			(buff_pif.err_pid_out_of_seq),
	.err_setup_pkt				(buff_pif.err_setup_pkt),
	.dbg_frame_num				(buff_pif.dbg_frame_num),
	.dbg_linestate				(buff_pif.dbg_linestate),
	.se0_reset				(buff_pif.se0_reset)
	
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
