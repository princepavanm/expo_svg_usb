###################################################################################################
##      Company:  Expolog Technologies.                                                          ##
##           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               ##
##                                                                                               ##
##      Engineer          :                                                                      ##
##      Revision tag      :                                                                      ##
##      Module Name       :                                                                      ##
##      Project Name      :                                                                      ##
##      component name    :                                                                      ##
##      Description       : This module provides a test to generate clocks                       ##
##                                                                                               ##
##                                                                                               ##
##      Additional Comments:                                                                     ##
##                                                                                               ##
###################################################################################################

TEST_NAME=usb_base_test
MODULE_PATH=../../../USB_3.1

SEED=10
DUMP_OPTS=DUMP_ON

DUT_DIR=$(MODULE_PATH)/project_area/design/rtl

TB_DIR=$(MODULE_PATH)/project_area/verif/tb
AGENT_DIR=$(MODULE_PATH)/project_area/verif/agents
SEQ_DIR=$(MODULE_PATH)/project_area/verif/seqs
TEST_DIR=$(MODULE_PATH)/project_area/verif/tests
REG_DIR=$(MODULE_PATH)/project_area/verif/reg

TOP_FILE=$(TB_DIR)/top.sv

LOG_DIR=$(MODULE_PATH)/scratch_area/log
SIM_DIR=$(MODULE_PATH)/scratch_area/sim

INC_DIR=+incdir+$(DUT_DIR) +incdir+$(AGENT_DIR) +incdir+$(AGENT_DIR)/usb_reset_agent +incdir+$(AGENT_DIR)/buff_mst_agent +incdir+$(AGENT_DIR)/phy_rx_agent +incdir+$(AGENT_DIR)/buff_slv_agent +incdir+$(AGENT_DIR)/phy_tx_agent +incdir+$(TEST_DIR) +incdir+$(SEQ_DIR) +incdir+$(TB_DIR) +incdir+$(LOG_DIR) +incdir+$(SIM_DIR)

comp:
	vlog -coveropt 3 +cover -L $(QUESTA_HOME)/uvm-1.2 +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE)

vsim:
	rm -rf $(LOG_DIR)/$(TEST_NAME)_$(SEED)
	rm -rf $(TEST_NAME)_$(SEED).ucdb
	mkdir $(LOG_DIR)/$(TEST_NAME)_$(SEED)
	vsim -c -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -suppress 10016 -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=$(TEST_NAME) -l $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).ucdb;run -all; exit" work.top

run:	comp vsim

