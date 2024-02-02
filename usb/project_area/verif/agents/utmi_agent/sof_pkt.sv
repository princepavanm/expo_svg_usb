class sof_pkt extends base_pkt;

  static bit [10:0] frame_num;
         bit  [4:0] crc5;

  `uvm_object_utils_begin(sof_pkt)
    `uvm_field_int(frame_num, UVM_ALL_ON)
    `uvm_field_int(crc5, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="sof_pkt");
    super.new(name);
    frame_num = frame_num + 1;
  endfunction
  
  function void post_randomize();
    crc5 = calc_crc5();
  endfunction
  
  constraint sof_pid_c {
  	pid[3:0] == 4'b0101;
  }
  
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
    {token1[2:0], token0} = frame_num;
    token_fadr = token0[6:0];
    token_endp = {token1[2:0], token0[7]};
    
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
    
    crc_out[3] = din[10] ^ din[9] ^ din[8] ^ din[7] ^ din[4] ^ din[3] ^ din[1] ^ crc_in[1] ^ crc_in[2] ^ crc_in[3] ^ crc_in[4];
    
    crc_out[4] = din[10] ^ din[9] ^ din[8] ^ din[5] ^ din[4] ^ din[2] ^ crc_in[2] ^ crc_in[3] ^ crc_in[4];
    
    //return ~crc_out;
    return ~{crc_out[0], crc_out[1], crc_out[2], crc_out[3], crc_out[4]};
  endfunction
  
endclass

