/* A simple NOR gate
File: nor_gate.v */
module norgate (a, b, c, y);
input a, b, c;
output y;
assign y = ~(a | b | c);
endmodule