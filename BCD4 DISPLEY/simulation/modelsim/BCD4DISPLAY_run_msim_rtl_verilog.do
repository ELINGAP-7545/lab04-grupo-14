transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/paula\ nikol/Documents/GitHub/lab04-grupo-14/BCD4\ DISPLEY {C:/Users/paula nikol/Documents/GitHub/lab04-grupo-14/BCD4 DISPLEY/BCD4DISPLAY.v}
vlog -vlog01compat -work work +incdir+C:/Users/paula\ nikol/Documents/GitHub/lab04-grupo-14/BCD4\ DISPLEY {C:/Users/paula nikol/Documents/GitHub/lab04-grupo-14/BCD4 DISPLEY/BCD.v}

vlog -vlog01compat -work work +incdir+C:/Users/paula\ nikol/Documents/GitHub/lab04-grupo-14/BCD4\ DISPLEY {C:/Users/paula nikol/Documents/GitHub/lab04-grupo-14/BCD4 DISPLEY/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
