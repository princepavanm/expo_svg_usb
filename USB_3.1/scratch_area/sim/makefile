###################################################################################################
##      Company:  Expolog Technologies.                                                          ##
##           Copyright (c) 2023 by Expolog Technologies, Inc. All rights reserved.               ##
##                                                                                               ##
##      Engineer          :  ANGAPPAN, MOHAMMED_KHADEER, LOKESH, MADHURA.                        ##
##      Revision Tag      :  06/10/2023                                                          ##
##      Module Name       :  makefile                                                            ##
##      Project Name      :  USB 3.1                                                             ##
##      Component Name    :  Makefile                                                            ##
##      Description       :  This file includes complilation and simulation cmd                  ##
##                           to run the testcase and regression.                                 ##
##                                                                                               ##
##      Additional Comments:                                                                     ##
##                                                                                               ##
###################################################################################################

TEST_NAME=usb_base_test
TEST_NAME2=mid_reset_test
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
	vsim -c -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -suppress 10016 -suppress 2685 -suppress 2718 -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=$(TEST_NAME) -l $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).ucdb;run -all; exit" work.top

vsim_QS:
	rm -rf $(LOG_DIR)/$(TEST_NAME)_$(SEED)
	rm -rf $(TEST_NAME)_$(SEED).ucdb
	mkdir $(LOG_DIR)/$(TEST_NAME)_$(SEED)
	vsim -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=$(TEST_NAME) -l $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/$(TEST_NAME)_$(SEED)/$(TEST_NAME)_$(SEED).ucdb;do $(SIM_DIR)/wave.do;do $(SIM_DIR)/wave_token.do;run -all;" work.top

run:	comp vsim

#for opening questasim use this
run_qs:	comp vsim_QS

###################################################################### individual test cases #######################################################################

reset_test: 
	vlog -coveropt 3 +cover -L $(QUESTA_HOME)/uvm-1.2 +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE) +define+RESET_SEQ +define+ASSERTION_ON
	rm -rf $(LOG_DIR)/usb_base_test_$(SEED)
	rm -rf usb_base_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/usb_base_test_$(SEED)
	vsim -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=usb_base_test -l $(LOG_DIR)/usb_base_test_$(SEED)/usb_base_test_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/usb_base_test_$(SEED)/usb_base_test_$(SEED).ucdb;do $(SIM_DIR)/wave.do;do $(SIM_DIR)/assertion.do;run -all;" work.top

mid_reset_test: 
	vlog -coveropt 3 +cover -L $(QUESTA_HOME)/uvm-1.2 +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE) +define+MID_RESET_SEQ
	rm -rf $(LOG_DIR)/mid_reset_test_$(SEED)
	rm -rf mid_reset_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/mid_reset_test_$(SEED)
	vsim -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=mid_reset_test -l $(LOG_DIR)/mid_reset_test_$(SEED)/mid_reset_test_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/mid_reset_test_$(SEED)/mid_reset_test_$(SEED).ucdb;do $(SIM_DIR)/wave.do;run -all;" work.top

speed_neg_hs_test: 
	vlog -coveropt 3 +cover -L $(QUESTA_HOME)/uvm-1.2 +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE) +define+SPEED_NEG_HS_SEQ
	rm -rf $(LOG_DIR)/speed_neg_hs_test_$(SEED)
	rm -rf speed_neg_hs_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/speed_neg_hs_test_$(SEED)
	vsim -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=speed_neg_hs_test -l $(LOG_DIR)/speed_neg_hs_test_$(SEED)/speed_neg_hs_test_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/speed_neg_hs_test_$(SEED)/speed_neg_hs_test_$(SEED).ucdb;do $(SIM_DIR)/wave.do;do $(SIM_DIR)/assertion.do;run -all;" work.top


debug_sof_test:
	vlog -coveropt 3 +cover -L $(QUESTA_HOME)/uvm-1.2 +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE) +define+DEBUG_SOF_SEQ       	
	rm -rf $(LOG_DIR)/debug_sof_test_$(SEED)
	rm -rf debug_sof_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/debug_sof_test_$(SEED)
	vsim -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=debug_sof_test -l $(LOG_DIR)/debug_sof_test_$(SEED)/debug_sof_test_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/debug_sof_test_$(SEED)/debug_sof_test_$(SEED).ucdb;do $(SIM_DIR)/wave.do;run -all;" work.top

token_in_test:
	vlog -coveropt 3 +cover -L $(QUESTA_HOME)/uvm-1.2 +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE) +define+TOKEN_IN_SEQ       	
	rm -rf $(LOG_DIR)/token_in_test_$(SEED)
	rm -rf token_in_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/token_in_test_$(SEED)
	vsim -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=token_in_test -l $(LOG_DIR)/token_in_test_$(SEED)/token_in_test_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/token_in_test_$(SEED)/token_in_test_$(SEED).ucdb;do $(SIM_DIR)/wave.do;run -all;" work.top

token_out_ep1_test:
	vlog -coveropt 3 +cover -L $(QUESTA_HOME)/uvm-1.2 +define+$(DUMP_OPTS) $(INC_DIR) $(DUT_FILE) $(TOP_FILE) +define+TOKEN_OUT_EP1_SEQ       	
	rm -rf $(LOG_DIR)/token_out_ep1_test_$(SEED)
	rm -rf token_out_ep1_test_$(SEED).ucdb
	mkdir $(LOG_DIR)/token_out_ep1_test_$(SEED)
	vsim -sv_seed $(SEED) -cvgperinstance -voptargs=+acc -coverage -voptargs="+cover=all" -assertdebug -voptargs="+ASSERTION_ON" +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=token_out_ep1_test -l $(LOG_DIR)/token_out_ep1_test_$(SEED)/token_out_ep1_test_$(SEED).log -do "coverage save -onexit $(LOG_DIR)/token_out_ep1_test_$(SEED)/token_out_ep1_test_$(SEED).ucdb;do $(SIM_DIR)/wave.do;run -all;" work.top


