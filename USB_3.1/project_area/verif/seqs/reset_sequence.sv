///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :                                                                      //
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
    `uvm_do_with(req, {kind == DEASSERT; cycles == 2;phy_ulpi_dir == 0;});
    `uvm_do_with(req, {kind == ASSERT; cycles == 512010;phy_ulpi_dir == 0;}); //510000 not work
    `uvm_do_with(req, {kind == ASSERT; cycles == 1;phy_ulpi_dir == 1;});
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

