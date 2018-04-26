set_attribute command_log command_list.txt
set_attribute lib_search_path ../lib
set_attribute hdl_search_path {..}

set clockperiod 2500
set_attribute library {fsa0a_c_sc_bc.lib fsa0a_c_io_bc.lib}
read_hdl -v2001 ../rtl/ALU.v
elaborate



synthesize -to_mapped
write -mapped > ALU.vs
write_sdf > ALU.sdf
report area > report_area.log
report gates > report_gates.log
report timing > report_timing.log
report power > report_power.log
