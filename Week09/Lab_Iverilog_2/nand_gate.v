/* A simple NAND gate
File: nand_gate.v */
module nandgate (a, b, c, y);
input a, b, c;
output y;
assign y = ~(a & b & c);
endmodule