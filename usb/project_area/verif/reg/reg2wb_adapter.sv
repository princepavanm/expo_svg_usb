typedef class wb_tx;
class reg2wb_adapter extends uvm_reg_adapter;
  `uvm_object_utils(reg2wb_adapter)

  function new(string name = "reg2wb_adapter");
    super.new(name);
    //     supports_byte_enable = 0;
    //     provides_responses = 1;
  endfunction

  //usb_reg_block_i.csr.write(status, data); -> uvm_reg_bus_op -> WIshbone kind of transaction
  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    wb_tx wb = wb_tx::type_id::create("wb");
    wb.wr_rd = (rw.kind == UVM_READ) ? 0 : 1;
    wb.addr = rw.addr;
    wb.data = rw.data;
    return wb;
  endfunction: reg2bus

  //used during the read opeation : driver creates the tx with read data updated, reg model internally uses it to covert to uvm_reg_bus_op format.
  virtual function void bus2reg( uvm_sequence_item  bus_item, ref uvm_reg_bus_op  rw);
    wb_tx  wb;
    if (!$cast(wb, bus_item)) begin
      `uvm_fatal("NOT_APB_TYPE","Provided bus_item is not of the correct type")
      return;
    end
    rw.kind = wb.wr_rd ? UVM_WRITE : UVM_READ;
    rw.addr = wb.addr;
    rw.data = wb.data;
    rw.status = UVM_IS_OK;
  endfunction: bus2reg

endclass: reg2wb_adapter
