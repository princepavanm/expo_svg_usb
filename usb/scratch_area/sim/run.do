vlog -sv "+acc" "+cover" "+fcover" -L /uvm-1.2 "+define+DUMP_ON" "+incdir+../../../usb/project_area/design/rtl" "+incdir+../../../usb/project_area/verif/agents" "+incdir+../../../usb/project_area/verif/agents/wb_agent" "+incdir+../../../usb/project_area/verif/agents/utmi_agent" "+incdir+../../../usb/project_area/verif/agents/sram_agent" "+incdir+../../../usb/project_area/verif/agents/reset_agent" "+incdir+../../../usb/project_area/verif/tests" "+incdir+../../../usb/project_area/verif/seqs" "+incdir+../../../usb/project_area/verif/tb" "+incdir+../../../usb/scratch_area/log" "+incdir+../../../usb/scratch_area/sim" ../../../usb/project_area/verif/tb/top.sv
vsim -vopt -sv_seed 10 -voptargs="+acc=npr" -assertdebug "+UVM_VERBOSITY=UVM_LOW" "+UVM_TESTNAME=usb_base_test" -l ../../../usb/scratch_area/log/usb_base_test_10/usb_base_test_10.log -sva -coverage -do "coverage save -onexit ../../../usb/scratch_area/log/usb_base_test_10/usb_base_test_10.ucdb;do ../../../usb/scratch_area/sim/wave.do;run -all; exit" work.top 
