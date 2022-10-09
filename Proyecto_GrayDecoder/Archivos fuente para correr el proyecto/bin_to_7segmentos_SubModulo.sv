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
    
    //Auxiliares para conectar puertos internos
    wire [6:0] unidadImprimir;
    wire [6:0] decenaImprimir;
    wire decena;
    wire t_muestreo;
    wire d;
    
    assign Digito_decena = decena;
    //Conexión de los subsubmodulos
    muestreoDisplay_timer com1(.clk(clk),.t_1k(t_muestreo));
    Bin_to_7seg_U com2(.in(in), .clk(clk),.cSegU_out(unidadImprimir));
    Bin_to_7seg_D com3(.in(in), .clk(clk),.cSegD_out(decenaImprimir));
    Detector_Decenas com4(.in(in), .digito(d));
    Control_displays com5(.d(d),.clk(clk),.d_timer(t_muestreo), .En_unidad(Digito_unidad), .En_decena(decena));
    mux2_PintarDisplay com6(.En_decena(decena), .cSegU(unidadImprimir),.cSegD(decenaImprimir), .cSeg(cSeg7));
    
endmodule
