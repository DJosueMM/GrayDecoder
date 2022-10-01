`timescale 1ns / 1ps

module Pintar_Display(input logic En_decena,
                      input logic [6:0] cSegU,
                      input logic [6:0] cSegD,
                      output logic [6:0] cSeg);
                      
    tristate t0(cSegU, En_decena, cSeg);
    tristate t1(cSegD, ~En_decena, cSeg);
    
endmodule
