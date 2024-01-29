///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company           :  Expolog Technologies.                                               //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  reset_drv                                                           //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  uvm_driver                                                          //
//      Description       :  This module drives the all signals to DUT                           //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class reset_drv extends uvm_driver#(reset_tr);

  `uvm_component_utils(reset_drv)

  reset_tr               tr_h;

  virtual reset_intf     reset_vif;

  function new(string name="reset_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual reset_intf)::get(this, " ", "reset_vif", reset_vif))
      `uvm_fatal("RESET_DRIVER", "***** Could not get reset_vif *****")
  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
        req.print();
        drive_tx(req);
      seq_item_port.item_done();
    end
  endtask:run_phase

  virtual task drive_tx(reset_tr     tr_h);
    if(tr_h.kind == reset_tr::DEASSERT) begin
      reset_vif.reset_n = 1'b0;
      reset_input_signals();
      repeat (tr_h.cycles) @(reset_vif.reset_cb);
    end
    else begin
      reset_vif.reset_n <= '1;
      repeat(tr_h.cycles) @(reset_vif.reset_cb);
    end
  endtask

  task reset_input_signals();
	  /*
    top.buff_vif.phy_ulpi_dir      = 0;
    top.buff_vif.phy_ulpi_nxt      = 0;
    top.buff_vif.opt_disable_all   = 0;
    top.buff_vif.opt_enable_hs     = 0;
    top.buff_vif.opt_ignore_vbus   = 0;
    top.buff_vif.buf_in_addr       = 0;
    top.buff_vif.buf_in_data       = 0;
    top.buff_vif.buf_in_wren       = 0;
    top.buff_vif.buf_in_commit     = 0;
    top.buff_vif.buf_in_commit_len = 0;
    top.buff_vif.buf_out_addr      = 0;
    top.buff_vif.buf_out_arm       = 0;
*/  
endtask
endclass:reset_drv
