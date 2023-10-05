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

class reset_drv extends uvm_driver#(reset_tr);

  `uvm_component_utils(reset_drv)

  reset_tr               tr_h;

  virtual reset_intf     reset_pif;

  function new(string name="reset_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual reset_intf)::get(this, " ", "reset_pif", reset_pif))
      `uvm_fatal("RESET_DRIVER", "***** Could not get reset_pif *****")
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

    if(tr_h.kind == reset_tr::ASSERT) begin
      reset_pif.reset_n = 1'b0;
      repeat (tr_h.cycles) @(reset_pif.reset_cb);
    end
    else begin
      reset_pif.reset_n <= '1;
	  
      repeat(tr_h.cycles) @(reset_pif.reset_cb);
    end
	top.buff_pif.phy_ulpi_dir <= 0;
  endtask:drive_tx

endclass:reset_drv
