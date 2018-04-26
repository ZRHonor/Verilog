ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update -incdir ../rtl ../rtl/ALU.v

ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update -incdir ../rtl  ./testALU.v
ncelab -64 -timescale 1ns/10ps -logfile ncelab.log -errormax 1000 -update -access +wc -neverwarn -notimingchecks -status worklib.testALU
ncsim -64 testALU -gui
