///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company           :  Expolog Technologies.                                               //
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
      //`uvm_do_with(req, { kind == ASSERT;   cycles == 2;});
      `uvm_do_with(req, { kind == DEASSERT; cycles == 10;});
      `uvm_do_with(req, { kind == ASSERT;   cycles == 2;});
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
	
endclass: reset_sequence
