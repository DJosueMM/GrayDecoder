`timescale 1ns / 1ps

//Multiplexor que decide cu�l digito pintar en funci�n del digito que est� activo en ese momento
module mux2_PintarDisplay(input logic En_decena,
                      input logic [6:0] cSegU,
                      input logic [6:0] cSegD,
                      output logic [6:0] cSeg);
                      
          assign cSeg = En_decena ? cSegU : cSegD;

endmodule