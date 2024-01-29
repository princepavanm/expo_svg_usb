class utmi_agent extends uvm_agent;
  `uvm_component_utils(utmi_agent)

  virtual utmi_intf     utmi_vif;

  utmi_drv      utmi_drv_h; 
  utmi_sqr      utmi_sqr_h; 
  utmi_cov      utmi_cov_h;
  utmi_mon      utmi_mon_h;  

  function new(string name="utmi_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     utmi_mon_h = utmi_mon::type_id::create("utmi_mon_h", this);

     utmi_drv_h = utmi_drv::type_id::create("utmi_drv_h", this);
     utmi_sqr_h = utmi_sqr::type_id::create("utmi_sqr_h", this);
     utmi_cov_h = utmi_cov::type_id::create("utmi_cov_h", this);

    if(!uvm_config_db#(virtual utmi_intf)::get(this," ","utmi_vif",utmi_vif))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
    uvm_config_db#(virtual utmi_intf)::set(this,"*","utmi_vif",utmi_vif);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    utmi_drv_h.seq_item_port.connect(utmi_sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:utmi_agent
