class sram_agent extends uvm_agent;

  sram_agent_mon      mon_h; 

  virtual sram_intf     sram_pif;

  sram_agent_drv      drv_h; 
  sram_agent_sqr      sqr_h; 
  sram_agent_cov      cov_h; 

  `uvm_component_utils(sram_agent)

  function new(string name="sram_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     mon_h = sram_agent_mon::type_id::create("mon_h", this);

     drv_h = sram_agent_drv::type_id::create("drv_h", this);
     sqr_h = sram_agent_sqr::type_id::create("sqr_h", this);
     cov_h = sram_agent_cov::type_id::create("cov_h", this);

    if(!uvm_config_db#(virtual sram_intf)::get(this," ","sram_pif",sram_pif))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
    uvm_config_db#(virtual sram_intf)::set(this,"*","sram_pif",sram_pif);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    drv_h.seq_item_port.connect(sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:sram_agent
