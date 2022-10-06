`timescale 1ns / 1ps

//Multiplexor que decide cu�l digito pintar en funci�n del digito que est� activo en ese momento
module mux2_PintarDisplay(input logic En_decena,
                      input logic [6:0] cSegU,
                      input logic [6:0] cSegD,
                      output logic [6:0] cSeg);
                      
    always @ (En_decena |cSegU | cSegD)     
    
        //los digitos se activan en 0
        begin 
           if(En_decena) //Si las decenas est�n desactivadas
            begin
            cSeg <= cSegU; //pasan las unidades
            end
           else //Si las decenas est�n activadas 
            begin
            cSeg <= cSegD;  //Pasan las decenas
            end
        end
endmodule