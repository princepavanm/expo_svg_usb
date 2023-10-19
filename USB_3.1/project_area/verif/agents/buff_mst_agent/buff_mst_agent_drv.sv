///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  buff_mst_agent_drv                                                  //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  uvm_driver                                                          //
//      Description       :  This module drives the all signals to DUT                           //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class buff_mst_agent_drv extends uvm_driver#(buff_tx);

  `uvm_component_utils(buff_mst_agent_drv)

  buff_tx               tx_h;

  virtual buff_intf     buff_pif;

  function new(string name="buff_mst_agent_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual buff_intf)::get(this, " ", "buff_pif", buff_pif))
      `uvm_fatal("DRV", "***** Could not get buff_pif *****")
  endfunction:build_phase

  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
	  `uvm_info(get_full_name(), "\n\t\t\t********* stimulus generated at BUFF_MASTER_SIDE   ***********\n",UVM_MEDIUM)
	  req.print();
      drive_tx(req);
      seq_item_port.item_done();
    end
  endtask:run_phase

  task drive_tx(buff_tx     tx_h);
    //Implement driving logic here
    buff_pif.buff_driver_cb.phy_ulpi_nxt      <= 1;
    buff_pif.buff_driver_cb.phy_ulpi_d        <= 8'b1011_0100 ;
	buff_pif.buff_driver_cb.opt_enable_hs     <= 1'b0;
	
	buff_pif.buff_driver_cb.opt_disable_all   <= 1;
	buff_pif.buff_driver_cb.opt_ignore_vbus   <= 1;
	buff_pif.buff_driver_cb.buf_in_addr       <= 9'b0_0000_1010;
	buff_pif.buff_driver_cb.buf_in_data       <= 8'b1111_1111;
	buff_pif.buff_driver_cb.buf_in_wren       <= 1;
	buff_pif.buff_driver_cb.buf_in_commit     <= 1; 
	buff_pif.buff_driver_cb.buf_in_commit_len <= 10'b00_0000_0001;
	buff_pif.buff_driver_cb.buf_out_addr      <= 9'b0_0000_0000;
	buff_pif.buff_driver_cb.buf_out_arm       <= 1;
    //top.vif.buff_driver_cb.buf_in_addr <=9'hFF;
  endtask:drive_tx

endclass:buff_mst_agent_drv
