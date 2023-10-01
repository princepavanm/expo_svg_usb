///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :ANGAPPAN                                                              //
//      Revision tag      :                                                                      //
//      Module Name       :usb_reset_agent                                                       //
//      Project Name      :USB_3.1                                                               //
//      component name    :                                                                      //
//      Description       :	This module provides a test to generate clocks                   //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class usb_reset_agent extends uvm_agent;

  usb_reset_driver      drv_h; 

  uvm_sequencer #(buff_tx) 	reset_seqr_h;

  virtual buff_intf     buff_pif;


  `uvm_component_utils(usb_reset_agent)

  function new(string name="usb_reset_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     drv_h = usb_reset_driver::type_id::create("drv_h", this);
     reset_seqr_h = uvm_sequencer #(buff_tx)::type_id::create("reset_seqr_h", this);


  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
	drv_h.seq_item_port.connect(reset_seqr_h.seq_item_export);
  endfunction:connect_phase

endclass:usb_reset_agent
