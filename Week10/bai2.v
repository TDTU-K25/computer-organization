module bai2_a (A, B, C, D, F, G);
input A, B, C, D;
output F, G;
//Five internal wires needed
wire N1, N2, N3, N4, N5;
// Ports on primitive gates - output port
// is listed first
not G1 (N1,A);
and G2 (N2,B,C), G6 (F,N4,N5), G7 (G,N3,N4);
nand G3 (N3,N1,D), G5 (N5,N1,N3);
or G4 (N4,N1,N2);
endmodule

module bai2_b (x, y, F);
input x, y;
output F;
//Three internal wires needed
wire N1, N2, N3;
// Ports on primitive gates - output port
// is listed first
nor G1 (N1,x,y), G2 (N2,N1,x), G3 (N3,N1,y), G4 (F,N2,N3);
endmodule