ncvlog -64 -LOGFILE log.txt -errormax 1000 -update fsa0a_c_sc.lib.v
ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update ../syn/ALU.vs
ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update ../frontsim/testALU.v
ncsdfc -64 ../syn/ALU.sdf
ncelab -64 -timescale 1ns/10ps -access +wcr testALU -update
ncsim -64 -GUI testALU
