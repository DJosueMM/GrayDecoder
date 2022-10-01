`timescale 1ns / 1ps

module bin_to_7segmentos_SubModulo( input logic clk,
                                    input logic  [3:0] in,
                                    output logic Digito_decena,
                                    output logic Digito_unidad,
                                    output logic Digito_centena,
                                    output logic Digito_milesima,
                                    output logic [6:0] cSeg7);
                                    
    assign Digito_centena = 1;
    assign Digito_milesima = 1;
    
    wire unidadImprimir;
    wire decenaImprimir;
    wire decena;
    wire t_muestreo;
    
    muestreoDisplay_timer(.clk(clk),.t_1k(t_muestreo));
    Bin_to_7seg_U(.in(in), .clk(clk),.cSegU_out(unidadImprimir));
    Bin_to_7seg_D(.in(in), .clk(clk),.cSegD_out(decenaImprimir));
    Control_displays(.in(in),.clk(clk),.d_timer(t_muestreo), .En_unidad(Digito_unidad), .En_decena(decena));
    Pintar_Display(.En_decena(decena), .cSegU(unidadImprimir),.cSegD(decenaImprimir), .cSeg(cSeg7));
    

endmodule
