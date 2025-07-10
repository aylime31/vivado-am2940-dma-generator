`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2025 04:33:00 PM
// Design Name: 
// Module Name: register_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_tb(
    );
    
   reg [3:0] di_tb;
   reg clk_tb;
   reg plwr_tb;
   wire [3:0] do_tb;
   
   register registeri(
        .di(di_tb),
        .clk(clk_tb),
        .plwr(plwr_tb),
        .do(do_tb)
    );
    
    initial begin 
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb;
    end
    
    initial begin
        plwr_tb = 1'b1;
        di_tb = 4'b1010;
        #10;
        
        plwr_tb = 1'b0;
        di_tb = 4'b1111;
        #10;
        
        plwr_tb = 1'b1;
        di_tb = 4'b0101;
        #10;
        
        plwr_tb = 1'b0;
        di_tb = 4'b0000;
        #10;
        
        #100;
        $finish;
    end
    
endmodule
