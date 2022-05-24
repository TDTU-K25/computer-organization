/* A simple XOR gate
File: xor_gate.v */
module xorgate (a, b, c, y);
input a, b, c;
output y;
assign y = (a ^ b ^ c);
endmodule