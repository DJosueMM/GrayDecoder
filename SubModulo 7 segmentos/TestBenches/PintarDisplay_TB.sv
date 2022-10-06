`timescale 1ns / 1ps


module PintarDisplay_TB();
    logic En_decena; 
    logic [6:0] cSegU; 
    logic [6:0] cSegD;
    logic [6:0] cSeg;
    
   mux2_PintarDisplay DUT (En_decena, cSegU, cSegD, cSeg);


    always begin    
        #10;
        reloj = ~reloj;
    end
    initial begin
            reloj <=1;
            cSegU <= 7'b1000000; cSegD <= 7'b1111111;  En_decena <= 1; #1000000;
            cSegU <= 7'b1111001; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            cSegU <= 7'b0100100; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            cSegU <= 7'b0110000; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            cSegU <= 7'b0011001; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            cSegU <= 7'b0010010; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            cSegU <= 7'b0000010; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            cSegU <= 7'b1111000; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            cSegU <= 7'b0000000; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            cSegU <= 7'b0010000; cSegD <= 7'b1111111; En_decena <= 1; #1000000;
            
            cSegU <= 7'b1000000; cSegD <= 7'b1111111;  En_decena <= 0; #1000000;
            cSegU <= 7'b1000000; cSegD <= 7'b111_1001;  En_decena <= 0;
    end
 
endmodule