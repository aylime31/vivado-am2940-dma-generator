`timescale 1ns / 1ps

module done_gen_tb;

    reg [3:0] word_count_val_tb;
    reg [3:0] word_reg_val_tb;
    reg [3:0] addr_count_val_tb;
    reg       wci_tb;
    reg [1:0] mode_tb;
    wire      done_tb;

    done_gen DUT (
        .word_count_val(word_count_val_tb),
        .word_reg_val(word_reg_val_tb),
        .addr_count_val(addr_count_val_tb),
        .wci(wci_tb),
        .mode(mode_tb),
        .done(done_tb)
    );

    initial begin
        mode_tb = 2'b00;
        wci_tb = 1'b0; 
        word_count_val_tb = 4'h2; #10;
        word_count_val_tb = 4'h1; #10;
        wci_tb = 1'b1; 
        word_count_val_tb = 4'h1; #10;
        word_count_val_tb = 4'h0; #10;

        mode_tb = 2'b01;
        word_reg_val_tb = 4'hA;
        word_count_val_tb = 4'h9; #10;
        word_count_val_tb = 4'hA; #10;

        mode_tb = 2'b10;
        word_count_val_tb = 4'hC;
        addr_count_val_tb = 4'hB; #10;
        addr_count_val_tb = 4'hC; #10;

        mode_tb = 2'b11;
        #10;

        #20;
        $finish;
    end

endmodule