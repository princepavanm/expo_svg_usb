///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN MOHAMMED_KHADEER LOKESH MADHURA                            //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  buff_mst_agent_drv                                                  //
//      Project Name      :  USB 3.1                                                             //
//      component name    :   Driver                                                             //
//      Description       :  This module drives the all signals to DUT                           //
//     Additional Comments:                                                                      //
//                                                                                               //
//                                                                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////


class buff_mst_agent_drv extends uvm_driver#(buff_tx);

  `uvm_component_utils(buff_mst_agent_drv)

  buff_tx               tx_h;

  virtual buff_intf     vif;

  function new(string name="buff_mst_agent_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual buff_intf)::get(this, " ", "buff_pif", vif))
      `uvm_fatal("DRV", "***** Could not get vif *****")
  endfunction:build_phase

  task run_phase(uvm_phase phase);
    begin
      seq_item_port.get_next_item(req);
     	//displaying randomly generated stimulus
     	$display("\n");
	`uvm_info(get_full_name(), "\n\t\t\t********* stimulus generated at BUFF_MASTER_SIDE   ***********\n",UVM_MEDIUM)
	req.print();
     	$display("\n");
       
	//calling task for driving signals
//	drive_tx(req);
      seq_item_port.item_done();
    end
  endtask:run_phase

  task drive_tx(buff_tx     tx_h);

     //Implement driving logic here
//top.vif.buff_driver_cb.buf_in_addr <=9'hFF;
  endtask:drive_tx

endclass:buff_mst_agent_drv
