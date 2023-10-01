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

class usb_reset_driver extends uvm_driver#(buff_tx);

  `uvm_component_utils(usb_reset_driver)

  buff_tx               tx_h;

  virtual buff_intf     vif;

  function new(string name="usb_reset_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual buff_intf)::get(this, " ", "buff_pif", vif))
      `uvm_fatal("DRV", "***** Could not get vif *****")
  endfunction:build_phase

  task run_phase(uvm_phase phase);
	forever begin
     seq_item_port.get_next_item(req);

     	//displaying randomly generated stimulus
     		$display("\n");
		`uvm_info(get_full_name(), "\n\t\t\t********* stimulus generated at RESET_DRIVER ***********\n",UVM_HIGH)
		`uvm_info(get_name(), $psprintf ("RESET=%0b",req.reset_n),UVM_MEDIUM)
     		$display("\n");
       
	//calling task for driving signals
		//drive_tx(req);

     seq_item_port.item_done();
	end
  endtask:run_phase

  task drive_tx(buff_tx     tx_h);

     //Implement driving logic here

  endtask:drive_tx

endclass:usb_reset_driver
