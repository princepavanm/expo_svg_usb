`define FA 7'h77

typedef enum bit [4:0] {
	OUT     = 5'b0001,
	IN      = 5'b1001,
	SOF     = 5'b0101,
	SETUP   = 5'b1101,

	DATA0   = 5'b0011,
	DATA1   = 5'b1011,
	DATA2   = 5'b0111,
	MDATA   = 5'b1111,

	ACK     = 5'b0010,
	NAK     = 5'b1010,
	STALL   = 5'b1110,
	NYET    = 5'b0110,

	PRE_ERR = 5'b1100,
	SPLIT   = 5'b1000,
	PING    = 5'b0100,
	
	SPEED_NEG = 5'b1_0000,
	//ENUM,
	SUSPEND   = 5'b1_0001,
	RESUME    = 5'b1_0010,
	SPEED_NEG_FS = 5'b1_0011
} pkt_type_t;

//16 EPs => Each EP has 2 buffers
//total buffer size = 14'h400*32 = 1024*32 = 32,768
typedef enum bit [13:0] {
	EP_BUF_SIZE = 14'h0400
} ep_buf_size_t;

typedef enum bit [16:0] { //3FFF
	EP0_BUF0_PTR = 17'h0000,
	EP0_BUF1_PTR = 17'h0400,
	EP1_BUF0_PTR = 17'h0800,
	EP1_BUF1_PTR = 17'h0C00,
	EP2_BUF0_PTR = 17'h1000,
	EP2_BUF1_PTR = 17'h1400,
	EP3_BUF0_PTR = 17'h1800,
	EP3_BUF1_PTR = 17'h1C00,
	EP4_BUF0_PTR = 17'h2000,
	EP4_BUF1_PTR = 17'h2400,
	EP5_BUF0_PTR = 17'h2800,
	EP5_BUF1_PTR = 17'h2C00,
	EP6_BUF0_PTR = 17'h3000,
	EP6_BUF1_PTR = 17'h3400,
	EP7_BUF0_PTR = 17'h3800,
	EP7_BUF1_PTR = 17'h3C00,
	EP8_BUF0_PTR = 17'h4000,
	EP8_BUF1_PTR = 17'h4400,
	EP9_BUF0_PTR = 17'h4800,
	EP9_BUF1_PTR = 17'h4C00,
	EP10_BUF0_PTR = 17'h5000,
	EP10_BUF1_PTR = 17'h5400,
	EP11_BUF0_PTR = 17'h5800,
  	EP11_BUF1_PTR = 17'h5C00,
	EP12_BUF0_PTR = 17'h6000,
	EP12_BUF1_PTR = 17'h6400,
	EP13_BUF0_PTR = 17'h6800,
	EP13_BUF1_PTR = 17'h6C00,
	EP14_BUF0_PTR = 17'h7000,
	EP14_BUF1_PTR = 17'h7400,
	EP15_BUF0_PTR = 17'h7800,
	EP15_BUF1_PTR = 17'h7C00 //15 bits => 111_1100_0000_0000 => ignore lower 2 bits => 13 bits
} ep_buf_ptr_t;

typedef enum bit [2:0] {
	SETUP_STAGE_DATA_PKT,
	SETUP_STATUS_DATA_PKT,
	SETUP_DATA_DATA_OUT_PKT,
	ISO_OUT_DATA_PKT,
	BULK_OUT_DATA_PKT,
	INTR_OUT_DATA_PKT
} data_pkt_type_t;

typedef enum bit [4:0] {
	S_SOF,
	S_SETUP_TOKEN,
	S_SETUP_DATA,
	S_SETUP_ACK,
	S_DATA_TOKEN,
	S_DATA_DATA,
	S_DATA_ACK,
	S_STATUS_TOKEN,
	S_STATUS_DATA,
	S_STATUS_ACK,
	S_ENUM_COMPLETE,
	S_ISO_OUT_TOKEN,
	S_ISO_OUT_DATA
} transfer_state_t;

