//`timescale 1ps/1ps

`include "uvm_macros.svh"
  import uvm_pkg::*;

bit hs_mode_f = 0;
real utmi_clk_freq = 12;
`define REDUCED_SIM
bit reset_signaling_completed = 0;

`include "../../design/rtl/usbf_defines.v"

//include test library
`include "usb_list.svh";

module top;

//Rst and clock declarations
  reg wb_clk;
  reg utmi_clk;
  reg sram_clk;
  real utmi_clk_tp;

//Interface instantation
  reset_intf    reset_vif (.clk_i   ( wb_clk   ));
  wb_intf       wb_vif    (.clk_i   ( wb_clk   ),  .wb_rst   ( reset_vif.reset_n ));
  utmi_intf     utmi_vif  (.utmi_clk ( utmi_clk ), .utmi_rst ( reset_vif.reset_n ));
  sram_intf     sram_vif  (.sram_clk ( sram_clk ), .sram_rst ( reset_vif.reset_n ));

//Rst and Clock generation
  initial begin
    wb_clk   = 0;
    utmi_clk = 0;
    sram_clk = 0;
  end

  always @(hs_mode_f) begin
    if (hs_mode_f == 1) begin
      utmi_clk_freq = 60;
      utmi_clk_tp   = 1000.0/utmi_clk_freq;
    end
    else begin
      utmi_clk_freq = 12;
      utmi_clk_tp   = 1000.0/utmi_clk_freq;
    end
  end
  
  initial begin
    //12 or 60Mhz
    utmi_clk = 0;
    utmi_clk_tp = 1000.0/utmi_clk_freq;
    forever begin
      #(utmi_clk_tp/2) utmi_clk = ~utmi_clk;
    end
  end

  always #(10/2) wb_clk   = ~wb_clk;
  always #(10/2) sram_clk = ~sram_clk;

//DUT Instantiation
 usbf_top dut(
	       // WISHBONE Interface signal connection
               .clk_i               ( wb_vif.clk_i             ),
               .rst_i               ( wb_vif.wb_rst            ),
               .wb_addr_i           ( wb_vif.wb_addr_i         ),
               .wb_data_i           ( wb_vif.wb_data_i         ),
               .wb_data_o           ( wb_vif.wb_data_o         ),
               .wb_ack_o            ( wb_vif.wb_ack_o          ),
               .wb_we_i             ( wb_vif.wb_we_i           ),
               .wb_stb_i            ( wb_vif.wb_stb_i          ),
               .wb_cyc_i            ( wb_vif.wb_cyc_i          ),
               .inta_o              ( wb_vif.inta_o            ),
               .intb_o              ( wb_vif.intb_o            ),
               .dma_req_o           ( wb_vif.dma_req_o         ),
               .dma_ack_i           ( wb_vif.dma_ack_i         ),
               .susp_o              ( wb_vif.susp_o            ),
               .resume_req_i        ( wb_vif.resume_req_i      ),
               // UTMI Interface
               .phy_clk_pad_i       ( utmi_vif.utmi_clk        ),
               .phy_rst_pad_o       ( utmi_vif.phy_rst_o       ),
               .DataOut_pad_o       ( utmi_vif.DataOut_o       ),
               .TxValid_pad_o       ( utmi_vif.TxValid_o       ),
               .TxReady_pad_i       ( utmi_vif.TxReady_i       ),
               .RxValid_pad_i       ( utmi_vif.RxValid_i       ),
               .RxActive_pad_i      ( utmi_vif.RxActive_i      ),
               .RxError_pad_i       ( utmi_vif.RxError_i       ),
               .DataIn_pad_i        ( utmi_vif.DataIn_i        ),
               .XcvSelect_pad_o     ( utmi_vif.XcvSelect_o     ),
               .TermSel_pad_o       ( utmi_vif.TermSel_o       ),
               .SuspendM_pad_o      ( utmi_vif.SuspendM_o      ),
               .LineState_pad_i     ( utmi_vif.LineState_i     ),
               .OpMode_pad_o        ( utmi_vif.OpMode_o        ),
               .usb_vbus_pad_i      ( utmi_vif.usb_vbus_i      ),
               .VControl_Load_pad_o ( utmi_vif.VControl_Load_o ),
               .VControl_pad_o      ( utmi_vif.VControl_o      ),
               .VStatus_pad_i       ( utmi_vif.VStatus_i       ),
               // Buffer Memory Inter face
               .sram_adr_o          ( sram_vif.sram_adr_o      ),
               .sram_data_i         ( sram_vif.sram_data_i     ),
               .sram_data_o         ( sram_vif.sram_data_o     ),
               .sram_re_o           ( sram_vif.sram_re_o       ),
               .sram_we_o           ( sram_vif.sram_we_o       )
             );

//Register interfaces to config_db
  initial begin
    uvm_config_db#(virtual reset_intf)::set(null,"*","reset_vif",reset_vif);
    uvm_config_db#(virtual wb_intf   )::set(null,"*","wb_vif",wb_vif);
    uvm_config_db#(virtual utmi_intf )::set(null,"*","utmi_vif",utmi_vif);
    uvm_config_db#(virtual sram_intf )::set(null,"*","sram_vif",sram_vif);
  end

//Run test
  initial begin
    run_test();
  end

endmodule:top
