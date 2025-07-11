
module done_gen(
    input wire [3:0] addr_count_val,
    input wire [3:0] word_count_val,
    input wire [3:0] word_reg_val,
    input wire wci,
    input wire [1:0] mode, 
    output reg done
);

always @(*) begin
    casex ({mode, wci})
        3'b00_0: done = (word_count_val == 4'h1);
        3'b00_1: done = (word_count_val == 4'h0);
        3'b01_x: done = (word_count_val == word_reg_val);
        3'b10_x: done = (addr_count_val == word_count_val);
        3'b11_x: done = 1'b0;
        default: done = 1'b0; 
     endcase
end

endmodule