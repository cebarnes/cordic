//CORDIC Testbench for sine and cosine for Final Project 
`timescale 1ns/1ps
//Claire Barnes

module CORDIC_TESTBENCH;

  localparam width = 16; //width of x and y

  // Inputs
  reg [width-1:0] Xin, Yin;
  reg [31:0] angle;
  wire [31:0] angleout;
  reg clk;
  reg signed [63:0] i;
  reg nreset;
  
  integer counter;

  wire signed [width-1:0] COSout, SINout;

  localparam An = 32000/1.648;

  initial begin

    //set initial values
    angle = 'b0;
    Xin = An;     // Xout = 32000*cos(angle)
    Yin = 0;      // Yout = 32000*sin(angle)
    
    counter = 0;
    nreset = 0;
   
    #50
    nreset = 1;
    
    //set clock
    clk = 'b0;
    forever
    begin
      #5 clk = !clk;
    end
  end

  CORDIC TEST_RUN(nreset, clk, COSout, SINout, Xin, Yin, angle, angleout);

// Monitor the output
always @(posedge clk) begin
        
  $monitor(counter, , COSout, , SINout, , angle, , angleout);

  counter++;
  angle = angle + 'b00000100_00000000_00000000_00000000;
  if (counter == 100) $finish;

end

endmodule


