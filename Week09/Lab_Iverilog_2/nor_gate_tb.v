/* testbench for NOR gate
File: nor_gate_tb.v */
`include "nor_gate.v"
module norgate_tb;
wire t_y;
reg t_a, t_b, t_c;
norgate my_gate( .a(t_a), .b(t_b), .c(t_c),
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