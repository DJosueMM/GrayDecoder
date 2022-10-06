`timescale 1ns / 1ps


module Bin_to_7segD_TB();

    logic reloj; 
    logic [3:0] in; 
    logic [6:0] cSegD_out;
    
    Bin_to_7seg_D DUT (in, reloj, cSegD_out);
    
   
    always begin    
        #10;
        reloj = ~reloj;
    end
    initial begin
            reloj <=1;
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