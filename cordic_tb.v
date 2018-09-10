//CORDIC Testbench for sine and cosine for Final Project 

//Claire Barnes

module CORDIC_TESTBENCH;

  localparam width = 16; //width of x and y

  // Inputs
  reg [width-1:0] Xin, Yin;
  reg [31:0] angle;
  reg clk;
  reg signed [63:0] i;
  reg nreset;
  
  integer counter;

  wire [width-1:0] COSout, SINout;

  localparam An = 32000/1.647;

  initial begin

    //set initial values
    angle = 'b00110101010101010101010101010101;
    Xin = An;     // Xout = 32000*cos(angle)
    Yin = 0;      // Yout = 32000*sin(angle)
    
    counter = 0;
    nreset = 0;
   

    #50
    nreset = 1;
    // Test 1
    //#1000                                           
    //angle = 'b00100000000000000000000000000000;    // example: 45 deg = 45/360 * 2^32 = 32'b00100000000000000000000000000000 = 45.000 degrees -> atan(2^0)

    // Test 2
    // #1500
    // angle = 'b00101010101010101010101010101010; // 60 deg

    // Test 3
    // #10000
    angle = 'b00000000000000000000000000000000; // 0 deg

    // Test 4
    // #10000
    // angle = 'b00110101010101010101010101010101; // 75 deg
    
     //set clock
    clk = 'b0;
    forever
    begin
      #5 clk = !clk;
    end

   #1000
   $write("Simulation has finished");
   $stop;

  end

  CORDIC TEST_RUN(nreset, clk, COSout, SINout, Xin, Yin, angle);

// Monitor the output
always @(posedge clk) begin
  $monitor(counter, , COSout, , SINout, , angle);

  counter++;
  angle = angle + 'b0000000_01000000_00000000_00000000;
  if (counter == 1000) $finish;

end

endmodule


