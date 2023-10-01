///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :ANGAPPAN                                                              //
//      Revision tag      :                                                                      //
//      Module Name       :usb_reset_seq                                                         //
//      Project Name      :USB_3.1                                                               //
//      component name    :                                                                      //
//      Description       :	This module provides a test to generate clocks                   //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class usb_reset_seq extends uvm_sequence#(buff_tx);

  `uvm_object_utils(usb_reset_seq)

  function new(string name="usb_reset_seq");
    super.new(name);
  endfunction

   virtual task body();

   	begin
	`uvm_do_with(req,{req.reset_n==0;});
	#5;
       	`uvm_do_with(req,{req.reset_n==1;});
	end
	//req.print();
   // Functionality of sequence are coded here

  endtask:body

    
endclass:usb_reset_seq
