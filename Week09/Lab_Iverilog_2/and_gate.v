/* A simple AND gate
File: and_gate.v */
module andgate (a, b, c, y);
input a, b, c;
output y;
assign y = (a) & (b) & (c);
endmodule