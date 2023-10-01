///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :   ANGAPPAN                                                           //
//      Revision tag      :                                                                      //
//      Module Name       :                                                                      //
//      Project Name      :                                                                      //
//      component name    :                                                                      //
//      Description       :	This module provides a test to generate clocks                   //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class usb_base_test extends uvm_test;

  	usb_env      env_h; 
  	`uvm_component_utils(usb_base_test)
	usb_base_seq usb_bse_seq;
	usb_phy_rx_seq    phy_rx_seq_h;
	usb_virtual_sequence    virtual_seq_h;
	
	usb_virtual_sqr 	 v_sqr_h;
  
	function new(string name="usb_base_test", uvm_component parent=null);
    	super.new(name, parent);
	  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    env_h = usb_env::type_id::create("env_h", this);
    usb_bse_seq = usb_base_seq::type_id::create("usb_bse_seq", this);
    phy_rx_seq_h = usb_phy_rx_seq::type_id::create("phy_rx_seq_h", this);
    v_sqr_h = usb_virtual_sqr::type_id::create("v_sqr_h", this);
    virtual_seq_h = usb_virtual_sequence::type_id::create("virtual_seq_h", this);
   endfunction:build_phase

  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_factory factory = uvm_factory::get();
    uvm_top.print_topology();
    //factory.print();
  endfunction:end_of_elaboration_phase

  task run_phase (uvm_phase phase);
		super.run_phase(phase);
    `uvm_info(get_name(), "run_phase", UVM_HIGH)
		phase.raise_objection(this);


        //usb_bse_seq.start(env_h.buff_mst_agent_h.sqr_h); //without virtual sequencer
       	//	begin
	//       usb_bse_seq.start(env_h.v_sqr_h.buff_mst_agent_sqr_h); //with virtual sequencer
        //       phy_rx_seq_h.start(env_h.v_sqr_h.phy_rx_agent_sqr_h); //with virtual sequencer
	//	end

	
	//test start by virtual sequence
	
	begin
		virtual_seq_h.start(env_h.v_sqr_h);
	end
		#30;
		phase.drop_objection(this);
	endtask

	
   function void report_phase(uvm_phase phase);
    		uvm_report_server reportserver=uvm_report_server::get_server();
	
      $display("\n\n");
      $display("\t\t\t\t\t\t\t\t\t**************************************************");
      $display("\t\t\t\t\t\t\t\t\t****************** TEST Summary ******************");
      $display("\t\t\t\t\t\t\t\t\t**************************************************");


    if((reportserver.get_severity_count(UVM_FATAL)==0)&&(reportserver.get_severity_count(UVM_WARNING)==0)&&(reportserver.get_severity_count(UVM_ERROR)==0))  begin
      $display("\t\t\t\t\t\t\t\t\t**************************************************");
      $display("\t\t\t\t\t\t\t\t\t****************** TEST  PASSED ******************");
      $display("\t\t\t\t\t\t\t\t\t**************************************************");
    end//if_end

    else begin
      $display("\t\t\t\t\t\t\t\t\t**************************************************");
      $display("\t\t\t\t\t\t\t\t\t                    \\ / ");
      $display("\t\t\t\t\t\t\t\t\t                    oVo ");
      $display("\t\t\t\t\t\t\t\t\t                \\___XXX___/ ");
      $display("\t\t\t\t\t\t\t\t\t                 __XXXXX__ ");
      $display("\t\t\t\t\t\t\t\t\t                /__XXXXX__\\ ");
      $display("\t\t\t\t\t\t\t\t\t                /   XXX   \\ ");
      $display("\t\t\t\t\t\t\t\t\t                     V ");
      $display("\t\t\t\t\t\t\t\t\t                TEST  FAILED          ");
      $display("\t\t\t\t\t\t\t\t\t**************************************************");
    end//else_end

  endfunction:report_phase

  endclass:usb_base_test
