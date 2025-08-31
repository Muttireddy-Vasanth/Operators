// Author: Vasanth, 2022
// RTL for ALU
module alu(
  input [7:0] a_in, b_in,
  input [3:0] co_in,
  input en,
  output [15:0] d_out
);
  // Internal variable used during ALU operation
  reg [15:0] out;

  // Parameter definitions for operations
  parameter ADD  = 4'b0000, // Add two 8-bit numbers a and b
            INC  = 4'b0001, // Increment a by 1
            SUB  = 4'b0010, // Subtract b from a
            DEC  = 4'b0011, // Decrement a by 1
            MUL  = 4'b0100, // Multiply a and b
            DIV  = 4'b0101, // Divide a by b
            SHL  = 4'b0110, // Shift a left by 1 bit
            SHR  = 4'b0111, // Shift a right by 1 bit
            AND  = 4'b1000, // Logical AND
            OR   = 4'b1001, // Logical OR
            INV  = 4'b1010, // Logical Negation
            NAND = 4'b1011, // Bitwise NAND
            NOR  = 4'b1100, // Bitwise NOR
            XOR  = 4'b1101, // Bitwise XOR
            XNOR = 4'b1110, // Bitwise XNOR
            BUF  = 4'b1111; // Buffer (pass through a_in)

  always @(*) begin
    case (co_in)
      ADD  : out = a_in + b_in;
      INC  : out = a_in + 1'b1;
      SUB  : out = a_in - b_in;
      DEC  : out = a_in - 1'b1;
      MUL  : out = a_in * b_in;
      DIV  : out = b_in != 0 ? a_in / b_in : 16'd0; // avoid divide by zero
      SHL  : out = a_in << 1;
      SHR  : out = a_in >> 1;
      INV  : out = ~a_in;
      AND  : out = a_in & b_in;
      OR   : out = a_in | b_in;
      NAND : out = ~(a_in & b_in);
      NOR  : out = ~(a_in | b_in);
      XOR  : out = a_in ^ b_in;
      XNOR : out = ~(a_in ^ b_in);
      BUF  : out = {8'd0, a_in}; // zero-extend to 16 bits
      default: out = 16'd0;
    endcase
  end

  assign d_out = (en) ? out : 16'hzzzz;

endmodule
