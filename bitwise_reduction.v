// Author: Vasanth, 2022

// RTL for bitwise operators
module bitwise_reduction(
  input [3:0] a, b,
  output reg [3:0] ya, yo, yx, yc, yxn,
  output reg yrx, yra, yro
);
  always @(*) begin
    ya = a & b;    // Bitwise AND
    yo = a | b;    // Bitwise OR
    yx = a ^ b;    // Bitwise XOR
    yc = ~b;       // Bitwise NOT of b
    yxn = a ~^ b;  // Bitwise XNOR

    // Reduction operators
    yrx = ~^b;     // Reduction XNOR of b
    yra = ~&b;     // Reduction NAND of b
    yro = ~|b;     // Reduction NOR of b
  end
endmodule
