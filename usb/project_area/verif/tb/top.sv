`timescale 1ps/1ps

`include "uvm_macros.svh"
  import uvm_pkg::*;

  //include test library
`include "usb_list.svh";
`include "usbf_top.v";
module top;

//Rst and clock declarations
  reg wb_clk;
  reg utmi_clk;
  reg sram_clk;

//Interface instantation
  reset_intf    reset_pif  (wb_clk);
  wb_intf       wb_pif     (.wb_clk(wb_clk),     .wb_rst(reset_pif.reset_n));
  utmi_intf     utmi_pif   (.utmi_clk(utmi_clk), .utmi_rst(reset_pif.reset_n));
  sram_intf     sram_pif   (.sram_clk(sram_clk), .sram_rst(reset_pif.reset_n));

//Rst and Clock generation
  initial begin

    wb_clk   = 0;
    utmi_clk = 0;
    sram_clk = 0;

  end

  always #(10/2) wb_clk   = ~wb_clk;
  always #(16/2) utmi_clk = ~utmi_clk;
  always #(10/2) sram_clk = ~sram_clk;

//DUT Instantiation
 usbf_top dut(
	// WISHBONE Interface signal connection
		.clk_i(wb_pif.wb_clk), .rst_i(wb_pif.wb_rst), .wb_addr_i(wb_pif.wb_addr_i), .wb_data_i(wb_pif.wb_data_i), .wb_data_o(wb_pif.wb_data_o),
		.wb_ack_o(wb_pif.wb_ack_o), .wb_we_i(wb_pif.wb_we_i), .wb_stb_i(wb_pif.wb_stb_i), .wb_cyc_i(wb_pif.wb_cyc_i), .inta_o(wb_pif.inta_o), .intb_o(wb_pif.intb_o),
		.dma_req_o(wb_pif.dma_req_o), .dma_ack_i(wb_pif.dma_ack_i), .susp_o(wb_pif.susp_o), .resume_req_i(wb_pif.resume_req_i),

		// UTMI Interface
		.phy_clk_pad_i(utmi_pif.utmi_clk), .phy_rst_pad_o(utmi_pif.phy_rst_o),
		.DataOut_pad_o(utmi_pif.DataOut_o), .TxValid_pad_o(utmi_pif.TxValid_o), .TxReady_pad_i(utmi_pif.TxReady_i),

		.RxValid_pad_i(utmi_pif.RxValid_i), .RxActive_pad_i(utmi_pif.RxActive_i), .RxError_pad_i(utmi_pif.RxError_i),
		.DataIn_pad_i(utmi_pif.DataIn_i), .XcvSelect_pad_o(utmi_pif.XcvSelect_o), .TermSel_pad_o(utmi_pif.TermSel_o),
		.SuspendM_pad_o(utmi_pif.SuspendM_o), .LineState_pad_i(utmi_pif.LineState_i),

		.OpMode_pad_o(utmi_pif.OpMode_o), .usb_vbus_pad_i(utmi_pif.usb_vbus_i),
		.VControl_Load_pad_o(utmi_pif.VControl_Load_o), .VControl_pad_o(utmi_pif.VControl_o), .VStatus_pad_i(utmi_pif.VStatus_i)

		// Buffer Memory Interface
		//.sram_adr_o(svif.sram_adr_o), .sram_data_i(svif.sram_data_i), .sram_data_o(svif.sram_data_o), .sram_re_o(svif.sram_re_o), .sram_we_o(svif.sram_we_o)
		);

//Register interfaces to config_db
  initial begin

    uvm_config_db#(virtual reset_intf)::set(null,"*","reset_pif",reset_pif);
    uvm_config_db#(virtual wb_intf)::set(null,"*","wb_pif",wb_pif);
    uvm_config_db#(virtual utmi_intf)::set(null,"*","utmi_pif",utmi_pif);
    uvm_config_db#(virtual sram_intf)::set(null,"*","sram_pif",sram_pif);

  end

//Run test
  initial begin
    run_test();
  end

endmodule:top
