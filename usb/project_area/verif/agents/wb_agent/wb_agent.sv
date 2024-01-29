class wb_agent extends uvm_agent;
  `uvm_component_utils(wb_agent)

  virtual wb_intf     wb_vif;

  wb_drv      wb_drv_h; 
  wb_sqr      wb_sqr_h; 
  wb_cov      wb_cov_h; 
  wb_mon      wb_mon_h; 

  function new(string name="wb_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     wb_mon_h = wb_mon::type_id::create("wb_mon_h", this);
     wb_drv_h = wb_drv::type_id::create("wb_drv_h", this);
     wb_sqr_h = wb_sqr::type_id::create("wb_sqr_h", this);
     wb_cov_h = wb_cov::type_id::create("wb_cov_h", this);

    if(!uvm_config_db#(virtual wb_intf)::get(this," ","wb_vif",wb_vif))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
    uvm_config_db#(virtual wb_intf)::set(this,"*","wb_vif",wb_vif);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    wb_drv_h.seq_item_port.connect(wb_sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:wb_agent
