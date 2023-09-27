///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :                                                                      //
//      Revision tag      :                                                                      //
//      Module Name       :                                                                      //
//      Project Name      :                                                                      //
//      component name    :                                                                      //
//      Description       :	This module provides a test to generate clocks                       //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class usb_sbd extends uvm_scoreboard;

  `uvm_analysis_imp_decl(_buff)
  `uvm_analysis_imp_decl(_phy)

  uvm_analysis_imp_buff#(buff_tx, usb_sbd) imp_buff_h;
  uvm_analysis_imp_phy#(phy_tx, usb_sbd) imp_phy_h;

  function new(string name="usb_sbd", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    imp_buff_h = new("imp_buff_h", this);
    imp_phy_h = new("imp_phy_h", this);

  endfunction:build_phase

  function void write_buff(buff_tx tx);

    `uvm_info("SBD", "Gettting tx from buff Interface", UVM_LOW)

  endfunction

  function void write_phy(phy_tx tx);

    `uvm_info("SBD", "Gettting tx from phy Interface", UVM_LOW)

  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("SBD","Comparition Logic : Run_phase", UVM_LOW)

  endtask:run_phase

  virtual function check_phase(uvm_phase phase);
    super.check_phase(phase);

    `uvm_info("SBD","Comparition Logic : Check_phase", UVM_LOW)

  endfunction:check_phase

  virtual function report_phase(uvm_phase phase);
    super.report_phase(phase);

    `uvm_info("SBD","Passed and Failed ", UVM_LOW)

  endfunction:report_phase

endclass:usb_sbd
