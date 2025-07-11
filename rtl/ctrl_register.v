module ctrl_register(

    input wire [2:0] di,
    output reg [3:0] do,
    input wire clk,
    input wire plcr
);

always @(posedge clk) 
    begin 
        if (plcr) begin
            do <= di;
        end
    end
endmodule