
module counter_tb;
    reg  clk_tb;
    reg  res_tb;
    reg  load_tb;
    reg  enable_tb;
    reg  up_tb;
    reg  [3:0] data_in_tb;
    wire [3:0] count_out_tb;
    wire carry_out_tb;

    counter DUT (
        .clk(clk_tb), 
        .res(res_tb), 
        .load(load_tb), 
        .enable(enable_tb),
        .up(up_tb), 
        .data_in(data_in_tb), 
        .count_out(count_out_tb), 
        .carry_out(carry_out_tb)
    );

    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end

    initial begin
    
        
        res_tb = 1'b0; #10;

        load_tb = 1'b1; 
        data_in_tb = 4'b1010; #10;
        load_tb = 1'b0; #10;

        enable_tb = 1'b1; 
        up_tb = 1'b1;
        repeat(3) #10;

        up_tb = 1'b0;
        repeat(5) #10;

        enable_tb = 1'b0;
        data_in_tb = 4'b1111;
        #20;

        load_tb = 1'b1; 
        data_in_tb = 4'b1101; #10;
        load_tb = 1'b0; 
        enable_tb = 1'b1; 
        up_tb = 1'b1;
        #10;
        #10;
        #10;
        
        #50;
        $finish;
    end
endmodule