module bai3_a (A, B, C, D, F1);
input A, B, C, D;
output F1;
wire N1, N2, N3, N4;
assign N1 = A & (~C);
assign N2 = B & (~C) & D;
assign N3 = A & (~B) & C;
assign N4 = A & C & D;
assign F1 = N1 | N2 | N3 | N4;
endmodule

module bai3_b (A, B, C, D, F2);
input A, B, C, D;
output F2;
wire N1, N2, N3;
assign N1 = (~A) & (~B);
assign N2 = A & C & D;
assign N3 = A & (~C);
assign F2 = B | N1 | N2 | N3;
endmodule

module bai3_c (A, B, C, D, F3);
input A, B, C, D;
output F3;
wire N1, N2, N3, N4;
assign N1 = (~A) & B & (~D);
assign N2 = A & B & (~C);
assign N3 = A & (~B) & D;
assign N4 = A & (~C) & D;
assign F3 = B | N1 | N2 | N3 | N4;
endmodule