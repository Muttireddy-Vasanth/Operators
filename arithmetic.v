// Author: Vasanth, 2022

// RTL for arithmetic operators
module arithmetic(
  input [3:0] a, b,
  output reg [7:0] ym,
  output reg [3:0] ya, ys, yd, ymod
);
  always @(*) begin
    ym = a * b;    // Multiplication
    ya = a + b;    // Addition
    ys = a - b;    // Subtraction
    yd = a / b;    // Division
    ymod = a % b;  // Modulus
  end
endmodule
