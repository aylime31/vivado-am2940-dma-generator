`timescale 1ns / 1ps

module register_tb();
    
    reg [3:0] di_tb;
    reg       clk_tb;
    reg       plar_tb;
    wire [3:0] do_tb;
   
    register DUT (
        .di(di_tb),
        .clk(clk_tb),
        .plar(plar_tb),
        .do(do_tb)
    );
    
    initial begin
        clk_tb = 1'b0;
        forever #5 clk_tb = ~clk_tb;
    end
    
    initial begin
        plar_tb = 1'b1;
        di_tb   = 4'b1010;
        #10;

        plar_tb = 1'b0;
        di_tb   = 4'b1111;
        #10;

        #10;

        plar_tb = 1'b1;
        di_tb   = 4'b0101;
        #10;
        
        plar_tb = 1'b0;
        di_tb   = 4'b0000;
        #10;

        #50;
        $finish;
    end
    
endmodule