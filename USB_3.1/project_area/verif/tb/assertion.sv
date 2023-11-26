module assertion_2_buff (  input reset_n,
                      input  ext_clk,
                      input  phy_ulpi_clk,
	
  
inout		[7:0]	phy_ulpi_d,
input			phy_ulpi_dir,
output			phy_ulpi_stp,
input			phy_ulpi_nxt,

input			opt_disable_all,
input			opt_enable_hs,
input			opt_ignore_vbus,
output			stat_connected,
output			stat_fs,
output			stat_hs,
output			stat_configured,

input		[8:0]	buf_in_addr,
input		[7:0]	buf_in_data,
input			buf_in_wren,
output			buf_in_ready,
input			buf_in_commit,
input		[9:0]	buf_in_commit_len,
output			buf_in_commit_ack,
input		[8:0]	buf_out_addr,
output		[7:0]	buf_out_q,
output		[9:0]	buf_out_len,
output			buf_out_hasdata,
input			buf_out_arm,
output			buf_out_arm_ack,

output			vend_req_act,
output		[7:0]	vend_req_request,
output		[15:0]	vend_req_val,

output			err_crc_pid,
output			err_crc_tok,
output			err_crc_pkt,
output			err_pid_out_of_seq,
output			err_setup_pkt,

output		[10:0]	dbg_frame_num,
output		[1:0]	dbg_linestate,
output			se0_reset,


// phy_interface
  output	clk_125_out,
  output	reset_n_out,

input			phy_pipe_pclk,
input		[15:0]	phy_pipe_rx_data,
input		[1:0]	phy_pipe_rx_datak,
input			phy_pipe_rx_valid,
output			phy_pipe_tx_clk,
output		[15:0]	phy_pipe_tx_data,
output		[1:0]	phy_pipe_tx_datak,

output			phy_reset_n,
output			phy_out_enable,
output			phy_phy_reset_n,
output			phy_tx_detrx_lpbk,
output			phy_tx_elecidle,
inout			phy_rx_elecidle,
input		[2:0]	phy_rx_status,
output		[1:0]	phy_power_down,
inout			phy_phy_status,
input			phy_pwrpresent,

output				phy_tx_oneszeros,
output		[1:0]	phy_tx_deemph,
output		[2:0]	phy_tx_margin,
output			phy_tx_swing,
output			phy_rx_polarity,
output			phy_rx_termination,
output			phy_rate,
output			phy_elas_buf_mode);

/**************************** Unknown Check *********************************/
initial begin
	$display ("######################### ASSERTION ENABLED ###########################");
end
	//property
property unknown_check(signals);
  @(posedge top.ext_clk) disable iff(top.reset_n) not ($isunknown(signals));
endproperty


ULPI_DIR : assert property (unknown_check(phy_ulpi_dir));
ULPI_NXT : assert property (unknown_check(phy_ulpi_nxt));
ENABLE_HS : assert property (unknown_check(opt_enable_hs));
OPT_DIS_ALL: assert property (unknown_check(opt_disable_all));
OPT_IGNORE_VBUS: assert property (unknown_check(opt_ignore_vbus));
BUF_IN_ADDR: assert property (unknown_check(buf_in_addr));
BUF_IN_DATA: assert property (unknown_check(buf_in_data));
BUF_IN_WREN: assert property (unknown_check(buf_in_wren));
BUF_IN_COMMIT: assert property (unknown_check(buf_in_commit));
BUF_IN_COMMIT_LEN: assert property (unknown_check(buf_in_commit_len));
BUF_OUT_ADDR: assert property (unknown_check(buf_out_addr));
BUF_OUT_ARM: assert property (unknown_check(buf_out_arm));


/*********************************PHY_ULPI_D**********************************************/

property phy_ulpi_d_prop;
       	@(posedge top.ext_clk) disable iff(top.reset_n) 
	( phy_ulpi_dir == 1 && phy_ulpi_nxt ==1 && opt_enable_hs ==1) |-> (!$isunknown(phy_ulpi_d));
endproperty

ULPI_D : assert property(phy_ulpi_d_prop);

/********************************** Clock Check *******************************************/

property clock_check(int clk_period);
	time current_time;
	disable iff(top.reset_n)
	(('1,current_time=$time) |=>(clk_period==$time-current_time));
endproperty

PHY_ULPI_CLK  : assert property (@(posedge phy_ulpi_clk)clock_check(16666))  //16666ps
                else
                  $warning("%t TB_INFO : clk not correct",$time);

PHY_PIPE_PCLK : assert property (@(posedge phy_pipe_pclk)clock_check(4000))  //4000ps
                else
                  $warning("%t TB_INFO : phy_pipe_pclk not correct",$time);

/*****************************************************************************************/


endmodule



