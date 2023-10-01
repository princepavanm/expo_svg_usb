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

class phy_rx_agent_drv extends uvm_driver#(phy_rx);

  `uvm_component_utils(phy_rx_agent_drv)

  phy_rx               tx_h;

  virtual phy_intf     vif;

  function new(string name="phy_rx_agent_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual phy_intf)::get(this, " ", "phy_pif", vif))
      `uvm_fatal("DRV", "***** Could not get vif *****")
  endfunction:build_phase

  task run_phase(uvm_phase phase);

     seq_item_port.get_next_item(req);
     	
     	//displaying randomly generated stimulus
     		$display("\n");	
		`uvm_info(get_full_name(),"\n\t\t\t********* stimulus generated at PHY_RX_AGENT side  ***********\n",UVM_MEDIUM)
		req.print();
     		$display("\n");	
       
	//calling task for driving signals
		//drive_tx(req);

     seq_item_port.item_done();

  endtask:run_phase

  task drive_tx(phy_rx     tx_h);

     //Implement driving logic here

  endtask:drive_tx

endclass:phy_rx_agent_drv
