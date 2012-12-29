onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /serial/A
add wave -noupdate -radix unsigned /serial/B
add wave -noupdate /serial/start
add wave -noupdate /serial/resetn
add wave -noupdate /serial/clock
add wave -noupdate -radix unsigned /serial/sum
add wave -noupdate /serial/my_control/current_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2502 ps}
