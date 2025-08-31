// Author: Vasanth, 2022
// TESTBENCH FOR ALU
module alu_tb();
  // Testbench global variables
  reg [7:0] a_in, b_in;
  reg [3:0] co_in;
  reg en;
  wire [15:0] d_out;

  // Parameter constants used for displaying command strings
  parameter ADD  = 4'b0000, // Add two 8-bit numbers a and b
            INC  = 4'b0001, // Increment a by 1
            SUB  = 4'b0010, // Subtract b from a
            DEC  = 4'b0011, // Decrement a by 1
            MUL  = 4'b0100, // Multiply a and b
            DIV  = 4'b0101, // Divide a by b
            SHL  = 4'b0110, // Shift a left by 1 bit
            SHR  = 4'b0111, // Shift a right by 1 bit
            AND  = 4'b1000, // Logical AND operation
            OR   = 4'b1001, // Logical OR operation
            INV  = 4'b1010, // Logical Negation
            NAND = 4'b1011, // Bitwise NAND
            NOR  = 4'b1100, // Bitwise NOR
            XOR  = 4'b1101, // Bitwise XOR
            XNOR = 4'b1110, // Bitwise XNOR
            BUF  = 4'b1111; // Buffer

  // Register to hold command string (4 chars * 8 bits + 1 extra bit for safety)
  reg [4*8-1:0] cmd;

  // Instantiate the design ALU
  alu DUT(a_in, b_in, co_in, en, d_out);

  // Task to initialize the inputs of DUT
  task initialise;
    begin
      {a_in, b_in, co_in, en} = 0;
    end
  endtask

  // Task to enable or disable the ALU
  task enable(input i);
    begin
      en = i;
    end
  endtask

  // Task to pass input values
  task inputs(input [7:0] j, input [7:0] k);
    begin
      a_in = j;
      b_in = k;
    end
  endtask

  // Task to set the command input
  task comd(input [3:0] l);
    begin
      co_in = l;
    end
  endtask

  // Task to delay process by 10ns
  task delay;
    begin
      #10;
    end
  endtask

  // Process to hold the string values as per the commands
  always @(co_in) begin
    case (co_in)
      ADD  : cmd = "ADD ";
      INC  : cmd = "INC ";
      SUB  : cmd = "SUB ";
      DEC  : cmd = "DEC ";
      MUL  : cmd = "MUL ";
      DIV  : cmd = "DIV ";
      SHL  : cmd = "SHL ";
      SHR  : cmd = "SHR ";
      INV  : cmd = "INV ";
      AND  : cmd = "AND ";
      OR   : cmd = "OR  ";
      NAND : cmd = "NAND";
      NOR  : cmd = "NOR ";
      XOR  : cmd = "XOR ";
      XNOR : cmd = "XNOR";
      BUF  : cmd = "BUF ";
      default: cmd = "UNK ";
    endcase
  end

  // Variables for iteration of the loops
  integer m, n, o;

  // Process used for generating stimulus by calling tasks & passing values
  initial begin
    initialise;
    enable(1'b1);
    for (m = 0; m < 16; m = m + 1) begin
      for (n = 0; n < 16; n = n + 1) begin
        inputs(m, n);
        for (o = 0; o < 16; o = o + 1) begin
          comd(o);
          delay;
        end
      end
    end
    enable(0);
    inputs(8'd21, 8'd11);
    comd(ADD);
    delay;
    enable(1);
    inputs(8'd27, 8'd18);
    comd(ADD);
    delay;
    $finish;
  end

  // Process to monitor the changes in the variables
  initial begin
    $monitor("Input en=%b, a_in=%d, b_in=%d, cmd=%s, Output d_out=%d", en, a_in, b_in, cmd, d_out);
  end

endmodule
