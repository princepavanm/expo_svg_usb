class wb_usb_config_seq extends wb_base_seq;
  `uvm_object_utils(wb_usb_config_seq)

  rand int intA[15:1];
  bit [1:0] ep_type;
  bit [1:0] tr_type;
  bit [3:0] ep_no;

  function new(string name="wb_usb_config_seq");
    super.new(name);
  endfunction


  task body();
    //Set FA == 77h
    usb_rm.fa.write(status, 7'h77, .parent(this));  //some ramdom addr
    //TB can't program CSR
    //Program INT_MSK
    data = {7'h0, 9'h1FF, 7'h0, 9'h1FF};
    usb_rm.int_msk.write(status, data, .parent(this));
    //FRM_NAT can't be programmed since it is RO
    //Enumeraton requires to use EP0 => we need to program EP0 related registers
    
    //EP0_CSR
    data = {2'b0, 2'b0, 2'b0, 2'b11, 2'b00, 4'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b1, 2'b10, 11'd8};
    usb_rm.ep_csrA[0].write(status, data, .parent(this));
    
    //EP0_INT
    data = {2'b0, 6'h3F, 2'b0, 6'h3F, 9'b0, 7'h0};
    usb_rm.ep_intA[0].write(status, data, .parent(this));
    
    //EP0_BUF0
    data = {1'b0, EP_BUF_SIZE, EP0_BUF0_PTR};
    usb_rm.ep_buf0A[0].write(status, data, .parent(this));
    
    //EP0_BUF1
    data = {1'b0, EP_BUF_SIZE, EP0_BUF1_PTR};
    usb_rm.ep_buf1A[0].write(status, data, .parent(this));

  endtask
endclass
