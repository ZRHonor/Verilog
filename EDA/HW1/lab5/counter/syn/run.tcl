set_attribute command_log command_list.txt
set_attribute lib_search_path ../lib
set_attribute hdl_search_path {..}

set clockperiod 2500
set_attribute library {fsa0a_c_sc_bc.lib fsa0a_c_io_bc.lib}
read_hdl -v2001 ../rtl/counter.v
elaborate

define_clock -name clk1 -period $clockperiod {clk} 
external_delay -input [expr 0.3*$clockperiod] -clock clk1  {rst}   
external_delay -input [expr 0.3*$clockperiod] -clock clk1  {ctrl}   
external_delay -output [expr 0.2*$clockperiod] -clock clk1  {qout*}

synthesize -to_mapped
write -mapped > counter.vs
write_sdf > counter.sdf
report area > report_area.log
report gates > report_gates.log
report timing > report_timing.log
report power > report_power.log
