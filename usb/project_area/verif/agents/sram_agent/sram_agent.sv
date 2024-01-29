class sram_agent extends uvm_agent;
  `uvm_component_utils(sram_agent)

  virtual sram_intf     sram_vif;

  sram_drv      sram_drv_h; 
  sram_sqr      sram_sqr_h; 
  sram_cov      sram_cov_h; 
  sram_mon      sram_mon_h; 


  function new(string name="sram_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     sram_mon_h = sram_mon::type_id::create("sram_mon_h", this);
     sram_drv_h = sram_drv::type_id::create("sram_drv_h", this);
     sram_sqr_h = sram_sqr::type_id::create("sram_sqr_h", this);
     sram_cov_h = sram_cov::type_id::create("sram_cov_h", this);

    if(!uvm_config_db#(virtual sram_intf)::get(this," ","sram_vif",sram_vif))
      `uvm_fatal("AGENT", "***** Could not get vif *****")
    uvm_config_db#(virtual sram_intf)::set(this,"*","sram_vif",sram_vif);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    sram_drv_h.seq_item_port.connect(sram_sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:sram_agent
