`timescale 1ns / 1ps

module Testbench_Completo();

    logic clk1;
    logic readIt;
    logic [3:0] grayNum;
    logic Digito_dec, Digito_uni, Digito_cen, Digito_mil;
    logic Digito_decenaNAN, Digito_unidadNAN, Digito_centenaNAN, Digito_milesimaNAN;
    logic [6:0] cSeg7;
    logic LED1, LED2, LED4, LED8;
    
    Full_GrayDecoder instancia(.clk(clk1), .read(readIt), .inSwitch(grayNum), 
                               .Digito_decena(Digito_dec), .Digito_unidad(Digito_uni), .Digito_centena(Digito_cen), .Digito_milesima(Digito_mil), 
                               .Digito_decenaNAN(Digito_decenaNAN), .Digito_unidadNAN(Digito_unidadNAN), .Digito_centenaNAN(Digito_centenaNAN), .Digito_milesimaNAN(Digito_milesimaNAN),
                               .cSeg7(cSeg7), .LED1(LED1), .LED2(LED2), .LED4(LED4), .LED8(LED8));

    always begin    
        #10;
        clk1 = ~clk1;
    end
    
    initial begin
    
            clk1 <=1;
            
            grayNum <= 4'b0000; #2000000;
            readIt <= 1; #2000000;
            readIt <= 0; #2000000;
            
            grayNum <= 4'b0001; #2000000;
            readIt <= 1; #2000000;
            readIt <= 0; #2000000;

            grayNum <= 4'b0011; #2000000;
            readIt <= 1; #2000000;
            readIt <= 0; #2000000;
                 
    end
    
endmodule
