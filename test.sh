#!/bin/bash
set -x
rm output.txt

iverilog -o cordic.bin cordic.v cordic_tb.v

vvp cordic.bin > output.txt

gnuplot -p -e "plot \"output.txt\" using 1:2 title \"cosine\", \"output.txt\" using 1:3 title \"sine\""

