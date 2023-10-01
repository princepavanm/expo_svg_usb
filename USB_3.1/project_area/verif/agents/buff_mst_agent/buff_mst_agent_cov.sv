///////////////////////////////////////////////////////////////////////////////////////////////////
//      Company:  Expolog Technologies.                                                          //
//           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               //
//                                                                                               //
//      Engineer          :                                                                      //
//      Revision tag      :                                                                      //
//      Module Name       :                                                                      //
//      Project Name      :                                                                      //
//      component name    :                                                                      //
//      Description       :	This module provides a test to generate clocks                       //
//                                                                                               //
//                                                                                               //
//      Additional Comments:                                                                     //
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

class buff_mst_agent_cov extends uvm_subscriber#(buff_tx);

  `uvm_component_utils(buff_mst_agent_cov)

  uvm_analysis_imp#(buff_tx, buff_mst_agent_cov)       buff_mst_agent_cov_port;

  buff_tx   tx_h;

  covergroup cg();

    // Implement Cover bins here

  endgroup:cg

  function new(string name="buff_mst_agent_cov", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    buff_mst_agent_cov_port = new("buff_mst_agent_cov_port", this);
    tx_h = buff_tx::type_id::create("tx_h", this);
  endfunction:build_phase

  function void write(buff_tx   t);

    `uvm_info("buff_mst_agent_COV", "From Coverage Write function", UVM_HIGH)

  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("buff_mst_agent_COV","From Coverage Run Phase", UVM_HIGH)

  endtask:run_phase

endclass:buff_mst_agent_cov
