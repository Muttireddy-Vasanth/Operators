// Author: Vasanth, 2022
// Testbench for SHIFT and CONCATENATION operators
module shift_concat_tb();
  reg [3:0] a, b;
  wire [3:0] yl_lsh, ya_lsh, yl_rsh, ya_rsh;
  wire [7:0] y_con, y_rep;

  integer m, n;

  shift_concat DUT(a, b, yl_lsh, ya_lsh, yl_rsh, ya_rsh, y_con, y_rep);

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

  // Generate stimulus using nested loops
  initial begin
    initialise;
    for (m = 10; m < 16; m = m + 1) begin
      for (n = 9; n < 13; n = n + 1) begin
        stimulus(m, n);
      end
    end
  end

  // Monitor inputs and outputs
  initial begin
    $monitor("input a=%b b=%b \n logical left shift on a by 2 bits = %b, arithmetic left shift on a by 2 bits = %b,\n logical right shift on b by 2 bits = %b, arithmetic right shift on b by 2 bits = %b,\n concatenation {b,a} = %b \n replication 2{a} = %b",
             a, b, yl_lsh, ya_lsh, yl_rsh, ya_rsh, y_con, y_rep);
  end

  // End simulation after 3000 time units
  initial #3000 $finish;

endmodule
