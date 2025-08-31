// Author: Vasanth, 2022
// Testbench for RELATIONAL, EQUALITY, CONDITIONAL operators
module re_eq_cond_tb();
  reg [3:0] a, b;
  wire y_l, y_g, y_le, y_ge, y_eq, y_N_eq, y_ceq, y_cneq, y_con;

  integer m, n;

  re_eq_cond DUT(a, b, y_l, y_g, y_le, y_ge, y_eq, y_N_eq, y_ceq, y_cneq, y_con);

  // Task to initialize inputs
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
    for (m = 10; m < 16; m = m + 1) begin
      for (n = 9; n < 14; n = n + 1) begin
        stimulus(m, n);
      end
    end
  end

  // Monitor inputs and outputs
  initial begin
    $monitor("input a=%b b=%b output a relation to b is less than %b, greater than %b, less than equal %b, greater than equal %b, \n equal =%b, negation equal =%b, case equality =%b, case inequality =%b, |b condition %b",
             a, b, y_l, y_g, y_le, y_ge, y_eq, y_N_eq, y_ceq, y_cneq, y_con);
  end

  // End simulation after 2000 time units
  initial #2000 $finish;

endmodule
