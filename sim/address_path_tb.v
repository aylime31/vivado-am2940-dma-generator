`default_nettype none

module address_path_tb;

    reg clk_tb;
    reg res_tb;
    reg plar_tb;
    reg sela_tb;
    reg plac_tb;
    reg ena_tb;
    reg inca_tb;
    reg aci_tb;
    reg [3:0] bus_data_in_tb;
    
    wire [3:0] address_out_tb;
    wire aco_tb;
    
    address_path DUT (
        .clk (clk_tb),
        .res(res_tb),
        .plar(plar_tb),
        .sela(sela_tb),
        .plac(plac_tb),
        .ena(ena_tb),
        .inca(inca_tb),
        .aci(aci_tb),
        .bus_data_in(bus_data_in_tb),
        .address_out(address_out_tb),
        .aco(aco_tb)
        );
        
        initial begin
            clk_tb = 1'b0;
            forever #5 clk_tb = ~clk_tb;
        end
    
        initial begin
            clk_tb = 1'b0;
            res_tb = 1'b1;
            plar_tb = 1'b0;
            sela_tb = 1'b0;
            plac_tb = 1'b0;
            ena_tb = 1'b0;
            inca_tb = 1'b1;
            aci_tb = 1'b0;
            bus_data_in_tb = 4'bxxxx;
            #10;
            res_tb = 1'b0;
            #10;
            
            plac_tb        = 1'b1;
            sela_tb        = 1'b0;
            bus_data_in_tb = 4'b0011; 
            #10;
            plac_tb = 1'b0;
            #10;
             
            plar_tb = 1'b1;
            bus_data_in_tb = 4'b1000;
              
            #10;
            plar_tb        = 1'b0;
            bus_data_in_tb = 4'b0000;
            #10;
       
            sela_tb        = 1'b1;
            plac_tb        = 1'b1;
            #10;
            sela_tb        = 1'b0;
            plac_tb        = 1'b0;
            #10;

            ena_tb         = 1'b1;
            inca_tb        = 1'b1;
            aci_tb         = 1'b1;
            repeat(3) #10; 
            
            inca_tb        = 1'b0;
            repeat(4) #10; 
           
            aci_tb         = 1'b0;
            #20;           
            aci_tb         = 1'b1;
            #10;           
            
            #50;
            $finish;
        end
    
endmodule