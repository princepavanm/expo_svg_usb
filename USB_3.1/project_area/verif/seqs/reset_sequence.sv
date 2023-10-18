///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  Angappan	Mohammad_Khadeer Lokesh Madhura                          //     
//      Revision tag      :  06/10/2023                                                          //     
//      Module Name       :  Reset_sequence                                                      //     
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Sequence                                                            //
//      Description       : This module provides uvm_sequence_items which are                   //
//                          sent to the driver via the sequencer.                        	 //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class reset_sequence extends uvm_sequence #(reset_tr);

  `uvm_object_utils(reset_sequence)
  
  function new (string name = "reset_sequence");
    super.new(name);
    `uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
	
   // `ifdef UVM_POST_VERSION_1_1
   //   set_automatic_phase_objection(1);
   // `endif
  endfunction: new
  
  virtual task pre_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.raise_objection(this);
    end
  endtask:pre_body
	
  virtual task body();
  begin
    `uvm_do_with(req, {kind == ASSERT; cycles == 2;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;});    
    
    `uvm_do_with(req, {kind == DEASSERT; cycles == 100;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;});
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 512010;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;}); 
    							//510000 not enough to enter ST_TXCMD_0(d'30) state
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 15;phy_ulpi_dir == 1;phy_ulpi_nxt==1;phy_ulpi_d==8'h01;opt_enable_hs==0;}); 
    							// (in ST_TXCMD_0)dir & nxt has to be ON for ST_TXCMD_0 --> ST_TXCMD_1--> ST_RST_2,3.
    
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;}); 
    							// (in ST_RX_0)below 5 cycles not work for to enter ST_RX_0 (D'20) ---> ST_RST_4 (d'4).
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;}); 
    							// (in ST_RST_4 (4)) to ST_TXCMD_0
    
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==1;phy_ulpi_d==8'h01;opt_enable_hs==0;}); 
    							// (in ST_TXCMD_0 (d'30)) to ST_TXCMD_1 (d'31) following next clk--> IDLE (d'10)
   							// (in ST_TXCMD_0) to IDLE to reset the DC_WRAP (becz,non zero value for reseting DC_WRAP) 
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 2;phy_ulpi_dir == 1;phy_ulpi_nxt==1;phy_ulpi_d==8'h01;opt_enable_hs==0;}); 
    							// (in phy_ulpi_dir make high to enter ST_RX_0 (d'20) )                              
    							 
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 1;phy_ulpi_nxt==0;phy_ulpi_d==8'h00;opt_enable_hs==0;req.dbg_linestate==0;req.phy_stp_out==0;}); 
    							//try to be in ST_RX_0(d'20) to get the data 00 from phy_d_in
							//for that,deassert the (nxt==0)                                                      
							
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h00;opt_enable_hs==0;req.dbg_linestate==1; req.se0_reset==0;req.phy_stp_out==0;}); 
							//this sequence will helps to enter IDLE state again for increment DC_WRAP++.   
							
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h00;opt_enable_hs==1;req.dbg_linestate==1; req.se0_reset==1;req.phy_stp_out==0;}); 
							////dir should be 0,in this is condition only let se0_reset_signal should high.        
						 
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==1;phy_ulpi_d==8'h00;opt_enable_hs==1;req.dbg_linestate==1; req.se0_reset==1;req.phy_stp_out==0;}); 
        						// from chirp_1-->we entered in TX_CMD_0 by before sequences , then asserting nxt1 for TX_CMD_0 --> tx_cmd_1
							// from tx_cmd_1  automatically state will enter to CHRIP2(d'52) state                                                      						    // then,by this sequence also, state will go to CHIRP_3(d'53) when dc_wrap becomes 600
							// further sequence will helps to enter CHRIP_4 by dir-->1
    

   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 1;phy_ulpi_nxt==1;phy_ulpi_d==8'h00;opt_enable_hs==1;req.dbg_linestate==1; req.se0_reset==1;req.phy_stp_out==1;}); 
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==1;phy_ulpi_d==8'h00;opt_enable_hs==1;req.dbg_linestate==1; req.se0_reset==1;req.phy_stp_out==1;}); 
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 1;phy_ulpi_nxt==1;phy_ulpi_d==8'h00;opt_enable_hs==1;req.dbg_linestate==1; req.se0_reset==0;req.phy_stp_out==0;}); 
 							//by these 3 sequences  -----> state (ST_CHIRP_3 --> ST_RX_0 )


							
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==1;phy_ulpi_d==8'h00;opt_enable_hs==1;req.dbg_linestate==1; req.se0_reset==0;req.phy_stp_out==0;}); 
  							//dir =0 for enter  into ---> ST_CHIRP4(d'54)-->tx_cmd_0(d'30)-->tx_cmd_1(d'31)--->ST_CHIRP(d'55)
							// so,following	state like ST_CHIRP5 will automatically enter.then it will assert stat_hs output signal.
							// following clock it move to IDLE state.						
							 					 
																						
							 
   
   
   
   
   
   
   /*  `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 0;phy_ulpi_nxt==1;phy_ulpi_d==8'h00;opt_enable_hs==1;req.dbg_linestate==1; req.se0_reset==1;req.phy_stp_out==0;}); 
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir == 1;phy_ulpi_nxt==1;phy_ulpi_d==8'h00;opt_enable_hs==1;req.dbg_linestate==1; req.se0_reset==1;req.phy_stp_out==1;}); */
 						 
	end
    //`uvm_do_with(req, {kind == ASSERT; cycles == 5;}); //TODO after FSM study
  endtask: body
  
  virtual task post_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.drop_objection(this);
    end
  endtask:post_body
	
endclass: reset_sequence


