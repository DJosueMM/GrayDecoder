`timescale 1ns / 1ps

module sync_TB();

    logic reloj; 
    logic [3:0] in; 
    logic [3:0] Gray_in;
    logic read;
    
   sync DUT (reloj, read, in, Gray_in);
   
          
    always begin    
        #10;
        reloj = ~reloj;
    end
    initial begin
            reloj <=1;
            read <= 1; #20
            in <= 4'b00_00; #100;
            in <= 4'b0001; #100;
            in <= 4'b0011; #100;
            in <= 4'b0010; #100;
            read <= 0; #20
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
