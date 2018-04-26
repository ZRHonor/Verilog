ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update -incdir ../rtl ../rtl/counter.v

ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update -incdir ../rtl  ./test_counter.v
ncelab -64 -timescale 1ns/10ps -logfile ncelab.log -errormax 1000 -update -access +wc -neverwarn -notimingchecks -status worklib.test_counter
ncsim -64 test_counter -gui
