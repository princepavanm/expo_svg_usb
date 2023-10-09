///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  Angappan,Mohammad_Khadeer,Lokesh, Madhura.                          //     
//      Revision tag      :  06/10/2023                                                          //     
//      Module Name       :  usb_base_seq                                                        //     
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Sequence                                                            //
//      Description       :  This module base sequence for all sequences                 	 //
//                                                                                               //
//                                                                                               //                                                 
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class usb_base_seq extends uvm_sequence#(buff_tx);

  `uvm_object_utils(usb_base_seq)

  function new(string name="usb_base_seq");
    super.new(name);
  endfunction

  virtual task pre_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.raise_objection(this);
    end
  endtask:pre_body

  virtual task body();
    `uvm_do(req);
    // req.print();
    // Functionality of sequence are coded here
  endtask:body

  virtual task post_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.drop_objection(this);
    end
  endtask:post_body
  
endclass:usb_base_seq
