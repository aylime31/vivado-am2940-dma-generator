module counter(
    input wire clk,
    input wire res,
    input wire load,
    input wire enable,
    input wire up,
    input wire carry_in,
    input wire [3:0] data_in,
    output reg [3:0] count_out,
    output wire carry_out
    );
    
    always @(posedge clk or posedge res)
        begin
            if (res) begin
                count_out <= 4'b0000;
            end else if (load) begin
                count_out <= data_in;
            end else if (enable) begin
                if (up) begin
                    count_out <= count_out + 1;
                end else begin
                    count_out <= count_out - 1;
                end
            end 
         end 
         
         assign carry_out = (enable && up && (count_out == 4'b1111)) || (enable && !up && (count_out == 4'b0000));
         
        
   
endmodule
    
    