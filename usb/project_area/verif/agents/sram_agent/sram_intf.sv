interface sram_intf(input logic sram_clk, sram_rst);

  //Implement Modpot and clocking block here
  bit	[14:0]	sram_adr_o;
  bit	[31:0]	sram_data_i;
  bit	[31:0]	sram_data_o;
  bit		sram_re_o;
  bit		sram_we_o;
endinterface:sram_intf
