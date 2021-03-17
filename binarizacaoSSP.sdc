create_clock -name i_CLK -period 4 [get_ports {i_CLK}]


set_false_path -from [get_ports {i_CLR_N i_GO}]
set_false_path -to [get_ports {o_READY}]