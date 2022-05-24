/* testbench for OR gate
File: or_gate_tb.v */
`include "or_gate.v"
module orgate_tb;
wire t_y;
reg t_a, t_b, t_c;
orgate my_gate( .a(t_a), .b(t_b), .c(t_c),
.y(t_y) );
initial
begin
$monitor(t_a, t_b, t_c, t_y);
t_a = 1'b0;
t_b = 1'b0;
t_c = 1'b0;
#5
t_a = 1'b0;
t_b = 1'b0;
t_c = 1'b1;
#5
t_a = 1'b0;
t_b = 1'b1;
t_c = 1'b0;
#5
t_a = 1'b0;
t_b = 1'b1;
t_c = 1'b1;
#5
t_a = 1'b1;
t_b = 1'b0;
t_c = 1'b0;
#5
t_a = 1'b1;
t_b = 1'b0;
t_c = 1'b1;
#5
t_a = 1'b1;
t_b = 1'b1;
t_c = 1'b0;
#5
t_a = 1'b1;
t_b = 1'b1;
t_c = 1'b1;
end
endmodule