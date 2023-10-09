///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN MOHAMMED_KHADEER LOKESH MADHURA                            //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  buff_mst_agent_mon                                                  //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Monitor                                                             //
//      Description       :  This module a passive component used to capture DUT signals using a //
//                           virtual interface and translate them into a sequence item format    //
//     Additional Comments:                                                                      //
///////////////////////////////////////////////////////////////////////////////////////////////////

class buff_mst_agent_mon extends uvm_monitor;

  `uvm_component_utils(buff_mst_agent_mon)
    //int report_id_counter; // Counter for report IDs //TODO ANGAPPAN

  buff_tx   tx_h;

  uvm_analysis_port #(buff_tx)       buff_mst_agent_mon_port;

  function new(string name="buff_mst_agent_mon", uvm_component parent=null);
    super.new(name, parent);
    //report_id_counter = 0;
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    buff_mst_agent_mon_port = new("buff_mst_agent_mon_port", this);
    tx_h = buff_tx::type_id::create("tx_h", this);

  endfunction:build_phase
	
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
	//report_id_counter++;
    `uvm_info("buff_mst_agent_mon","Monitor Run Phase", UVM_HIGH)
	
    //int report_id = uvm_report_object::get_report_id();
	
    //`uvm_info(get_type_name(),$psprintf("monitor report_phase_id: %0d",report_id_counter), UVM_LOW)

  endtask:run_phase

endclass:buff_mst_agent_mon
