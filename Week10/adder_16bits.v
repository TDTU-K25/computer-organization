module Adder_16 (  input [15:0] a,
                  input [15:0] b,
                  input c_in,
                  output reg c_out,
                  output reg [15:0] sum);

	always @ (a or b or c_in) begin
  	{c_out, sum} = a + b + c_in; 		
  end
endmodule