`timescale 1ns / 1ps


module PintarDisplay_TB();
    logic En_decena; 
    logic [6:0] cSegU; 
    logic [6:0] cSegD;
    logic [6:0] cSeg;
    
    mux2_PintarDisplay DUT (En_decena, cSegU, cSegD, cSeg);

    initial begin
            
            En_decena <= 1; #1;
            cSegU <= 7'b1000000; #1;
            cSegD <= 7'b1111111; #10;
            En_decena <= 0; #1; 
            cSegU <= 7'b1000000; #1;
            cSegD <= 7'b1111111;        
     
    end
 
endmodule