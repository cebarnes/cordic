# Create library for working in
vlib work

# Compile the cordic 
vlog cordic.vO
vlog cordic_tb.v

# Load the testbench module
vsim CORDIC_TESTBENCH

# Open windows for viewing
view structure
view signals
view wave

# Add signals to wave window
add wave -noupdate clk
#add wave -noupdate Xin
#add wave -noupdate Yin