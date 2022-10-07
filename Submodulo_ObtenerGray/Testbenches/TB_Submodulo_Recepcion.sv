`timescale 1ns / 1ps


module GrayReception_Submodulo_TB();

    logic reloj; 
    logic read; 
    logic [3:0] in; 
    logic [3:0] Dbin_out_in;
    
    Gray_to_Bin_Submodule DUT (reloj, read, in, Dbin_out_in);
   
    always begin    
        #10;
        reloj = ~reloj;
    end
    initial begin
            reloj <=1;
            read <= 1;#1;
            read <= 0;#1;
            read <= 1;#1;
            read <= 0;#1;
            read <= 1;#1;
            in <= 4'b0000; #100;
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
            read <= 0; #20
            in <= 4'b1010; #100;
            in <= 4'b1011; #100;
            in <= 4'b1001; #100;
            in <= 4'b1000; 
    end
 
endmodule