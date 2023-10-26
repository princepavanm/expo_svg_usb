///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision Tag      :  06/10/2023                                                          //
//      Module Name       :  buff_mst_agent_cov                                                  //
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  uvm_subscriber ( Coverage )                                         //
//      Description       :  This module creations for functional coverage.                      //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class buff_mst_agent_cov extends uvm_subscriber#(buff_tx);

  `uvm_component_utils(buff_mst_agent_cov)

  uvm_analysis_imp#(buff_tx, buff_mst_agent_cov)       buff_mst_agent_cov_port;

  buff_tx   tx_h;

	covergroup usb_buffer_cover;


		usb_phy_ulpi_dir:coverpoint tx_h.phy_ulpi_dir{bins low={0};
				    	    		      bins high={1};}

                usb_phy_ulpi_nxt:coverpoint tx_h.phy_ulpi_nxt{bins low={0};
				    	    		      bins high={1};}

		usb_opt_disable_all:coverpoint tx_h.opt_disable_all{bins low={0};
				    	    		            bins high={1};}
								    
		usb_opt_enable_hs:coverpoint tx_h.opt_enable_hs{bins low={0};
				    	    		        bins high={1};}	

		usb_opt_ignore_vbus:coverpoint tx_h.opt_ignore_vbus{bins low={0};
				    	    		            bins high={1};}								

	  	usb_addr:coverpoint tx_h.buf_in_addr { bins low={[0:171]};
						       bins Medium={[172:343]};    // 9bit
					               bins high={[344:515]};}
					           
		usb_data:coverpoint tx_h.buf_in_data { bins low={[0:85]};
	                                               bins high= {[85:170]};      //8bit
					               bins Medium={[171:257]};}

		usb_wren:coverpoint tx_h.buf_in_wren{bins low={0};   
				    	              bins high={1};}

		usb_buf_in_commit:coverpoint tx_h.buf_in_commit{bins low={0};   
				    	              bins high={1};}

		usb_commit_len:coverpoint tx_h.buf_in_commit_len{bins low={[0:683]};
						       bins high={[684:1366]};   // 11bit
						       bins Medium={[1367:2050]};}
				      
                usb_addr_out:coverpoint tx_h.buf_out_addr{bins low={[0:171]};
						       bins Medium={[172:343]};    // 9bit
					               bins high={[344:515]};}

                usb_buf_out_arm:coverpoint tx_h.buf_out_arm{bins low={0};
				    	     bins high={1};}
          
         
        	
		usb_sop:coverpoint tx_h.sop{bins low={0};
				    	     bins high={1};}

	        usb_eop:coverpoint tx_h.eop {bins low={0};
				    	     bins high={1};}



	
   endgroup

  function new(string name="buff_mst_agent_cov", uvm_component parent=null);
    super.new(name, parent);
    usb_buffer_cover= new();
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    buff_mst_agent_cov_port = new("buff_mst_agent_cov_port", this);
    tx_h = buff_tx::type_id::create("tx_h", this);
  endfunction:build_phase

  function void write(buff_tx   t);

    `uvm_info("buff_mst_agent_COV", "From Coverage Write function", UVM_LOW)
    t.print();

  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    usb_buffer_cover.sample();

    `uvm_info("buff_mst_agent_COV","From Coverage Run Phase", UVM_HIGH)

  endtask:run_phase



endclass:buff_mst_agent_cov
