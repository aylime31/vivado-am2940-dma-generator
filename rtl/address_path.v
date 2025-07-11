`default_nettype none

module address_path(
    input wire clk,
    input wire res, 
    input wire plar,
    input wire sela,
    input wire plac,
    input wire ena,
    input wire inca,
    input wire aci,
    input wire [3:0] bus_data_in,
    output wire [3:0] address_out,
    output wire aco
    );
    
    wire [3:0] address_reg_out;
    wire [3:0] address_mux_out;
    
    register addr_reg_inst (
        .clk(clk),
        .plar(plar), 
        .di(bus_data_in),
        .do(address_reg_out)
        );
    mux_2_to_1_4bit addr_mux_inst (
        .sel(sela),
        .d0(bus_data_in),
        .d1(address_reg_out),
        .y(address_mux_out)
    );
    
    counter addr_counter_inst (
        .clk(clk),
        .res(res),
        .load(plac),
        .enable(ena),
        .up(inca),
        .carry_in(aci),
        .data_in(address_mux_out),
        .count_out(address_out),
        .carry_out(aco)
    );
    
endmodule