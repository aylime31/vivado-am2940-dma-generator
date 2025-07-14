`default_nettype none

module instruction_decoder (
    input wire [2:0] I,
    input wire [2:0] CR,

    output reg plar,
    output reg plwr,
    output reg sela,
    output reg selw,
    output reg plcr,
    output reg [1:0] seld,
    output reg plac,
    output reg ena,
    output reg inca,
    output reg deca,
    output reg resw,
    output reg plwc,
    output reg enw,
    output reg incw,
    output reg decw,
    output reg oedata
);

    always @(*) begin
        plar = 1'b0; plwr = 1'b0; sela = 1'b0; selw = 1'b0;
        plcr = 1'b0; seld = 2'bxx; plac = 1'b0; ena = 1'b0;
        inca = 1'b0; deca = 1'b0; resw = 1'b0; plwc = 1'b0;
        enw = 1'b0; incw = 1'b0; decw = 1'b0; oedata = 1'b0;

        case (I)
            3'b000: begin // WRCR
                plcr = 1'b1;
            end
            3'b001: begin // RDCR
                seld = 2'b10;
                oedata = 1'b1;
            end
            3'b010: begin // RDWC
                seld = 2'b01;
                oedata = 1'b1;
            end
            3'b011: begin // RDAC
                seld = 2'b00;
                oedata = 1'b1;
            end
            3'b100: begin // REIN
                sela = 1'b1;
                plac = 1'b1;
                if (CR == 3'bx01) begin //mod 1
                    resw = 1'b1;
                end else begin //mod 0, 2, 3
                    selw = 1'b1;
                    plwc = 1'b1;
                end
            end
            3'b101: begin // LDAD
                plar = 1'b1;
                plac = 1'b1;
            end
            3'b110: begin // LDWC
                plwr = 1'b1;
                if (CR == 3'bx01) begin // Mod 1
                    resw = 1'b1;
                end else begin // Mod 0, 2, 3
                    plwc = 1'b1;
                end
            end
            3'b111: begin // ENCT
                ena = 1'b1;
                case (CR)
                    3'b000: begin // mod 0
                        inca = 1'b1; deca = 1'b0;
                        enw = 1'b1; incw = 1'b0; decw = 1'b1;
                    end
                    3'b001: begin // mod 1
                        inca = 1'b1; deca = 1'b0;
                        enw = 1'b1; incw = 1'b1; decw = 1'b0;
                    end
                    3'b010: begin // mod 2
                        inca = 1'b1; deca = 1'b0;
                        enw = 1'b0;
                    end
                    3'b100: begin // mod 0, decrement
                        inca = 1'b0; deca = 1'b1;
                        enw = 1'b1; incw = 1'b0; decw = 1'b1;
                    end
                    3'b101: begin //mod 1, decrement
                        inca = 1'b0; deca = 1'b1;
                        enw = 1'b1; incw = 1'b1; decw = 1'b0;
                    end
                     3'b110: begin // mod 2, decrement
                        inca = 1'b0; deca = 1'b1;
                        enw = 1'b0;
                    end
                    3'b011, 3'b111: begin //mod 3
                         inca = 1'b1; deca = 1'b0; //inca/deca depinde de bitul CR[2]
                         enw = 1'b1; incw = 1'b1; decw = 1'b0;
                         if(CR[2]) begin // daca CR[2] este 1 => decrementare Adresa
                            inca = 1'b0; deca = 1'b1;
                         end
                    end
                endcase
            end
        endcase
    end

endmodule

`default_nettype wire