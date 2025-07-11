module word_path (
    input wire clk,
    input wire res,
    input wire plwr,
    input wire selw,
    input wire plwc,
    input wire enw,
    input wire incw,
    input wire wci,
    input wire [3:0] bus_data_in,
    output wire [3:0] word_count_out,
    output wire [3:0] word_reg_out,
    output wire wco
);

    wire [3:0] word_mux_out;

    register word_reg_inst (
        .clk(clk),
        .plar(plwr),
        .di(bus_data_in),
        .do(word_reg_out)
    );

    mux_2_to_1_4bit word_mux_inst (
        .sel(selw),
        .d0(bus_data_in),
        .d1(word_reg_out),
        .y(word_mux_out)
    );

    counter word_counter_inst (
        .clk(clk),
        .res(res),
        .load(plwc),
        .enable(enw),
        .up(incw),
        .carry_in(wci),
        .data_in(word_mux_out),
        .count_out(word_count_out),
        .carry_out(wco)
    );

endmodule
