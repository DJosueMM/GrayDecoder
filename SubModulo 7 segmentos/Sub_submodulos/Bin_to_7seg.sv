`timescale 1ns / 1ps

module Bin_to_7seg_U(input logic [3:0]in,
                     input logic clk, 
					 output logic [6:0]cSegU_out );

    logic [3:0]Dbin_in; //Entrada al bloque combinacional
    logic [3:0]cSegU;   // Salida del bloque combinacional
    
    always_ff @ (posedge clk) //Registro de entrada
        Dbin_in[3:0] = in[3:0]; //Salida del registro de entrada
    
    always_ff @ (posedge clk) //Registro de salida
        cSegU_out = cSegU; //Salida del registro de salida
   
   //Bloque combinacional que decodifica binario a 7 segmentos para las unidades 
    always_comb
        begin
            case(Dbin_in)
            //     AB_CD              ABC_DEFG
                4'b00_00: cSegU  = 7'b100_0000; // 0 -> 0
                4'b00_01: cSegU  = 7'b111_1001; // 1 -> 1
                4'b00_10: cSegU  = 7'b010_0100; // 2 -> 2
                4'b00_11: cSegU  = 7'b011_0000; // 3 -> 3
                4'b01_00: cSegU  = 7'b001_1001; // 4 -> 4
                4'b01_01: cSegU  = 7'b001_0010; // 5 -> 5
                4'b01_10: cSegU  = 7'b000_0010; // 6 -> 6
                4'b01_11: cSegU  = 7'b111_1000; // 7 -> 7
                4'b10_00: cSegU  = 7'b000_0000; // 8 -> 8
                4'b10_01: cSegU  = 7'b001_0000; // 9 -> 9
                4'b10_10: cSegU  = 7'b100_0000; // 10 -> 0
                4'b10_11: cSegU  = 7'b111_1001; // 11 -> 1
                4'b11_00: cSegU  = 7'b010_0100; // 12 -> 2
                4'b11_01: cSegU  = 7'b011_0000; // 13 -> 3
                4'b11_10: cSegU  = 7'b001_1001; // 14 -> 4
                4'b11_11: cSegU  = 7'b001_0010; // 15 -> 5
                
                default: cSegU = 7'b1111111; // _ -> _
            endcase
        end
endmodule
