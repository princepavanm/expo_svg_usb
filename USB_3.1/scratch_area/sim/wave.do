onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group RESET_INTF /top/reset_pif/phy_ulpi_clk
add wave -noupdate -group RESET_INTF /top/reset_pif/reset_n
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/ext_clk
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/reset_n
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/phy_ulpi_clk
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/phy_ulpi_d
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/phy_ulpi_dir
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/phy_ulpi_nxt
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/opt_disable_all
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/opt_enable_hs
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/opt_ignore_vbus
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/buf_in_addr
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/buf_in_data
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/buf_in_wren
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/buf_in_commit
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/buf_in_commit_len
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/buf_out_addr
add wave -noupdate -group BUFF_INTF -group INPUT /top/buff_pif/buf_out_arm
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/reset_n_out
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/phy_ulpi_stp
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/stat_connected
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/stat_fs
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/stat_hs
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/stat_configured
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/buf_in_ready
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/buf_in_commit_ack
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/buf_out_q
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/buf_out_len
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/buf_out_hasdata
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/buf_out_arm_ack
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/vend_req_act
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/vend_req_request
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/vend_req_val
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/err_crc_pid
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/err_crc_tok
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/err_crc_pkt
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/err_pid_out_of_seq
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/err_setup_pkt
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/dbg_frame_num
add wave -noupdate -group BUFF_INTF -group OUTPUT /top/buff_pif/dbg_linestate
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/ext_clk
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/reset_n
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/phy_pipe_pclk
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/phy_pipe_rx_data
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/phy_pipe_rx_datak
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/phy_pipe_rx_valid
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/phy_rx_elecidle
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/phy_rx_status
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/phy_phy_status
add wave -noupdate -group PHY_INTF -expand -group INPUT /top/phy_pif/phy_pwrpresent
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/reset_n_out
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/clk_125_out
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_pipe_tx_clk
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_pipe_tx_data
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_pipe_tx_datak
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_reset_n
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_out_enable
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_phy_reset_n
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_tx_detrx_lpbk
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_tx_elecidle
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_power_down
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_tx_oneszeros
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_tx_deemph
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_tx_margin
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_tx_swing
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_rx_polarity
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_rx_termination
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_rate
add wave -noupdate -group PHY_INTF -group OUTPUT /top/phy_pif/phy_elas_buf_mode
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/ext_clk
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/reset_n
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/phy_pipe_pclk
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/phy_pipe_rx_data
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/phy_pipe_rx_datak
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/phy_pipe_rx_valid
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/phy_rx_elecidle
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/phy_rx_status
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/phy_phy_status
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_INPUT /top/DUT/phy_pwrpresent
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/reset_n_out
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/clk_125_out
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_pipe_tx_clk
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_pipe_tx_data
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_pipe_tx_datak
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_reset_n
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_out_enable
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_phy_reset_n
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_tx_detrx_lpbk
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_tx_elecidle
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_power_down
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_tx_oneszeros
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_tx_deemph
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_tx_margin
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_tx_swing
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_rx_polarity
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_rx_termination
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_rate
add wave -noupdate -group DUT_TOP_SIGNALS -group USB3.0_OUTPUT /top/DUT/phy_elas_buf_mode
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/phy_ulpi_clk
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/phy_ulpi_d
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/phy_ulpi_dir
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/phy_ulpi_nxt
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/opt_disable_all
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/opt_enable_hs
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/opt_ignore_vbus
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/buf_in_addr
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/buf_in_data
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/buf_in_wren
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/buf_in_commit
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/buf_in_commit_len
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/buf_out_addr
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_INPUT /top/DUT/buf_out_arm
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/phy_ulpi_stp
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/stat_connected
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/stat_fs
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/stat_hs
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/stat_configured
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/buf_in_ready
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/buf_in_commit_ack
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/buf_out_q
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/buf_out_len
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/buf_out_hasdata
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/buf_out_arm_ack
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/vend_req_act
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/vend_req_request
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/vend_req_val
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/err_crc_pid
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/err_crc_tok
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/err_crc_pkt
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/err_pid_out_of_seq
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/err_setup_pkt
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/dbg_frame_num
add wave -noupdate -group DUT_TOP_SIGNALS -group USB2.0_OUTPUT /top/DUT/dbg_linestate
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/ext_clk
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/reset_n
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/phy_ulpi_clk
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/phy_ulpi_d
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/phy_ulpi_dir
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/phy_ulpi_nxt
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/opt_disable_all
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/opt_enable_hs
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/opt_ignore_vbus
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/buf_in_addr
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/buf_in_data
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/buf_in_wren
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/buf_in_commit
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/buf_in_commit_len
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/buf_out_addr
add wave -noupdate -group USB2.0_TOP_SIGNALS -expand -group INPUT /top/DUT/usb2_inst/buf_out_arm
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/reset_n_out
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/phy_ulpi_stp
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/stat_connected
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/stat_fs
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/stat_hs
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/stat_configured
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/buf_in_ready
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/buf_in_commit_ack
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/buf_out_q
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/buf_out_len
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/buf_out_hasdata
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/buf_out_arm_ack
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/vend_req_act
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/vend_req_request
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/vend_req_val
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/err_crc_pid
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/err_crc_tok
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/err_crc_pkt
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/err_pid_out_of_seq
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/err_setup_pkt
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/dbg_frame_num
add wave -noupdate -group USB2.0_TOP_SIGNALS -group OUTPUT /top/DUT/usb2_inst/dbg_linestate
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_sel_endp
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_in_addr
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_in_data
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_in_wren
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_in_ready
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_in_commit
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_in_commit_len
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_in_commit_ack
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_out_addr
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_out_q
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_out_len
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_out_hasdata
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_out_arm
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_buf_out_arm_ack
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_dev_addr
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_endp_mode
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_data_toggle_act
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/prot_data_toggle
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/reset_1
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/reset_2
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/phy_ulpi_d_out
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/phy_ulpi_d_oe
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/phy_ulpi_d_in
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ulpi_out_act
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ulpi_out_byte
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ulpi_out_latch
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ulpi_in_nxt
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ulpi_in_cts
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ulpi_in_byte
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ulpi_in_latch
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ulpi_in_stp
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/packet_xfer_in
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/packet_xfer_in_ok
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/packet_xfer_out
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/packet_xfer_out_ok
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/packet_xfer_query
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/packet_xfer_endp
add wave -noupdate -group USB2.0_TOP_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/packet_xfer_pid
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/reset_n
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/opt_disable_all
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/opt_enable_hs
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/opt_ignore_vbus
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/phy_clk
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/phy_d_in
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/phy_dir
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/phy_nxt
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/pkt_in_byte
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/pkt_in_latch
add wave -noupdate -group ULPI(ai)_SIGNALS -group INPUT /top/DUT/usb2_inst/ia/pkt_in_stp
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/reset_local
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/stat_connected
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/stat_fs
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/stat_hs
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/phy_d_out_mux
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/phy_d_oe
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/phy_stp
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/pkt_out_act
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/pkt_out_byte
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/pkt_out_latch
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/pkt_in_cts
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/pkt_in_nxt
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/se0_reset
add wave -noupdate -group ULPI(ai)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ia/dbg_linestate
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/pkt_in_latch_defer
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/can_send
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/can_send_delay
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/state
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/state_next
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/reset_1
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/reset_2
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/reset_ulpi
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/opt_enable_hs_1
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/opt_enable_hs_2
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/opt_ignore_vbus_1
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/opt_ignore_vbus_2
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/phy_dir_1
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/phy_d_out
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/phy_d_next
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/phy_d_sel
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/phy_stp_out
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/in_rx_cmd
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/know_recv_packet
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/last_line_state
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/line_state
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/vbus_state
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/rx_event
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/vbus_valid
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/vbus_valid_1
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/rx_active
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/tx_cmd_code
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/tx_reg_addr
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/tx_reg_data_rd
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/tx_reg_data_wr
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/tx_pid
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/dc
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/dc_wrap
add wave -noupdate -group ULPI(ai)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ia/se0_bus_reset
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/phy_clk
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/reset_n
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/in_act
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/in_byte
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/in_latch
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/out_cts
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/out_nxt
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/buf_in_ready
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/buf_in_commit_ack
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/buf_out_q
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/buf_out_len
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/buf_out_hasdata
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/buf_out_arm_ack
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/endp_mode
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/data_toggle
add wave -noupdate -group PACKET(ip)_SIGNALS -group INPUT /top/DUT/usb2_inst/ip/dev_addr
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/out_byte
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/out_latch
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/out_stp
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/sel_endp
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/buf_in_addr
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/buf_in_data
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/buf_in_wren
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/buf_in_commit
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/buf_in_commit_len
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/buf_out_addr
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/buf_out_arm
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/data_toggle_act
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/err_crc_pid
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/err_crc_tok
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/err_crc_pkt
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/err_pid_out_of_seq
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/dbg_frame_num
add wave -noupdate -group PACKET(ip)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ip/dbg_pkt_type
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/reset_1
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/reset_2
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/in_act_1
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/out_nxt_1
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/out_nxt_2
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/pid
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/pid_valid
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/pid_stored
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/pid_last
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/pid_send
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/pkt_type
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/packet_crc
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/packet_token
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/packet_token_addr
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/packet_token_addr_stored
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/packet_token_endp
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/packet_token_crc5
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/packet_token_frame
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/dc
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/bc
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/local_dev_addr
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/crc16
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/crc16_1
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/crc16_2
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/crc16_fix
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/crc16_fix_out
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/data_pid
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_in_addr_2
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_in_addr_1
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_in_addr_0
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_in_data_1
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_in_data_0
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_in_wren_1
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_in_wren_0
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_in_ready_latch
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/buf_out_ready_latch
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/out_byte_buf
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/out_byte_out
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/out_byte_crc
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/state
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/out_crc_mux
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/crc16_byte_sel
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/next_crc16
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/next_crc5
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/crc5_data
add wave -noupdate -group PACKET(ip)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ip/crc16_byte
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/phy_clk
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/ext_clk
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/reset_n
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/sel_endp
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/buf_in_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/buf_in_data
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/buf_in_wren
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/buf_in_commit
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/buf_in_commit_len
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/buf_out_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/buf_out_arm
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/ext_buf_in_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/ext_buf_in_data
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/ext_buf_in_wren
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/ext_buf_in_commit
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/ext_buf_in_commit_len
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/ext_buf_out_arm
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INPUT /top/DUT/usb2_inst/ipr/data_toggle_act
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/buf_in_ready
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/buf_in_commit_ack
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/buf_out_q
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/buf_out_len
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/buf_out_hasdata
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/buf_out_arm_ack
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/ext_buf_in_ready
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/ext_buf_in_commit_ack
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/ext_buf_out_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/ext_buf_out_q
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/ext_buf_out_len
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/ext_buf_out_hasdata
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/ext_buf_out_arm_ack
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/endp_mode
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/data_toggle
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/vend_req_act
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/vend_req_request
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/vend_req_val
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/dev_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/configured
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group OUTPUT /top/DUT/usb2_inst/ipr/err_setup_pkt
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/reset_1
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/reset_2
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/EP1_MODE
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/EP2_MODE
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/dc
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/state
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_in_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_in_data
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_in_wren
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_in_ready
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_in_commit
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_in_commit_len
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_in_commit_ack
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_data_toggle_act
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_data_toggle
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_out_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_out_q
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_out_len
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_out_hasdata
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_out_arm
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep0_buf_out_arm_ack
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep1_buf_out_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep1_buf_out_q
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep1_buf_out_len
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep1_buf_out_hasdata
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep1_buf_out_arm
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep1_buf_out_arm_ack
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep1_data_toggle_act
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep1_data_toggle
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_buf_in_addr
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_buf_in_data
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_buf_in_wren
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_buf_in_ready
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_buf_in_commit
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_buf_in_commit_len
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_buf_in_commit_ack
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_data_toggle_act
add wave -noupdate -group PROTOCOL(ipr)_SIGNALS -group INTERNAL_SIGNALS /top/DUT/usb2_inst/ipr/ep2_data_toggle
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 366
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {9652369 ps}
