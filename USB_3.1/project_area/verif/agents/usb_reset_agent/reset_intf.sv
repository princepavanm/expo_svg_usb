interface reset_intf(input ext_clk);

  logic			reset_n;

  clocking reset_cb@(posedge ext_clk);
    default input #1 output #1;
    output reset_n;
  endclocking : reset_cb

  modport DUT (clocking reset_cb);
  
endinterface: reset_intf
