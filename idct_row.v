module idct_row (
    input clk,
	 input [127:0] dct_coeffs,
	 output reg [127:0] intermediate_results
);
    reg [31:0] sum;
	 integer i;
	 
	 wire [15:0] cos_value;
	 reg [2:0] index;
	 
	 cosine_lut lut (.index(index), .cos_value(cos_value));
	 
	 always @(posedge clk) begin
	    for (i = 0; i< 8; i= i + 1) begin
		     sum = 0;
			  index = i;
			  sum = dct_coeffs[i * 16 +:16] *cos_value;
			  intermediate_results[i * 16 +: 16] <= sum >>> 10;
		end
	end
endmodule