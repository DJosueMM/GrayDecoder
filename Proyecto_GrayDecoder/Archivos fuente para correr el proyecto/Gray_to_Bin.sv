`timescale 1ns / 1ps

module Gray_to_Bin(input logic [3:0]in,
                     input logic clk, 
					 output logic [3:0]dbin_out);

    logic [3:0]Dgray_in; //Entrada al bloque combinacional
    logic [6:0]Dbin;   // Salida del bloque combinacional
    
    always_ff @ (posedge clk) //Registro de entrada
        Dgray_in[3:0] <= in[3:0]; //Salida del registro de entrada
    
    always_ff @ (posedge clk) //Registro de salida
        dbin_out <= Dbin; //Salida del registro de salida
    
   //Bloque combinacional que decodifica binario a 7 segmentos para las unidades 
    always_comb
        begin
            case(Dgray_in)
            
                4'b00_00: Dbin  <= 4'b00_00; // 0 -> 0
                4'b0001: Dbin  <= 4'b0001; // 1 -> 1
                4'b0011: Dbin  <= 4'b0010; // 2 -> 2 
                4'b0010: Dbin  <= 4'b0011; // 3 -> 3
                4'b0110: Dbin  <= 4'b0100; // 4 -> 4
                4'b0111: Dbin  <= 4'b0101; // 5 -> 5
                4'b0101: Dbin  <= 4'b0110; // 6 -> 6
                4'b0100: Dbin  <= 4'b0111; // 7 -> 7
                4'b1100: Dbin  <= 4'b1000; // 8 -> 8
                4'b1101: Dbin  <= 4'b1001; // 9 -> 9
                4'b1111: Dbin  <= 4'b1010; // 10 -> 10
                4'b1110: Dbin  <= 4'b1011; // 11 -> 11
                4'b1010: Dbin  <= 4'b1100; // 12 -> 12
                4'b1011: Dbin  <= 4'b1101; // 13 -> 13
                4'b1001: Dbin  <= 4'b1110; // 14 -> 14
                4'b1000: Dbin  <= 4'b1111; // 15 -> 15
                
                default: Dbin  <= 4'b00_00; // _ -> 0
            endcase
        end
endmodule



