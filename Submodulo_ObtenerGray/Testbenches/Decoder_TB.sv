`timescale 1ns / 1ps


module Decoder_TB();

    logic reloj; 
    logic [3:0] in; 
    logic [3:0] dbin_out;
    
   Gray_to_Bin DUT (in, reloj, dbin_out);
   
    always begin    
        #10;
        reloj = ~reloj;
    end
    initial begin
            reloj <=1;
            
            in <= 4'b00_00; #100;
            in <= 4'b0001; #100;
            in <= 4'b0011; #100;
            in <= 4'b0010; #100;
            in <= 4'b0110; #100;
            in <= 4'b0111; #100;
            in <= 4'b0101; #100;
            in <= 4'b0100; #100;
            in <= 4'b1100; #100;
            in <= 4'b1101; #100;
            in <= 4'b1111; #100;
            in <= 4'b1110; #100;
            in <= 4'b1010; #100;
            in <= 4'b1011; #100;
            in <= 4'b1001; #100;
            in <= 4'b1000; 
        
    end

endmodule
