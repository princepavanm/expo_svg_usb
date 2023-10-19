///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  reset_mon                                                           //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  uvm_monitor                                                         //
//      Description       :  This module a passive component used to capture signals.            //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //                                                               
///////////////////////////////////////////////////////////////////////////////////////////////////

class reset_mon extends uvm_monitor;

  `uvm_component_utils(reset_mon)

  virtual reset_intf     vif;
  
  uvm_analysis_port #(reset_tr)       reset_mon_port;
  
  uvm_event reset_event = uvm_event_pool::get_global("reset_n");

  function new(string name="reset_mon", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(!uvm_config_db#(virtual reset_intf)::get(this, " ", "vif", vif))
      `uvm_fatal("DRV", "***** Could not get vif *****")

    reset_mon_port = new("reset_mon_port", this);

  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("reset_mon","Monitor Run Phase", UVM_LOW)
    forever begin
      reset_tr tr = reset_tr::type_id::create("tr",this);
      //detect(tr);
      analysis_port.write(tr);
    end
  endtask:run_phase
  
  virtual task detect(reset_tr tr);
    `uvm_info("reset_mon_detect","From Monitor Detect task ", UVM_HIGH)
    @(vif.reset_n);
    assert(!isunknown(vif.reset_n));
    if (vif.reset_n == 1'b0) begin
      tr.kind = reset_tr:: ASSERT;
      reset_event.trigger();
    end
    else begin
      tr.kind = reset_tr::DEASSERT;
      reset_event.reset(.wakeup(1));
    end
  endtask: detect

endclass:reset_mon
