///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  phy_rx_agent_drv                                                    //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  uvm_driver                                                          //
//      Description       :  This module drives the all signals to DUT                           //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class phy_rx_agent_drv extends uvm_driver#(phy_rx);

  `uvm_component_utils(phy_rx_agent_drv)

  phy_rx               tx_h;

  virtual phy_intf     phy_pif;

  function new(string name="phy_rx_agent_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual phy_intf)::get(this, " ", "phy_pif", phy_pif))
      `uvm_fatal("DRV", "***** Could not get phy_pif *****")
  endfunction:build_phase

  task run_phase(uvm_phase phase);
    seq_item_port.get_next_item(req);
      //displaying randomly generated stimulus
      $display("\n");	
      `uvm_info(get_full_name(),"\n\t\t\t********* stimulus generated at PHY_RX_AGENT side  ***********\n",UVM_MEDIUM)
      req.print();
      $display("\n");	 
      //calling task for driving signals
      drive_tx(req);
    seq_item_port.item_done();
  endtask:run_phase

  task drive_tx(phy_rx     tx_h);
     //Implement driving logic here
    phy_pif.phy_rx_driver_cb.phy_pipe_pclk <= 1;
    phy_pif.phy_rx_driver_cb.phy_pipe_rx_data <= 16'b0000_1111_0000_1111;
    phy_pif.phy_rx_driver_cb.phy_pipe_rx_datak <= 2'b 10;
    phy_pif.phy_rx_driver_cb.phy_pipe_rx_valid <= 1;
    phy_pif.phy_rx_driver_cb.phy_rx_elecidle <= 0;
    phy_pif.phy_rx_driver_cb.phy_rx_status <= 3'b101;
    phy_pif.phy_rx_driver_cb.phy_phy_status <= 1;
    phy_pif.phy_rx_driver_cb.phy_pwrpresent <= 1;
  endtask:drive_tx

endclass:phy_rx_agent_drv
