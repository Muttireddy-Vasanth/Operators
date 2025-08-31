// Author: Vasanth, 2022
// Testbench for arithmetic operators
module arithmetic_tb();
  // Testbench global variables
  reg [3:0] a, b;
  wire [7:0] ym;
  wire [3:0] ya, ys, yd, ymod;

  // Integer variables for loop iteration
  integer m, n;

  // Instantiate arithmetic module
  arithmetic DUT(a, b, ym, ya, ys, yd, ymod);

  // Task to initialize variables
  task initialise;
    begin
      {a, b} = 8'b0;
    end
  endtask

  // Task to give input values
  task stimulus(input [3:0] i, input [3:0] j);
    begin
      a = i;
      b = j;
      #10;
    end
  endtask

  // Process to generate stimulus by calling tasks with values
  initial begin
    initialise;
    for (m = 10; m < 16; m = m + 1) begin
      for (n = 0; n < 6; n = n + 1) begin
        stimulus(m, n);
      end
    end
  end

  // Process to monitor changes in variables
  initial begin
    $monitor("input a=%b b=%b \n output ym=%b, ya=%b, ys=%b, yd=%b, ymod=%b", a, b, ym, ya, ys, yd, ymod);
  end

  // Process to terminate simulation after 3000 time units
  initial #3000 $finish;

endmodule
