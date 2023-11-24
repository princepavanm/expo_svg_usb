///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //     
//      Revision Tag      :  06/10/2023                                                          //     
//      Module Name       :  Reset_sequence                                                      //     
//      Project Name      :  USB 3.1                                                             //
//      Component Name    :  Sequence                                                            //
//      Description       :  This module provides uvm_sequence_items which are                   //
//                           sent to the driver via the sequencer.                               //
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
  	`uvm_info("[SEQUENCWE_NAME] :","reset_sequence",UVM_LOW);
	  
  //  `uvm_do_with(req, {kind == ASSERT; cycles == 2;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;});    
    reset_design_signals();
    `uvm_do_with(req, {kind == DEASSERT; cycles == 100;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;});
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 512010;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;}); 
    							//510000 not enough to enter ST_TXCMD_0(d'30) state
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 15;phy_ulpi_dir == 1;phy_ulpi_nxt==1;phy_ulpi_d==8'h01;opt_enable_hs==0;}); 
    							// (in ST_TXCMD_0)dir & nxt has to be ON for ST_TXCMD_0 --> ST_TXCMD_1--> ST_RST_2,3.
 						 
  end
endtask: body

  virtual task post_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.drop_objection(this);
    end
  endtask:post_body

  task reset_design_signals();
    //top.buff_pif.phy_ulpi_d        = 0;
    top.buff_pif.phy_ulpi_dir      = 0;
    top.buff_pif.phy_ulpi_nxt      = 0;
   
    top.buff_pif.opt_disable_all   = 0;
    top.buff_pif.opt_enable_hs     = 0;
    top.buff_pif.opt_ignore_vbus   = 0;
    
    top.buff_pif.buf_in_addr       = 0;
    top.buff_pif.buf_in_data       = 0;
    top.buff_pif.buf_in_wren       = 0;
    top.buff_pif.buf_in_commit     = 0;
    top.buff_pif.buf_in_commit_len = 0;
    top.buff_pif.buf_out_addr      = 0;
    top.buff_pif.buf_out_arm       = 0;
  endtask
	
endclass: reset_sequence


