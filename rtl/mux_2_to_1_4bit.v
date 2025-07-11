 module mux_2_to_1_4bit (
    input wire sel, 
    input wire [3:0] d0,
    input wire [3:0] d1,
    output wire [3:0] y
 );
 
    assign y = sel? d1 : d0;
    
endmodule