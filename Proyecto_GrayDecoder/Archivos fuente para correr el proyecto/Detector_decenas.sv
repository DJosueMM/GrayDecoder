`timescale 1ns / 1ps

module Detector_Decenas(input logic [3:0]in,
					    output logic digito);

    logic [3:0]Dbin_in; //Entrada al bloque combinacional
    logic d;
    

    assign Dbin_in[3:0] = in[3:0]; 
    assign digito = d;

    //Detección de decenas
 
    assign d  =  Dbin_in[3] & Dbin_in[2] |  Dbin_in[3] & Dbin_in[1];
        
 
endmodule
