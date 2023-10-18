///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  buff_intf                                                           //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  Interface                                                           //
//      Description       :  This module cover signals for interface .                           //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

interface buff_intf(  input logic  reset_n,
                      input bit  ext_clk,
                      input bit  phy_ulpi_clk  );
	
  logic		reset_n_out; 
  
  wand   [7:0]  phy_ulpi_d;
  logic	        phy_ulpi_dir;
  logic	        phy_ulpi_stp;
  logic	        phy_ulpi_nxt;
  
  logic	        opt_disable_all;
  logic	        opt_enable_hs;
  logic	        opt_ignore_vbus;
  logic	        stat_connected;
  logic	        stat_fs;
  logic	        stat_hs;
  logic	        stat_configured;
  
  logic  [8:0]  buf_in_addr;
  logic  [7:0]  buf_in_data;
  logic	        buf_in_wren;
   
  logic	        buf_in_ready;
  logic	        buf_in_commit;
  logic  [9:0]  buf_in_commit_len;
  logic	        buf_in_commit_ack;
  logic  [8:0]  buf_out_addr;
  logic  [7:0]  buf_out_q;
  logic  [9:0]  buf_out_len;
  logic	        buf_out_hasdata;
  logic	        buf_out_arm;
  logic         buf_out_arm_ack;
  
  logic	        vend_req_act;
  logic  [7:0]  vend_req_request;
  logic  [15:0] vend_req_val;
  
  logic         err_crc_pid;
  logic	        err_crc_tok;
  logic         err_crc_pkt;
  logic         err_pid_out_of_seq;
  logic         err_setup_pkt;
  
  logic  [10:0] dbg_frame_num;
  logic  [1:0]  dbg_linestate;
  logic  	se0_reset;

//*********  clocking blocks buff_Driver  ***********//

  clocking buff_driver_cb@(posedge phy_ulpi_clk);
    default input #1 output #1;

    output      ext_clk;
    output      reset_n;
    input       reset_n_out;
    
    output      phy_ulpi_clk;
    inout       phy_ulpi_d;
    output      phy_ulpi_dir;
    input       phy_ulpi_stp;
    output      phy_ulpi_nxt;
    
    output      opt_disable_all;
    output      opt_enable_hs;
    output      opt_ignore_vbus;
    input       stat_connected;
    input       stat_fs;
    input       stat_hs;
    input       stat_configured;
    
    output      buf_in_addr;
    output      buf_in_data;
    output      buf_in_wren;
    input       buf_in_ready;
    output      buf_in_commit;
    output      buf_in_commit_len;
    input       buf_in_commit_ack;
    output      buf_out_addr;
    input       buf_out_q;
    input       buf_out_len;
    input       buf_out_hasdata;
    output      buf_out_arm;
    input       buf_out_arm_ack;
    
    input       vend_req_act;
    input       vend_req_request;
    input       vend_req_val;
    
    input       err_crc_pid;
    input       err_crc_tok;
    input       err_crc_pkt;
    input       err_pid_out_of_seq;
    input       err_setup_pkt;
    
    input       dbg_frame_num;
    input       dbg_linestate;
    input 		se0_reset;

  endclocking

//*********  clocking blocks buff_monitor  ***********//

  clocking buff_monitor_cb@(posedge phy_ulpi_clk);
    default input #1 output #1;

    input       ext_clk;
    input       reset_n;
    input       reset_n_out;
    
    input       phy_ulpi_clk;
    input       phy_ulpi_d;
    input       phy_ulpi_dir;
    input       phy_ulpi_stp;
    input       phy_ulpi_nxt;
    
    input       opt_disable_all;
    input       opt_enable_hs;
    input       opt_ignore_vbus;
    input       stat_connected;
    input       stat_fs;
    input       stat_hs;
    input       stat_configured;
    
    input       buf_in_addr;
    input       buf_in_data;
    input       buf_in_wren;
    input       buf_in_ready;
    input       buf_in_commit;
    input       buf_in_commit_len;
    input       buf_in_commit_ack;
    input       buf_out_addr;
    input       buf_out_q;
    input       buf_out_len;
    input       buf_out_hasdata;
    input       buf_out_arm;
    input       buf_out_arm_ack;
    
    input       vend_req_act;
    input       vend_req_request;
    input       vend_req_val;
    
    input       err_crc_pid;
    input       err_crc_tok;
    input       err_crc_pkt;
    input       err_pid_out_of_seq;
    input       err_setup_pkt;
    
    input       dbg_frame_num;
    input       dbg_linestate;
    input   	se0_reset;

  endclocking

//modport for buff_driver 
  modport BUFF_DRIVER(clocking buff_driver_cb);
    
// modport for buff_monitor
  modport BUFF_MONITOR(clocking buff_monitor_cb);

endinterface:buff_intf
