ncvlog -64 -LOGFILE log.txt -errormax 1000 -update counter.v
ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update tb_counter.v
ncelab -64 -timescale 1ns/10ps -logfile ncelab.log -errormax 1000 -update	-access +wc -neverwarn -status worklib.tb_counter
ncsim -64 -GUI tb_counter
 
