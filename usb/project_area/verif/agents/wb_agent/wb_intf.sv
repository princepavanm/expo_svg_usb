interface wb_intf(input logic clk_i, wb_rst);

  //Implement Modpot and clocking block here
  bit [`USBF_UFC_HADR:0]  wb_addr_i   ;
  bit             [31:0]  wb_data_i   ;
  bit             [31:0]  wb_data_o   ;
  bit                     wb_ack_o    ;
  bit                     wb_we_i     ;
  bit                     wb_stb_i    ;
  bit                     wb_cyc_i    ;
  bit                     inta_o      ;
  bit                     intb_o      ;
  bit             [15:0]  dma_req_o   ;
  bit             [15:0]  dma_ack_i   ;
  bit                     susp_o      ;
  bit                     resume_req_i;

  //we need to develop clocking block
  //modport is not required for TB purpose
  clocking wb_drv_cb@(posedge clk_i);
    default input #1 output #1;
    output  wb_addr_i   ;
    output  wb_data_i   ;
    output  wb_we_i     ;
    output  wb_stb_i    ;
    output  wb_cyc_i    ;
    output  dma_ack_i   ;
    output  resume_req_i;
    input   wb_data_o   ;
    input   wb_ack_o    ;
    input   inta_o      ;
    input   intb_o      ;
    input   dma_req_o   ;
    input   susp_o      ;
  endclocking
  
  clocking wb_mon_cb@(posedge clk_i);
    default input #1; //sampel all monitor inputs #1 unit before the +edge of the clock
    input   wb_addr_i   ;
    input   wb_data_i   ;
    input   wb_we_i     ;
    input   wb_stb_i    ;
    input   wb_cyc_i    ;
    input   dma_ack_i   ;
    input   resume_req_i;
    input   wb_data_o   ;
    input   wb_ack_o    ;
    input   inta_o      ;
    input   intb_o      ;
    input   dma_req_o   ;
    input   susp_o      ;
  endclocking


endinterface:wb_intf
