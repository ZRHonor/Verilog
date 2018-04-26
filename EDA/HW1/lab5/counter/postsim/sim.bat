ncvlog -64 -LOGFILE log.txt -errormax 1000 -update fsa0a_c_sc.lib.v
ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update ../syn/counter.vs
ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update ../frontsim/test_counter.v
ncsdfc -64 ../syn/counter.sdf
ncelab -64 -timescale 1ns/10ps -access +wcr test_counter -update
ncsim -64 -GUI test_counter
