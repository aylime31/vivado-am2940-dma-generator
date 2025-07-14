module data_mux (
    input wire [1:0] seld,
    input wire [3:0] add_cnt_in,      
    input wire [3:0] word_cnt_in,     
    input wire [2:0] ctrl_reg_in,
    output reg [3:0] data_out
);

    always @(*) begin
        case (seld)
            2'b00:  data_out = add_cnt_in;
            2'b01:  data_out = word_cnt_in;
            2'b10:  data_out = {1'b0, ctrl_reg_in};
            2'b11:  data_out = {1'b0, ctrl_reg_in};
            default: data_out = 4'hX;
        endcase
    end

endmodule