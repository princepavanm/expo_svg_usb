///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  phy_rx_agent_cov                                                    //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  uvm_subscriber ( Coverage )                                         //
//      Description       :  This module creations for functional coverage                       //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class phy_rx_agent_cov extends uvm_subscriber#(phy_rx);

  `uvm_component_utils(phy_rx_agent_cov)

  uvm_analysis_imp#(phy_rx, phy_rx_agent_cov)       phy_rx_agent_cov_port;

  phy_rx   tx_h;

  covergroup usb_phyrx_cover;

		usb_rx_addr:coverpoint tx_h.phy_pipe_rx_datak { bins low={[0:1]};
								bins Medium={[2:3]};
							        bins high= {[4:5]};}  
					           
		usb_rx_data:coverpoint tx_h.phy_pipe_rx_data {  bins data_phtrx={[0:21845]};
							        bins Medium={[21846:43691]};   // 16bit 65536
						                bins high={[43692:65537]};} 
                                          
		usb_phypipe:coverpoint tx_h.phy_pipe_rx_valid { bins low = {0};
				    	                        bins high = {1};}  

		usb_pwrpresent:coverpoint tx_h.phy_pwrpresent { bins low = {0};
				    	                        bins high = {1};}

	    usb_status:coverpoint tx_h.phy_rx_status { bins low={[0:2]};
                                                       bins Medium={[3:5]};
					               bins high ={[6:8]};}

   endgroup

  function new(string name="phy_rx_agent_cov", uvm_component parent=null);
    super.new(name, parent);
    usb_phyrx_cover = new();
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    phy_rx_agent_cov_port = new("phy_rx_agent_cov_port", this);
    tx_h = phy_rx::type_id::create("tx_h", this);
  endfunction:build_phase

  function void write(phy_rx   t);
    `uvm_info("phy_rx_agent_COV", "From Coverage Write function", UVM_HIGH)
    t.print();
  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    usb_phyrx_cover.sample();
    `uvm_info("phy_rx_agent_COV","From Coverage Run Phase", UVM_HIGH)
  endtask:run_phase

endclass:phy_rx_agent_cov
