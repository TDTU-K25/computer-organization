module bai1 (A, B, C, F1, F2);
input A, B, C;
output F1, F2;
//Eight internal wires needed
wire N1, N2, N3, N4, N5, N6, N7, N8;
// Ports on primitive gates - output port
// is listed first
not G7 (N7,F2);
and G1 (N1,A,B), G3 (N3,N2,C), G6 (N6,N1,C), G8 (N8,N7,N5);
or G2 (N2,A,B), G4 (F2,N1,N3), G5 (N5,N2,C), G9 (F1,N6,N8);
endmodule