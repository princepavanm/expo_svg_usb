///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        //
//      Revision tag      :  06/10/2023                                                          //
//      Module Name       :  usb_phy_rx_seq                                                      //
//      Project Name      :  USB 3.1                                                             //
//      component name    :  Sequence                                                            //
//      Description       :  a sequence is parameterized with the type of sequence_item,         //
//                           this defines the type of the item sequence that will send/receive   //
//                           to/from the driver.                     				 //
//     Additional Comments:                                                                      //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class usb_phy_rx_seq extends uvm_sequence#(phy_rx);

  `uvm_object_utils(usb_phy_rx_seq)

  function new(string name="usb_phy_rx_seq");
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
  
endclass:usb_phy_rx_seq
