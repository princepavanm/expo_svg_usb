class hs_pkt extends base_pkt;

  `uvm_object_utils(hs_pkt)

  function new(string name="hs_pkt");
    super.new(name);
  endfunction

  constraint hs_pid_c {
	pid[3:0] == pkt_type; 
	pid[3:0] inside {ACK, NAK, STALL, NYET};
  }

endclass
