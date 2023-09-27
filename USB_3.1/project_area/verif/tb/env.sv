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

class usb_env extends uvm_env;
  `uvm_component_utils(usb_env)

  buff_mst_agent	buff_mst_agent_h;
  phy_rx_agent	phy_rx_agent_h;

  usb_virtual_sqr 	 v_sqr_h;

  function new(string name="usb_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    v_sqr_h = usb_virtual_sqr::type_id::create("v_sqr_h", this);

    buff_mst_agent_h = buff_mst_agent::type_id::create("buff_mst_agent_h", this);
    phy_rx_agent_h = phy_rx_agent::type_id::create("phy_rx_agent_h", this);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    v_sqr_h.buff_mst_agent_sqr_h = buff_mst_agent_h.sqr_h;
    v_sqr_h.phy_rx_agent_sqr_h = phy_rx_agent_h.sqr_h;

  endfunction:connect_phase

  function void report();

    uvm_report_server reportserver=uvm_report_server::get_server();

    $display("**************************************************");
    $display("****************** TEST Summary ******************");
    $display("**************************************************");

    if((reportserver.get_severity_count(UVM_FATAL)==0)&&(reportserver.get_severity_count(UVM_WARNING)==0)&&(reportserver.get_severity_count(UVM_ERROR)==0))  begin
      $display("**************************************************");
      $display("****************** TEST  PASSED ******************");
      $display("**************************************************");
    end//if_end

    else begin
      $display("**************************************************");
      $display("                    \\ / ");
      $display("                    oVo ");
      $display("                \\___XXX___/ ");
      $display("                 __XXXXX__ ");
      $display("                /__XXXXX__\\ ");
      $display("                /   XXX   \\ ");
      $display("                     V ");
      $display("                TEST  FAILED          ");
      $display("**************************************************");
    end//else_end

  endfunction:report

endclass:usb_env
