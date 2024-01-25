class wb_agent extends uvm_agent;

  wb_agent_mon      mon_h; 

  virtual wb_intf     wb_pif;

  wb_agent_drv      drv_h; 
  wb_agent_sqr      sqr_h; 
  wb_agent_cov      cov_h; 

  `uvm_component_utils(wb_agent)

  function new(string name="wb_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     mon_h = wb_agent_mon::type_id::create("mon_h", this);

     drv_h = wb_agent_drv::type_id::create("drv_h", this);
     sqr_h = wb_agent_sqr::type_id::create("sqr_h", this);
     cov_h = wb_agent_cov::type_id::create("cov_h", this);

    if(!uvm_config_db#(virtual wb_intf)::get(this," ","wb_pif",wb_pif))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
    uvm_config_db#(virtual wb_intf)::set(this,"*","wb_pif",wb_pif);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    drv_h.seq_item_port.connect(sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:wb_agent
