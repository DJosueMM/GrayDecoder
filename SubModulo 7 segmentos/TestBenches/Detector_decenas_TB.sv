`timescale 1ns / 1ps

module Detector_decenas_TB();

    logic d; 
    logic [3:0] in; 
        
    Detector_Decenas DUT(in, d);
    
    initial begin
            in <= 4'b0000; #1000000;
            in <= 4'b0001; #1000000;
            in <= 4'b0010; #1000000;
            in <= 4'b0011; #1000000;
            in <= 4'b0100; #1000000;
            in <= 4'b0101; #1000000;
            in <= 4'b0110; #1000000;
            in <= 4'b0111; #1000000;
            in <= 4'b10_00;#1000000;
            in <= 4'b1001; #1000000;
            in <= 4'b1010; #1000000;
            in <= 4'b1011; #1000000;
            in <= 4'b1100; #1000000;
            in <= 4'b1101; #1000000;
            in <= 4'b1110; #1000000;
            in <= 4'b1111; 
    end
 
endmodule