module cosine_lut (
    input [2:0] index,
    output reg [15:0] cos_value
);

    always @(*) begin
        case (index)
            3'd0: cos_value = 16'd362;
            3'd1: cos_value = 16'd502;
            3'd2: cos_value = 16'd473;
            3'd3: cos_value = 16'd426;
            3'd4: cos_value = 16'd362;
            3'd5: cos_value = 16'd284;
            3'd6: cos_value = 16'd192;
            3'd7: cos_value = 16'd98;
            default: cos_value = 16'd0;
        endcase
    end

endmodule
