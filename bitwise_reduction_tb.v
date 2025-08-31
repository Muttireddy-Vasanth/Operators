// Author: Vasanth, 2022
// Testbench for bitwise operators
module bitwise_reduction_tb();
  reg [3:0] a, b;
  wire [3:0] ya, yo, yx, yc, yxn;
  wire yrx, yra, yro;

  integer m, n;

  bitwise DUT(a, b, ya, yo, yx, yc, yxn, yrx, yra, yro);

  // Task to initialize variables
  task initialise;
    begin
      {a, b} = 8'b0;
    end
  endtask

  // Task to provide stimulus inputs
  task stimulus(input [3:0] i, input [3:0] j);
    begin
      a = i;
      b = j;
      #10;
    end
  endtask

  // Generate stimulus using loops
  initial begin
    initialise;
    for (m = 11; m < 16; m = m + 1) begin
      for (n = 1; n < 6; n = n + 1) begin
        stimulus(m, n);
      end
    end
  end

  // Monitor inputs and outputs
  initial begin
    $monitor("input a=%b b=%b \n bitwise output and=%b, or=%b, xor=%b, b complement=%b, xnor=%b \n reduction on b xnor=%b, nand=%b, nor=%b",
             a, b, ya, yo, yx, yc, yxn, yrx, yra, yro);
  end

  // End simulation after 3000 time units
  initial #3000 $finish;

endmodule
