`timescale 1ns / 1ps

module Full_GrayDecoder(input logic clk,
                        input logic read,
                        input logic [3:0] inSwitch,
                        output logic Digito_decena,
                        output logic Digito_unidad,
                        output logic Digito_centena,
                        output logic Digito_milesima,
                        output logic Digito_decenaNAN,
                        output logic Digito_unidadNAN,
                        output logic Digito_centenaNAN,
                        output logic Digito_milesimaNAN,
                        output logic [6:0] cSeg7,
                        output logic LED1, 
                        output logic LED2,
                        output logic LED4,
                        output logic LED8 
                        );
                        
   wire [3:0] bin;   
   assign Digito_decenaNAN = 1;
   assign Digito_unidadNAN = 1;
   assign Digito_centenaNAN = 1;
   assign Digito_milesimaNAN = 1;
                    
   Gray_to_Bin_Submodule Modulo1(.clk(clk),.read(read),.inSwitch(inSwitch), .Dbin_out_in(bin));                      
   LED_BinDisplay Modulo2 (.binNum(bin),.clk(clk),.LED1(LED1), .LED2(LED2),.LED4(LED4),.LED8(LED8));
   bin_to_7segmentos_SubModulo Modulo3(.clk(clk),.in(bin),.Digito_decena(Digito_decena),.Digito_unidad(Digito_unidad),.Digito_centena(Digito_centena), .Digito_milesima(Digito_milesima), .cSeg7(cSeg7));                 
                                         
endmodule
