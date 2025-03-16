module idct_tb;
  reg clk;
  reg enable;
  reg [15:0] dct_coeff_in;
  wire [7:0] pixel_out;
  
  idct uut (
       .clk(clk) ,
		 .enable(enable) ,
		 .dct_coeff_in(dct_coeff_in) ,
		 .pixel_out(pixel_out)
		 
	);
	
	integer i;
	
	always #5 clk = ~clk;
	
	initial begin
	   clk = 0;
		enable = 0;
		dct_coeff_in = 16'd0;
		
		#10 enable = 1;
		
		for (i = 0; i< 64; i = i + 1) begin
		    dct_coeff_in = 16'd50;
			 #10;
		end
		
		enable = 0;
		#100;
		
		$stop;
	end
endmodule