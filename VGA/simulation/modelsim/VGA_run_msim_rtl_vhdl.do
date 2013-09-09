transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/GitHub/School/VGA/db {D:/GitHub/School/VGA/db/clkdiv_altpll.v}
vcom -93 -work work {D:/GitHub/School/VGA/VGA/de0_vga_sync_generator.vhd}
vcom -93 -work work {D:/GitHub/School/VGA/clkdiv.vhd}

vcom -93 -work work {D:/GitHub/School/VGA/VGA/de0_vga_sync_generator_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  de0_vga_sync_generator_tb

add wave *
view structure
view signals
run -all