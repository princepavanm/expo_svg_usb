///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN MOHAMMED_KHADEER LOKESH MADHURA                            //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  reset_drv                                                           //
//      Project Name      :  USB 3.1                                                             //
//      component name    :   Driver                                                             //
//      Description       :  This module drives the all signals to DUT                           //
//     Additional Comments:                                                                      //
//                                                                                               //
//                                                                                               //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////








class reset_drv extends uvm_driver#(reset_tr);

  `uvm_component_utils(reset_drv)

  reset_tr               tr_h;

  virtual reset_intf     reset_pif;

  function new(string name="reset_drv", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual reset_intf)::get(this, " ", "reset_pif", reset_pif))
      `uvm_fatal("RESET_DRIVER", "***** Could not get reset_pif *****")
  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
        req.print();
        drive_tx(req);
      seq_item_port.item_done();
    end
  endtask:run_phase

  virtual task drive_tx(reset_tr     tr_h);
  begin
  if(req.phy_ulpi_d>8'h00)begin  
  	if(tr_h.kind == reset_tr::DEASSERT) begin
        	reset_pif.reset_n = 1'b0;
     
		top.buff_pif.phy_ulpi_dir <= req.phy_ulpi_dir;
		top.buff_pif.phy_ulpi_nxt <=  req.phy_ulpi_nxt;
		top.buff_pif.buff_driver_cb.phy_ulpi_d <=  req.phy_ulpi_d;	
	 	repeat (tr_h.cycles) @(reset_pif.reset_cb);
    	end
    	else begin
      		reset_pif.reset_n <= '1;
	  
        	top.buff_pif.phy_ulpi_dir <= req.phy_ulpi_dir;
		top.buff_pif.phy_ulpi_nxt <=  req.phy_ulpi_nxt;
		top.buff_pif.buff_driver_cb.phy_ulpi_d <=  req.phy_ulpi_d;	
		top.buff_pif.buff_driver_cb.opt_enable_hs <=  req.opt_enable_hs;	
		repeat(tr_h.cycles) @(reset_pif.reset_cb);
	end
  end
    
  else if(req.phy_ulpi_d==8'h00) begin
    	//wait(top.buff_pif.dbg_linestate==0) 
	if(req.dbg_linestate==0)begin
    	
    		reset_pif.reset_n <= '1;
 	  
       		top.buff_pif.phy_ulpi_dir <= req.phy_ulpi_dir;
		top.buff_pif.phy_ulpi_nxt <=  req.phy_ulpi_nxt;
		top.buff_pif.buff_driver_cb.phy_ulpi_d <=  req.phy_ulpi_d;	
		top.buff_pif.buff_driver_cb.opt_enable_hs <=  req.opt_enable_hs;	
		repeat(tr_h.cycles) @(reset_pif.reset_cb);
    	end 
	else if(req.dbg_linestate==1 && req.se0_reset==0) 
		wait(top.buff_pif.dbg_linestate==2'h0) begin
			reset_pif.reset_n <= '1;
	  
       			top.buff_pif.phy_ulpi_dir <= req.phy_ulpi_dir;
			top.buff_pif.phy_ulpi_nxt <=  req.phy_ulpi_nxt;
			top.buff_pif.buff_driver_cb.phy_ulpi_d <=  req.phy_ulpi_d;	
			top.buff_pif.buff_driver_cb.opt_enable_hs <=  req.opt_enable_hs;	
		repeat(tr_h.cycles) @(reset_pif.reset_cb);
	end
	else if(req.dbg_linestate==1 && req.se0_reset==1)begin 
		if(req.phy_stp_out==0) wait(top.buff_pif.se0_reset==1) begin
			reset_pif.reset_n <= '1;
	  
       			top.buff_pif.phy_ulpi_dir <= req.phy_ulpi_dir;
			top.buff_pif.phy_ulpi_nxt <=  req.phy_ulpi_nxt;
			top.buff_pif.buff_driver_cb.phy_ulpi_d <=  req.phy_ulpi_d;	
			top.buff_pif.buff_driver_cb.opt_enable_hs <=  req.opt_enable_hs;	
			repeat(tr_h.cycles) @(reset_pif.reset_cb);
		end
		else 			wait(top.buff_pif.phy_ulpi_stp==1) begin
			reset_pif.reset_n <= '1;
	  
       			top.buff_pif.phy_ulpi_dir <= req.phy_ulpi_dir;
			top.buff_pif.phy_ulpi_nxt <=  req.phy_ulpi_nxt;
			top.buff_pif.buff_driver_cb.phy_ulpi_d <=  req.phy_ulpi_d;	
			top.buff_pif.buff_driver_cb.opt_enable_hs <=  req.opt_enable_hs;	
			repeat(tr_h.cycles) @(reset_pif.reset_cb);
		end
	end



   end 
   end 
	//top.buff_pif.phy_ulpi_dir <= req.phy_ulpi_dir;
	//top.buff_pif.phy_ulpi_nxt <=  req.phy_ulpi_nxt;
  endtask:drive_tx

endclass:reset_drv


