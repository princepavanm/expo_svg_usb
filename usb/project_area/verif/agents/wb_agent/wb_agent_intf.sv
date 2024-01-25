interface wb_intf(input logic wb_clk, wb_rst);

  //Implement Modpot and clocking block here
logic    [16:0]    wb_addr_i;
logic    [31:0]    wb_data_i;
logic    [31:0]    wb_data_o;
logic        wb_ack_o;
logic        wb_we_i;
logic        wb_stb_i;
logic        wb_cyc_i;
logic        inta_o;
logic        intb_o;
logic    [15:0]    dma_req_o;
logic    [15:0]    dma_ack_i;
logic        susp_o;
logic        resume_req_i;
endinterface:wb_intf
