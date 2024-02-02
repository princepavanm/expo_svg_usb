typedef bit [3:0] token_pkt_type;

class token_pkt extends base_pkt;

  rand bit [6:0] addr;
  rand bit setup_frame_f;
  rand bit [3:0] endp;
       bit [4:0] crc5;
  static token_pkt_type token_pkt_typeQ[$];
  rand token_pkt_type token;

  `uvm_object_utils_begin(token_pkt)
  	`uvm_field_int(addr, UVM_ALL_ON)
  	`uvm_field_int(endp, UVM_ALL_ON)
  	`uvm_field_int(crc5, UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name="token_pkt");
    super.new(name);
  endfunction
 
  constraint token_pid_c {
  	//token inside {token_pkt_typeQ};
	token ==  pkt_type;
	pid[3:0] inside {OUT, IN, SETUP};
        pid[3:0] == token;
	(token == SETUP) -> (endp == 4'b0);
	(setup_frame_f == 1) -> (endp == 4'b0);
  	addr == `FA;
  }
  
  function void post_randomize();
    crc5 = calc_crc5();
  endfunction
  
  function bit [4:0] calc_crc5();
    //implement CRC5 generation logic
    //PID is not part of CRC generation logic
    //frame_num
    bit	[6:0]	token_fadr;
    bit	[3:0]	token_endp;
    bit	[4:0]	crc_in;
    bit	[10:0]	din;
    bit	[4:0]	crc_out;
    crc_in = 5'h1F;
    token_fadr = addr;
    token_endp = endp;
    din = { token_fadr[0],
            token_fadr[1],
            token_fadr[2],
            token_fadr[3],
            token_fadr[4],
            token_fadr[5],
            token_fadr[6],
            token_endp[0],
            token_endp[1],
            token_endp[2],
            token_endp[3]
          };
        
    crc_out[0] = din[10] ^ din[9] ^ din[6] ^ din[5] ^ din[3] ^ din[0] ^ crc_in[0] ^ crc_in[3] ^ crc_in[4];
    
    crc_out[1] = din[10] ^ din[7] ^ din[6] ^ din[4] ^ din[1] ^ crc_in[0] ^ crc_in[1] ^ crc_in[4];
    
    crc_out[2] = din[10] ^ din[9] ^ din[8] ^ din[7] ^ din[6] ^ din[3] ^ din[2] ^ din[0] ^ crc_in[0] ^ crc_in[1] ^ crc_in[2] ^ crc_in[3] ^ crc_in[4];
    
    crc_out[3] = din[10] ^ din[9] ^ din[8] ^ din[7] ^ din[4] ^ din[3] ^	din[1] ^ crc_in[1] ^ crc_in[2] ^ crc_in[3] ^ crc_in[4];
    
    crc_out[4] = din[10] ^ din[9] ^ din[8] ^ din[5] ^ din[4] ^ din[2] ^	crc_in[2] ^ crc_in[3] ^ crc_in[4];
    
    //return ~crc_out;
    return ~{crc_out[0], crc_out[1], crc_out[2], crc_out[3], crc_out[4]};
  endfunction
  
endclass
