class utmi_enum_in_seq extends utmi_base_seq;
  `uvm_object_utils(utmi_enum_in_seq)

  function new(string name="utmi_enum_in_seq");
    super.new(name);
  endfunction

  task body();
    transfer_state_t state, n_state;	
    state = S_SOF;
    n_state = S_SOF;
    while(state != S_ENUM_COMPLETE) begin
      #1;
      state = n_state;
      case (state)

        S_SOF          : begin
                           `uvm_do_with( sof_pkt_h, { sof_pkt_h.pkt_type == SOF;})
                           n_state = S_SETUP_TOKEN;
                         end

        S_SETUP_TOKEN  : begin
                           `uvm_do_with( token_pkt_h, { token_pkt_h.pkt_type == SETUP;})
                           n_state = S_SETUP_DATA;
                         end

        S_SETUP_DATA   : begin
                           //`uvm_do_with( data_pkt_h, { data_pkt_h.pkt_type == DATA0; data_pkt_h.data_pkt_type == SETUP_STAGE_DATA_PKT;})
			               `uvm_do_with(data_pkt_h, {data_pkt_h.pkt_type == DATA0; data_pkt_h.data_pkt_type == SETUP_STAGE_DATA_PKT; data_pkt_h.req_dir == 1; data_pkt_h.brequest == 8'h6;})
                           n_state = S_SETUP_ACK;
                         end

        S_SETUP_ACK    : begin
                           wait ( top.utmi_vif.DataOut_o == 8'hd2);
                           n_state = S_DATA_TOKEN;
                         end

        S_DATA_TOKEN   : begin
                           `uvm_do_with( token_pkt_h, { token_pkt_h.pkt_type == IN; token_pkt_h.setup_frame_f == 1;})
                           n_state = S_DATA_DATA;
                         end

        S_DATA_DATA    : begin
                           @(negedge top.utmi_vif.TxValid_o); //completion of data packet read
                           n_state = S_DATA_ACK;
                         end

        S_DATA_ACK     : begin
                           `uvm_do_with(hs_pkt_h, {hs_pkt_h.pkt_type == ACK;})
                           n_state = S_STATUS_TOKEN;
                         end

        S_STATUS_TOKEN : begin
                           `uvm_do_with(token_pkt_h, {token_pkt_h.pkt_type == OUT; token_pkt_h.setup_frame_f == 1;})
                           n_state = S_STATUS_DATA;
                         end

        S_STATUS_DATA  : begin
                           `uvm_do_with(data_pkt_h, {data_pkt_h.pkt_type == DATA0; data_pkt_h.data_pkt_type == SETUP_STATUS_DATA_PKT;})
                           n_state = S_STATUS_ACK;
                         end
			 
        S_STATUS_ACK   : begin
                           n_state = S_ENUM_COMPLETE;
                         end
      endcase
    end	
  endtask
endclass
