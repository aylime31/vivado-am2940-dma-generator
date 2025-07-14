`timescale 1ns / 1ps

module am2940_tb;

    reg        clk_tb;
    reg        res_tb;
    reg [2:0]  I_tb;
    reg        nOEA_tb;
    reg        ACI_tb;
    reg        WCI_tb;
    reg [3:0]  D_IN_tb;

    wire [3:0] A_tb;
    wire [3:0] D_OUT_tb;
    wire       OEDATA_LED_tb;
    wire       DONE_tb;
    wire       ACO_tb;
    wire       WCO_tb;

    am2940_top DUT (
        .TRANS(clk_tb),
        .res(res_tb),
        .I(I_tb),
        .nOEA(nOEA_tb),
        .ACI(ACI_tb),
        .WCI(WCI_tb),
        .D_IN(D_IN_tb),
        .A(A_tb),
        .D_OUT(D_OUT_tb),
        .OEDATA_LED(OEDATA_LED_tb),
        .DONE(DONE_tb),
        .ACO(ACO_tb),
        .WCO(WCO_tb)
    );

    initial begin
        clk_tb = 1'b0;
        forever #5 clk_tb = ~clk_tb;
    end

    initial begin
        res_tb = 1'b1;
        I_tb = 3'bxxx;
        nOEA_tb = 1'b1;
        ACI_tb = 1'b1;
        WCI_tb = 1'b1;
        D_IN_tb = 4'hX;
        #10;
        res_tb = 1'b0;
        nOEA_tb = 1'b0;
        #10;

        I_tb = 3'b000;
        D_IN_tb = 4'b000;
        #10;
        
        I_tb = 3'b101;
        D_IN_tb = 4'h5;
        #10;

        I_tb = 3'b110;
        D_IN_tb = 4'h3;
        #10;

        I_tb = 3'b111;
        ACI_tb = 1'b1;
        WCI_tb = 1'b1;
        D_IN_tb = 4'h0;
        
        repeat(5) #10;
        
        #50;
        $finish;
    end

endmodule