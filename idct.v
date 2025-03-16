module idct(
   input clk,
	input enable,
	input [15:0] dct_coeff_in,
	output reg [7:0] pixel_out
);
   reg [15:0] dct_coeffs [0:63];
	reg [15:0] intermediate_results [0:63];
	reg [5:0] index = 0;
	
	always @(posedge clk) begin
	  if(enable) begin
	     dct_coeffs[index] <= dct_coeff_in;
		  index <= index + 1;
		 end
	end
	
	always @(posedge clk) begin
	
	  pixel_out <= (dct_coeffs[index] >>> 8);
	end
endmodule
		  
	