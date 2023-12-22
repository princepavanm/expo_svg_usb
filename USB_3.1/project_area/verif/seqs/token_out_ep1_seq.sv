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

class token_out_ep1_seq extends uvm_sequence #(reset_tr);

  `uvm_object_utils(token_out_ep1_seq)
  
  function new (string name = "token_out_ep1_seq");
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
  `uvm_info("[SEQUENCWE_NAME] :","token_out_ep1_seq",UVM_LOW);
	  
    `uvm_info("[TOKEN_PKT_SEQUENCE]","############## --- TOKEN PKT SEQUENCE STARTED --- #############",UVM_LOW);
	  
    `uvm_do_with(req, {kind == ASSERT; cycles == 2;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;});    
    
    `uvm_do_with(req, {kind == DEASSERT; cycles == 100;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'hB4;opt_enable_hs==0;});
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 512010;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'hB4;opt_enable_hs==0;}); 
    							//510000 not enough to enter ST_TXCMD_0(d'30) state
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 15;phy_ulpi_dir == 1;phy_ulpi_nxt==1;phy_ulpi_d==8'hB4;opt_enable_hs==0;}); 
    							// (in ST_TXCMD_0)dir & nxt has to be ON for ST_TXCMD_0 --> ST_TXCMD_1--> ST_RST_2,3.
							// and it will enter in ST_RX_0.                 
						
    
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==0;phy_ulpi_nxt==1;phy_ulpi_d==8'h04;opt_enable_hs==0;}); 
    							// (in ST_RX_0)below 5 cycles not work for to enter ST_RX_0 (D'20) ---> ST_RST_4 (d'4).
    
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==1;phy_ulpi_d==8'hB4;opt_enable_hs==0;}); 
    							// 						 
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==0;phy_ulpi_d==8'hB4;opt_enable_hs==0;}); 
    							// in ST_RX_0 --> B4 value assigned to in_rx_cmd and keep in this state only by keeping high for DIR.                                                    

  //----------------------------------------------------------------------------------------------------------------
		//pkt_out_latch should ON. then ,only PACKET fsm will get excute.
		//for that,here i make nxt==1 -->							
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==0;phy_ulpi_d==8'hB4;opt_enable_hs==0;}); 
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==0;phy_ulpi_nxt==0;phy_ulpi_d==8'hB4;opt_enable_hs==0;}); 
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==0;phy_ulpi_d==8'hB4;opt_enable_hs==0;});
  	 	//so,here ulpi state continue with ST_RX_0 and packet state cont with IDLE.

  //------------------------------------------------------------------------------------------------------------------------
 
    `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==1;phy_ulpi_d==8'hB4;opt_enable_hs==0;}); 
    							// at usb2_packet FSM ,dir=0 for entering into IDLE state by in_act=0 . 
							                  
  
  //------------------------------------------------------------------------A5 --> [start_of_frame]------------------------------------------------
						       
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==0;phy_ulpi_d==8'hA5;opt_enable_hs==0;}); 
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==1;phy_ulpi_d==8'hA5;opt_enable_hs==0;});
 		//ulpi FSM in ST_RX_O (20) & Packet FSM in  ST_WAIT_EOP (25) State.
 		//so, ULPI should deassert OUT_ACt,its diffr in IN_ACT in packet fsm and  its brings to IDLE state.
 		//for that below sequence will start.
 

   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==0;phy_ulpi_d==8'hA5;opt_enable_hs==0;});
 		//rx_active will get 0--->then,pkt_out_act will get 0 by giving value A5 (1010 0101) --> in ST_RX_0 state --> through in_rx_cmd
		//by this sequence ,ulpi FSM stay in ST_RX_0(20) only but, Packet FSM entered into IDLE with  in_act & in_latch low. 
		//  to get on those signals ,nxt again needs to ON.
//--------------------------------------------------------------------------------------------------------------------------

		//for making ON those signals such as in_Act & in_latch, below sequence will flow with nxt--> high 	
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==0;phy_ulpi_nxt==1;phy_ulpi_d==8'hA5;opt_enable_hs==0;});
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==1;phy_ulpi_d==8'hA5;opt_enable_hs==0;});
;
   
   
     //------------------------------------------------------------------------------------------------------------------------------------------------

 
/* `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==0;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
   `uvm_do_with(req, {kind == ASSERT; cycles == 6;phy_ulpi_dir ==1;phy_ulpi_nxt==1;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
   `uvm_do_with(req, {kind == ASSERT; cycles == 6;phy_ulpi_dir ==0;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); 
   `uvm_do_with(req, {kind == ASSERT; cycles == 5;phy_ulpi_dir ==1;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });

   `uvm_do_with(req, {kind == ASSERT; cycles == 3;phy_ulpi_dir ==0;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
  `uvm_do_with(req, {kind == ASSERT; cycles == 3;phy_ulpi_dir ==1;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
  `uvm_do_with(req, {kind == ASSERT; cycles == 3;phy_ulpi_dir ==1;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });

`uvm_do_with(req, {kind == ASSERT; cycles == 3;phy_ulpi_dir ==0;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
`uvm_do_with(req, {kind == ASSERT; cycles == 3;phy_ulpi_dir ==1;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
`uvm_do_with(req, {kind == ASSERT; cycles == 3;phy_ulpi_dir ==1;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
`uvm_do_with(req, {kind == ASSERT; cycles == 3;phy_ulpi_dir ==0;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
`uvm_do_with(req, {kind == ASSERT; cycles == 3;phy_ulpi_dir ==1;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });



	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==0;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); 
 	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==1;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==0;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==1;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; });
 	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==0;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // st_wait_eop



 `uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir==1;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // in_act
 
  `uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==1;phy_ulpi_nxt==1 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // st_wait_eop

	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==1;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // ulpi-ST_RX_O
	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==0;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // ulpi-ST_RX_O
	`uvm_do_with(req, {kind == ASSERT; cycles == 10;phy_ulpi_dir ==1;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // 


	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==1;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // ulpi-ST_RX_O
	`uvm_do_with(req, {kind == ASSERT; cycles == 4;phy_ulpi_dir ==0;phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // ulpi-ST_RX_O*/



   
     `uvm_do_with(req, {kind == ASSERT; cycles == 10; phy_ulpi_dir ==0; phy_ulpi_nxt==1; phy_ulpi_d==8'hE1; opt_enable_hs==0;}); //01
      `uvm_do_with(req, {kind == ASSERT; cycles == 10; phy_ulpi_dir ==1; phy_ulpi_nxt==1; phy_ulpi_d==8'hE1; opt_enable_hs==0;});
      `uvm_do_with(req, {kind == ASSERT; cycles == 10; phy_ulpi_dir ==0; phy_ulpi_nxt==1; phy_ulpi_d==8'hE1; opt_enable_hs==0;});

      `uvm_do_with(req, {kind == ASSERT; cycles == 2 ; phy_ulpi_dir ==1; phy_ulpi_nxt==1; phy_ulpi_d==8'hE1; opt_enable_hs==0; dbg_linestate==0;});

      //-------------------------------------------------------------------------------------------------------------------------------------------------------

      `uvm_do_with(req, {kind == ASSERT; cycles == 2 ; phy_ulpi_dir ==1; phy_ulpi_nxt==1; phy_ulpi_d==8'h00; opt_enable_hs==0; dbg_linestate==0;});
      `uvm_do_with(req, {kind == ASSERT; cycles == 1 ; phy_ulpi_dir ==0; phy_ulpi_nxt==1; phy_ulpi_d==8'h00; opt_enable_hs==0; dbg_linestate==0;});
      `uvm_do_with(req, {kind == ASSERT; cycles == 1 ; phy_ulpi_dir ==0; phy_ulpi_nxt==0; phy_ulpi_d==8'h00; opt_enable_hs==0; dbg_linestate==0;});

      //-------------------------------------------------------------------------------------------------------------------------------------------------------

      `uvm_do_with(req, {kind == ASSERT; cycles == 2 ; phy_ulpi_dir ==1; phy_ulpi_nxt==1; phy_ulpi_d==8'hE1; opt_enable_hs==0;});
      `uvm_do_with(req, {kind == ASSERT; cycles == 5 ; phy_ulpi_dir ==0; phy_ulpi_nxt==1; phy_ulpi_d==8'hE1; opt_enable_hs==0;}); 
      `uvm_do_with(req, {kind == ASSERT; cycles == 5 ; phy_ulpi_dir ==0; phy_ulpi_nxt==1; phy_ulpi_d==8'hE1; opt_enable_hs==0;}); 
      `uvm_do_with(req, {kind == ASSERT; cycles == 4;  phy_ulpi_dir==1;  phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // in_act
      `uvm_do_with(req, {kind == ASSERT; cycles == 4;  phy_ulpi_dir==0;  phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); 
      `uvm_do_with(req, {kind == ASSERT; cycles == 4;  phy_ulpi_dir==1;  phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // in_act
      `uvm_do_with(req, {kind == ASSERT; cycles == 4;  phy_ulpi_dir==0;  phy_ulpi_nxt==0 ;phy_ulpi_d==8'hE1;opt_enable_hs==0; }); // in_act

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
	
endclass: token_out_ep1_seq


