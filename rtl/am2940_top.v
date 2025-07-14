`default_nettype none

module am2940_top (
    input wire        TRANS,
    input wire        res,
    input wire [2:0]  I,
    input wire        nOEA,
    input wire        ACI,
    input wire        WCI,
    input wire [3:0]  D_IN,
    
    output wire [3:0] A,
    output wire [3:0] D_OUT,
    output wire       OEDATA_LED,
    output wire       DONE,
    output wire       ACO,
    output wire       WCO
);

    wire plar, plwr, sela, selw, plcr, plac, ena, inca, deca;
    wire resw, plwc, enw, incw, decw, oedata_internal;
    wire [1:0] seld;
    
    wire [3:0] address_path_out;
    wire [3:0] word_path_count_out;
    wire [3:0] word_path_reg_out;
    wire [2:0] ctrl_reg_out;
    wire [3:0] data_mux_out;

    instruction_decoder decoder_inst (
        .I(I), .CR(ctrl_reg_out), .plar(plar), .plwr(plwr), .sela(sela),
        .selw(selw), .plcr(plcr), .seld(seld), .plac(plac), .ena(ena),
        .inca(inca), .deca(deca), .resw(resw), .plwc(plwc), .enw(enw),
        .incw(incw), .decw(decw), .oedata(oedata_internal)
    );

    ctrl_register ctrl_register_inst (
        .clk(TRANS), .plcr(plcr), .di(D_IN[2:0]), .do(ctrl_reg_out)
    );

    address_path addr_path_inst (
        .clk(TRANS), .res(res), .plar(plar), .sela(sela), .plac(plac),
        .ena(ena), .inca(inca), .aci(ACI), .bus_data_in(D_IN),
        .address_out(address_path_out), .aco(ACO)
    );

    word_path word_path_inst (
        .clk(TRANS), .res(resw), .plwr(plwr), .selw(selw), .plwc(plwc),
        .enw(enw), .incw(incw), .wci(WCI), .bus_data_in(D_IN),
        .word_count_out(word_path_count_out), 
        .word_reg_out(word_path_reg_out), .wco(WCO)
    );
    
    data_mux data_mux_inst (
        .seld(seld), .add_cnt_in(address_path_out),
        .word_cnt_in(word_path_count_out), .ctrl_reg_in(ctrl_reg_out),
        .data_out(data_mux_out)
    );

    done_gen done_gen_inst (
        .word_count_val(word_path_count_out), .word_reg_val(word_path_reg_out),
        .addr_count_val(address_path_out), .wci(WCI), .mode(ctrl_reg_out[1:0]),
        .done(DONE)
    );

    assign A = (nOEA == 1'b0) ? address_path_out : 4'hZ;
    assign D_OUT = (oedata_internal == 1'b1) ? data_mux_out : 4'h0;
    assign OEDATA_LED = oedata_internal;

endmodule

`default_nettype wire