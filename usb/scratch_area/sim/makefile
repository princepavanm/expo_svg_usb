TEST_NAME=usb_reg_reset_read_test

# Setting the default uvm_verbosity to UVM_MEDIUM
ifndef uvm_verbosity
override uvm_verbosity = UVM_LOW
endif

MODULE_PATH=../../../usb

SEED=10
DUMP_OPTS=DUMP_ON

DUT_DIR=$(MODULE_PATH)/project_area/design/rtl
DUT_FILE=$(DUT_DIR)/usb_rtl_file.svh

TB_DIR=$(MODULE_PATH)/project_area/verif/tb
AGENT_DIR=$(MODULE_PATH)/project_area/verif/agents
SEQ_DIR=$(MODULE_PATH)/project_area/verif/seqs
TEST_DIR=$(MODULE_PATH)/project_area/verif/tests
REG_DIR=$(MODULE_PATH)/project_area/verif/reg
WB_SEQ_DIR=$(SEQ_DIR)/wb_sequences
UTMI_SEQ_DIR=$(SEQ_DIR)/utmi_sequences
SRAM_SEQ_DIR=$(SEQ_DIR)/sram_sequences

TOP_FILE=$(TB_DIR)/top.sv

LOG_DIR=$(MODULE_PATH)/scratch_area/log
SIM_DIR=$(MODULE_PATH)/scratch_area/sim

INC_DIR=+incdir+$(DUT_DIR) +incdir+$(AGENT_DIR) +incdir+$(AGENT_DIR)/wb_agent +incdir+$(AGENT_DIR)/utmi_agent +incdir+$(AGENT_DIR)/sram_agent +incdir+$(AGENT_DIR)/reset_agent +incdir+$(TEST_DIR) +incdir+$(SEQ_DIR) +incdir+$(WB_SEQ_DIR) +incdir+$(UTMI_SEQ_DIR) +incdir+$(SRAM_SEQ_DIR) +incdir+$(TB_DIR) +incdir+$(LOG_DIR) +incdir+$(SIM_DIR)

comp:
	vlog -sv \
	+acc \
	+cover \
	+fcover \
	+define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)

vsim:
	rm -rf $(LOG_DIR)/$(TEST_NAME)_$(SEED)
	rm -rf $(TEST_NAME)_$(SEED).ucdb
	mkdir $(LOG_DIR)/$(TEST_NAME)_$(SEED)
	vsim -c -vopt \
	-sv_seed $(SEED) \
	-voptargs=+acc=npr \
	-assertdebug \
	+UVM_VERBOSITY=$(uvm_verbosity) \
	+UVM_TESTNAME=$(TEST_NAME) \
	-l $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).log \
	-sva \
	-coverage \
	-do "coverage save -onexit $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).ucdb;run -all; exit" \
	work.top

	#vsim -c -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_LOW +UVM_TESTNAME=$(TEST_NAME) -l $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).ucdb; run -all; exit" work.top

run:	comp vsim

#############################################################  usb_base_test  #############################################################

usb_base_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/usb_base_test_$(SEED)
	rm -rf usb_base_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/usb_base_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=usb_base_test -l $(LOG_DIR)/usb_base_test_$(SEED)/usb_base_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/usb_base_test_$(SEED)/usb_base_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

########################################################  usb_reg_reset_read_test  ########################################################

usb_reg_reset_read_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/usb_reg_reset_read_test_$(SEED)
	rm -rf usb_reg_reset_read_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/usb_reg_reset_read_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=usb_reg_reset_read_test -l $(LOG_DIR)/usb_reg_reset_read_test_$(SEED)/usb_reg_reset_read_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/usb_reg_reset_read_test_$(SEED)/usb_reg_reset_read_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

########################################################  usb_reg_write_read_test  ########################################################

usb_reg_write_read_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/usb_reg_write_read_test_$(SEED)
	rm -rf usb_reg_write_read_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/usb_reg_write_read_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=usb_reg_write_read_test -l $(LOG_DIR)/usb_reg_write_read_test_$(SEED)/usb_reg_write_read_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/usb_reg_write_read_test_$(SEED)/usb_reg_write_read_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

###################################################  usb_reg_reset_read_reg_model_test  ###################################################

usb_reg_reset_read_reg_model_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/usb_reg_reset_read_reg_model_test_$(SEED)
	rm -rf usb_reg_reset_read_reg_model_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/usb_reg_reset_read_reg_model_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=usb_reg_reset_read_reg_model_test -l $(LOG_DIR)/usb_reg_reset_read_reg_model_test_$(SEED)/usb_reg_reset_read_reg_model_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/usb_reg_reset_read_reg_model_test_$(SEED)/usb_reg_reset_read_reg_model_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

###################################################  usb_reg_write_read_reg_model_test  ###################################################

usb_reg_write_read_reg_model_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/usb_reg_write_read_reg_model_test_$(SEED)
	rm -rf usb_reg_write_read_reg_model_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/usb_reg_write_read_reg_model_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=usb_reg_write_read_reg_model_test -l $(LOG_DIR)/usb_reg_write_read_reg_model_test_$(SEED)/usb_reg_write_read_reg_model_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/usb_reg_write_read_reg_model_test_$(SEED)/usb_reg_write_read_reg_model_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

############################################################  utmi_speed_neg_test  ###########################################################

utmi_speed_neg_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/utmi_speed_neg_test_$(SEED)
	rm -rf utmi_speed_neg_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/utmi_speed_neg_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=utmi_speed_neg_test -l $(LOG_DIR)/utmi_speed_neg_test_$(SEED)/utmi_speed_neg_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/utmi_speed_neg_test_$(SEED)/utmi_speed_neg_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

############################################################  utmi_fs_speed_neg_test  ###########################################################

utmi_fs_speed_neg_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/utmi_fs_speed_neg_test_$(SEED)
	rm -rf utmi_fs_speed_neg_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/utmi_fs_speed_neg_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=utmi_fs_speed_neg_test -l $(LOG_DIR)/utmi_fs_speed_neg_test_$(SEED)/utmi_fs_speed_neg_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/utmi_fs_speed_neg_test_$(SEED)/utmi_fs_speed_neg_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

############################################################  usb_hs_enum_test  ###########################################################

usb_hs_enum_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/usb_hs_enum_test_$(SEED)
	rm -rf usb_hs_enum_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/usb_hs_enum_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=usb_hs_enum_test -l $(LOG_DIR)/usb_hs_enum_test_$(SEED)/usb_hs_enum_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/usb_hs_enum_test_$(SEED)/usb_hs_enum_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

############################################################  usb_hs_enum_out_test  ###########################################################

usb_hs_enum_out_test :
	vlog -sv +acc +fcover +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)
	rm -rf $(LOG_DIR)/usb_hs_enum_out_test_$(SEED)
	rm -rf usb_hs_enum_out_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/usb_hs_enum_out_test_$(SEED)
	vsim -c -vopt -sv_seed $(SEED) -voptargs=+acc=npr -assertdebug +UVM_VERBOSITY=$(uvm_verbosity) +UVM_TESTNAME=usb_hs_enum_out_test -l $(LOG_DIR)/usb_hs_enum_out_test_$(SEED)/usb_hs_enum_out_test_$(SEED).log -sva -coverage -do "coverage save -onexit $(LOG_DIR)/usb_hs_enum_out_test_$(SEED)/usb_hs_enum_out_test_$(SEED).ucdb; add log sim:/top/dut/*; do $(SIM_DIR)/wave.do;run -all; exit" work.top

###########################################################################################################################################
