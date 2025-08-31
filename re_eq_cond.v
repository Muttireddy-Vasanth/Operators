// Author: Vasanth, 2022

// RTL for relational, equality, and conditional operators
module re_eq_cond(
  input [3:0] a, b,
  output reg y_l, y_g, y_le, y_ge, y_eq, y_N_eq, y_ceq, y_cneq, y_con
);

  always @(*) begin
    // Relational operators
    y_l  = (a < b);
    y_g  = (a > b);
    y_le = (a <= b);
    y_ge = (a >= b);

    // Logical equality
    y_eq   = (a == b);
    y_N_eq = (a != b);

    // Case equality
    y_ceq  = (a === b);
    y_cneq = (a !== b);

    // Conditional operator (check if at least one bit of b is 1)
    y_con = (|b) ? 1'b1 : 1'b0;
  end

endmodule
