class usb_sbd extends uvm_scoreboard;

  `uvm_analysis_imp_decl(_wb)
  `uvm_analysis_imp_decl(_utmi)
  `uvm_analysis_imp_decl(_sram)

  uvm_analysis_imp_wb#(wb_tx, usb_sbd) imp_wb_h;
  uvm_analysis_imp_utmi#(utmi_tx, usb_sbd) imp_utmi_h;
  uvm_analysis_imp_sram#(sram_tx, usb_sbd) imp_sram_h;

  function new(string name="usb_sbd", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    imp_wb_h = new("imp_wb_h", this);
    imp_utmi_h = new("imp_utmi_h", this);
    imp_sram_h = new("imp_sram_h", this);

  endfunction:build_phase

  function void write_wb(wb_tx tx);

    `uvm_info("SBD", "Gettting tx from wb Interface", UVM_LOW)

  endfunction

  function void write_utmi(utmi_tx tx);

    `uvm_info("SBD", "Gettting tx from utmi Interface", UVM_LOW)

  endfunction

  function void write_sram(sram_tx tx);

    `uvm_info("SBD", "Gettting tx from sram Interface", UVM_LOW)

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
