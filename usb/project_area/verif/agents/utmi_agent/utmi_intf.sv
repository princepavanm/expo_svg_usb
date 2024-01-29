interface utmi_intf(input logic utmi_clk, utmi_rst);

  //Implement Modpot and clocking block here
  bit       phy_rst_o       ;
  bit [7:0] DataOut_o       ;
  bit       TxValid_o       ;
  bit       TxReady_i       ;
  bit [7:0] DataIn_i        ;
  bit       RxValid_i       ;
  bit       RxActive_i      ;
  bit       RxError_i       ;
  bit       XcvSelect_o     ;
  bit       TermSel_o       ;
  bit       SuspendM_o      ;
  bit [1:0] LineState_i     ;
  bit [1:0] OpMode_o        ;
  bit       usb_vbus_i      ;
  bit       VControl_Load_o ;
  bit [3:0] VControl_o      ;
  bit [7:0] VStatus_i       ;

endinterface:utmi_intf
