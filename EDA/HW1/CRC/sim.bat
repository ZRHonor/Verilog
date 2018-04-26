ncvlog -64 -LOGFILE log.txt -errormax 1000 -update CRC16v2.v
ncvlog -64 -LOGFILE log.txt -append_log -errormax 1000 -update tb_CRC16v2.v
ncelab -64 -timescale 1ns/10ps -logfile ncelab.log -errormax 1000 -update	-access +wc -neverwarn -status worklib.tb_CRC16v2
ncsim -64 -GUI tb_CRC16v2
