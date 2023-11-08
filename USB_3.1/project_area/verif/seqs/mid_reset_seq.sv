class mid_reset_sequence extends uvm_sequence #(reset_tr);

  `uvm_object_utils(mid_reset_sequence)
  
  function new (string name = "mid_reset_sequence");
    super.new(name);
    `uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
	
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
  	`uvm_info("[SEQUENCWE_NAME] :","mid_reset_sequence",UVM_LOW);
	  
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
    
    
   	 `uvm_do_with(req, {kind == DEASSERT; cycles == 100;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;});


	  `uvm_do_with(req, {kind == ASSERT; cycles == 2;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;});    
    
    `uvm_do_with(req, {kind == DEASSERT; cycles == 100;phy_ulpi_dir == 0;phy_ulpi_nxt==0;phy_ulpi_d==8'h01;opt_enable_hs==0;});
    
   
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
	
endclass: mid_reset_sequence

