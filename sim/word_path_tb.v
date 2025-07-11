module word_path_tb;
    reg clk_tb, res_tb, plwr_tb, selw_tb, plwc_tb, enw_tb, incw_tb, wci_tb;
    reg [3:0] bus_data_in_tb;
    wire [3:0] word_count_out_tb, word_reg_out_tb;
    wire wco_tb;

    word_path DUT (
        .clk(clk_tb), .res(res_tb), .plwr(plwr_tb), .selw(selw_tb),
        .plwc(plwc_tb), .enw(enw_tb), .incw(incw_tb), .wci(wci_tb),
        .bus_data_in(bus_data_in_tb), .word_count_out(word_count_out_tb),
        .word_reg_out(word_reg_out_tb), .wco(wco_tb)
    );

    initial begin 
        clk_tb = 0; 
        forever #5 clk_tb = ~clk_tb; 
    end

    initial begin
        res_tb = 1'b1;
        {plwr_tb, selw_tb, plwc_tb, enw_tb, incw_tb, wci_tb} = 6'b0;
        bus_data_in_tb = 4'hX;
        #10;
        res_tb = 1'b0;
        #10;
        
        plwr_tb = 1'b1; 
        plwc_tb = 1'b1; 
        selw_tb = 1'b0;
        bus_data_in_tb = 4'h6;
        #10;
        plwr_tb = 1'b0; 
        plwc_tb = 1'b0;
        bus_data_in_tb = 4'h0;
        #10;

        enw_tb = 1'b1;
        incw_tb = 1'b0;
        wci_tb = 1'b1;
        
        repeat(8) #10;
        
        #50;
        $finish;
    end
endmodule