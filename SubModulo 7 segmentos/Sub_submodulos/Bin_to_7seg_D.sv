`timescale 1ns / 1ps

module Bin_to_7seg_D(input logic [3:0]in,
                     input logic clk, 
					 output logic [6:0]cSegD_out );

    logic [3:0]Dbin_in; //Entrada al bloque combinacional
    logic [3:0]cSegD;   // Salida del bloque combinacional
    
    always_ff @ (posedge clk) //Registro de entrada
        Dbin_in[3:0] = in[3:0]; //Salida del registro de entrada
    
    always_ff @ (posedge clk) //Registro de salida
        cSegD_out = cSegD; //Salida del registro de salida
   
   //Bloque combinacional que decodifica binario a 7 segmentos para las decenas
    always_comb
        begin
            case(Dbin_in)
            //     AB_CD              ABC_DEFG
                4'b00_00: cSegD = 7'b1111111; // 0 -> _
                4'b00_01: cSegD = 7'b1111111; // 1 -> _
                4'b00_10: cSegD = 7'b1111111; // 2 -> _
                4'b00_11: cSegD = 7'b1111111; // 3 -> _
                4'b01_00: cSegD = 7'b1111111; // 4 -> _
                4'b01_01: cSegD = 7'b1111111; // 5 -> _
                4'b01_10: cSegD = 7'b1111111; // 6 -> _
                4'b01_11: cSegD = 7'b1111111; // 7 -> _
                4'b10_00: cSegD = 7'b1111111; // 8 -> _
                4'b10_01: cSegD = 7'b1111111; // 9 -> _ 
                4'b10_10: cSegD = 7'b111_1001;// 10 -> 1
                4'b10_11: cSegD = 7'b111_1001;// 11 -> 1
                4'b11_00: cSegD = 7'b111_1001;// 12 -> 1
                4'b11_01: cSegD = 7'b111_1001;// 13 -> 1
                4'b11_10: cSegD = 7'b111_1001;// 14 -> 1
                4'b11_11: cSegD = 7'b111_1001;// 15 -> 1
                
                default: cSegD = 7'b1111111; // _->_
            endcase
        end
endmodule