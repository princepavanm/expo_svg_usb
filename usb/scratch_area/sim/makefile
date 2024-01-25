TEST_NAME=usb_base_test

# Setting the default uvm_verbosity to UVM_MEDIUM
ifndef uvm_verbosity
override uvm_verbosity = UVM_LOW
endif

MODULE_PATH=../../../usb

SEED=10
DUMP_OPTS=DUMP_ON

DUT_DIR=$(MODULE_PATH)/project_area/design/rtl
#DUT_FILE=$(DUT_DIR)/ethmac.v

TB_DIR=$(MODULE_PATH)/project_area/verif/tb
AGENT_DIR=$(MODULE_PATH)/project_area/verif/agents
SEQ_DIR=$(MODULE_PATH)/project_area/verif/seqs
TEST_DIR=$(MODULE_PATH)/project_area/verif/tests
REG_DIR=$(MODULE_PATH)/project_area/verif/reg

TOP_FILE=$(TB_DIR)/top.sv

LOG_DIR=$(MODULE_PATH)/scratch_area/log
SIM_DIR=$(MODULE_PATH)/scratch_area/sim

INC_DIR=+incdir+$(DUT_DIR) +incdir+$(AGENT_DIR) +incdir+$(AGENT_DIR)/wb_agent +incdir+$(AGENT_DIR)/utmi_agent +incdir+$(AGENT_DIR)/sram_agent +incdir+$(AGENT_DIR)/reset_agent +incdir+$(TEST_DIR) +incdir+$(SEQ_DIR) +incdir+$(TB_DIR) +incdir+$(LOG_DIR) +incdir+$(SIM_DIR)

comp:
	vlog -sv \
	+acc \
	+cover \
	+fcover \
	-L $(QUESTA_HOME)/uvm-1.2 +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)

vsim:
	rm -rf $(LOG_DIR)/$(TEST_NAME)_$(SEED)
	rm -rf $(TEST_NAME)_$(SEED).ucdb
	mkdir $(LOG_DIR)/$(TEST_NAME)_$(SEED)
	vsim -vopt \
	-sv_seed $(SEED) \
	-voptargs=+acc=npr \
	-assertdebug \
	+UVM_VERBOSITY=$(uvm_verbosity) \
	+UVM_TESTNAME=$(TEST_NAME) \
	-l $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).log \
	-sva \
	-coverage \
	-do "coverage save -onexit $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).ucdb;" \
	work.top

	#vsim -c -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_LOW +UVM_TESTNAME=$(TEST_NAME) -l $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).ucdb; run -all; exit" work.top

run:	comp vsim

