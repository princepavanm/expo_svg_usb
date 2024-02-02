class data_pkt extends base_pkt;

  rand data_pkt_type_t     data_pkt_type;
  rand bit [7:0] dataQ[$];
  rand integer len;
  rand bit req_dir;
  rand bit [7:0] brequest;
       bit [15:0] crc16;

  `uvm_object_utils_begin(data_pkt)
  	`uvm_field_queue_int(dataQ, UVM_ALL_ON)
  	`uvm_field_int(crc16, UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name="data_pkt");
    super.new(name);
  endfunction
 
  constraint dataQ_c {
  	dataQ.size() == len;
  	len inside {[0:64]};
  }

  constraint data_pkt_type_c {
  	(data_pkt_type == SETUP_STATUS_DATA_PKT)   -> ( dataQ.size() == 1 && dataQ[0] == 8'h0 && pid == 8'hC3);
    (data_pkt_type == SETUP_STAGE_DATA_PKT)    -> ( dataQ.size() == 8 && pid == 8'hC3);
    (data_pkt_type == SETUP_DATA_DATA_OUT_PKT) -> ( dataQ.size() == 1 && pid == 8'hC3 && dataQ[0] == 8'h77);
  	(data_pkt_type == SETUP_STAGE_DATA_PKT)    -> ( dataQ[0] == { req_dir, 2'b0, 5'b0} && 
  						        dataQ[1] == brequest &&
  						        dataQ[2] == 8'h0     &&
  						        dataQ[3] == 8'h0     &&
  						        dataQ[4] == 8'h0     &&
  						        dataQ[5] == 8'h0     &&
  						        dataQ[6] == 8'd8     &&
  						        dataQ[7] == 8'h0
  						      );

      }

  
  function bit [15:0] calc_crc16();
    bit [15:0] crc_in = 16'hFFFF;
    bit [7:0]  din;
    bit [15:0] crc_out;
    
    foreach (dataQ[j]) begin
      //din = dataQ[j].reverse();
      din = {
      	dataQ[j][0],
      	dataQ[j][1],
      	dataQ[j][2],
      	dataQ[j][3],
      	dataQ[j][4],
      	dataQ[j][5],
      	dataQ[j][6],
      	dataQ[j][7]
            };
      
      crc_out[0] = din[7] ^ din[6] ^ din[5] ^ din[4] ^ din[3] ^ din[2] ^ din[1] ^ din[0] ^ crc_in[8] ^ crc_in[9] ^ crc_in[10] ^ crc_in[11] ^ crc_in[12] ^ crc_in[13] ^ crc_in[14] ^ crc_in[15];
      crc_out[1] = din[7] ^ din[6] ^ din[5] ^ din[4] ^ din[3] ^ din[2] ^ din[1] ^ crc_in[9] ^ crc_in[10] ^ crc_in[11] ^ crc_in[12] ^ crc_in[13] ^ crc_in[14] ^ crc_in[15];
      crc_out[2] = din[1] ^ din[0] ^ crc_in[8] ^ crc_in[9];
      crc_out[3] = din[2] ^ din[1] ^ crc_in[9] ^ crc_in[10];
      crc_out[4] = din[3] ^ din[2] ^ crc_in[10] ^ crc_in[11];
      crc_out[5] = din[4] ^ din[3] ^ crc_in[11] ^ crc_in[12];
      crc_out[6] = din[5] ^ din[4] ^ crc_in[12] ^ crc_in[13];
      crc_out[7] = din[6] ^ din[5] ^ crc_in[13] ^ crc_in[14];
      crc_out[8] = din[7] ^ din[6] ^ crc_in[0] ^ crc_in[14] ^ crc_in[15];
      crc_out[9] = din[7] ^ crc_in[1] ^ crc_in[15];
      crc_out[10] = crc_in[2];
      crc_out[11] = crc_in[3];
      crc_out[12] = crc_in[4];
      crc_out[13] = crc_in[5];
      crc_out[14] = crc_in[6];
      crc_out[15] = din[7] ^ din[6] ^ din[5] ^ din[4] ^ din[3] ^ din[2] ^ din[1] ^ din[0] ^ crc_in[7] ^ crc_in[8] ^ crc_in[9] ^ crc_in[10] ^ crc_in[11] ^ crc_in[12] ^ crc_in[13] ^ crc_in[14] ^ crc_in[15];
      crc_in      = crc_out;
      //$display("TB CRC16 - %h", crc_in);
    end
    return crc_out;
  endfunction
  
  function void post_randomize();
  	crc16 = calc_crc16();
  endfunction

endclass
