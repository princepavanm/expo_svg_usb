class usb_env extends uvm_env;
  `uvm_component_utils(usb_env)

  reset_agent	reset_agent_h;
  wb_agent	wb_agent_h;
  utmi_agent	utmi_agent_h;
  sram_agent	sram_agent_h;

  usb_reg_block         usb_rm;
  reg2wb_adapter        adapter; //this converts wb_tx to register_tx and viceversa

  usb_virtual_sqr 	 v_sqr_h;

  function new(string name="usb_env", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    v_sqr_h = usb_virtual_sqr::type_id::create("v_sqr_h", this);

    reset_agent_h = reset_agent::type_id::create("reset_agent_h", this);
    wb_agent_h    = wb_agent::type_id::create("wb_agent_h", this);
    utmi_agent_h  = utmi_agent::type_id::create("utmi_agent_h", this);
    sram_agent_h  = sram_agent::type_id::create("sram_agent_h", this);
    usb_rm        = new("usb_rm");
    adapter       = new("adapter");
    usb_rm.build(); 
    //put register model in resource DB, so that it can be accessed in entire TB
    uvm_resource_db#(usb_reg_block)::set("GLOBAL", "USB_RM", usb_rm, this);
  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    usb_rm.wb_map.set_sequencer(wb_agent_h.wb_sqr_h, adapter);
    
    v_sqr_h.reset_sqr_h  = reset_agent_h.reset_sqr_h;
    v_sqr_h.wb_sqr_h     = wb_agent_h.wb_sqr_h;
    v_sqr_h.utmi_sqr_h   = utmi_agent_h.utmi_sqr_h;
    v_sqr_h.sram_sqr_h   = sram_agent_h.sram_sqr_h;

  endfunction:connect_phase

  function void report();

    uvm_report_server reportserver=uvm_report_server::get_server();

    $display("**************************************************");
    $display("****************** TEST Summary ******************");
    $display("**************************************************");

    if((reportserver.get_severity_count(UVM_FATAL)==0)&&(reportserver.get_severity_count(UVM_WARNING)==0)&&(reportserver.get_severity_count(UVM_ERROR)==0))  begin
      $display("**************************************************");
      $display("****************** TEST  PASSED ******************");
      $display("**************************************************");
    end//if_end

    else begin
      $display("**************************************************");
      $display("                    \\ / ");
      $display("                    oVo ");
      $display("                \\___XXX___/ ");
      $display("                 __XXXXX__ ");
      $display("                /__XXXXX__\\ ");
      $display("                /   XXX   \\ ");
      $display("                     V ");
      $display("                TEST  FAILED          ");
      $display("**************************************************");
    end//else_end

  endfunction:report

endclass:usb_env
