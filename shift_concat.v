// Author: Vasanth, 2022
// RTL for SHIFT and CONCATENATION operators
module shift_concat(
  input signed [3:0] a, b,
  output reg [3:0] yl_lsh, ya_lsh, yl_rsh, ya_rsh,
  output reg [7:0] y_con, y_rep
);
  // <<, >> logical shift; >>>, <<< arithmetic shift
  always @(*) begin
    yl_lsh = a << 2;   // Logical left shift
    ya_lsh = a <<< 2;  // Arithmetic left shift
    yl_rsh = b >> 2;   // Logical right shift
    ya_rsh = b >>> 2;  // Arithmetic right shift

    // Concatenation
    y_con = {b, a};

    // Replication
    y_rep = {2{a}};
  end
endmodule
