#!/bin/bash
set -x
rm output.txt

iverilog -o cordic.bin cordic.v cordic_tb.v

vvp cordic.bin > output.txt

gnuplot -p -e "set multiplot layout 2, 1; 
set style data linespoints;
plot \"output.txt\" using 1:2 title \"cosine\", \"output.txt\" using 1:3 title \"sine\";
plot \"output.txt\" using 1:4 lc 3 title \"angle\", \"output.txt\" using 1:5 lc 4 title \"angleout\""

