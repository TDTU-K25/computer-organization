/* A simple OR gate
File: or_gate.v */
module orgate (a, b, c, y);
input a, b, c;
output y;
assign y = (a) | (b) | (c);
endmodule