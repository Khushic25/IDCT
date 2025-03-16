module idct_col (
   input clk,
	input [127:0] intermediate_results,
	output reg [63:0] pixel_values
);
	
	reg [31:0] sum;
	integer i;
	
	wire [15:0] cos_value;
	reg [2:0] index;
	
	cosine_lut lut (.index(index) , .cos_value(cos_value));
	
	always @(posedge clk) begin
	   for (i=0; i<8; i=i+1) begin
		    sum=0;
			 index=i;
			 sum= intermediate_results[i * 16 +: 16] * cos_value;
			 
			 if((sum >>> 10 ) > 255)
			   pixel_values[i* 8 +: 8] <= 8'd255;
			else if ((sum >>> 10) <0)
			   pixel_values[i * 8 +: 8] <= 8'd0;
			else
			   pixel_values[i * 8 +: 8] <= sum >>> 10;
		end
	end
endmodule