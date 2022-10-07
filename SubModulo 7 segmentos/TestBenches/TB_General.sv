`timescale 1ns / 1ps

module TB_General();
    
    logic reloj; 
    logic Digito_decena, Digito_unidad, Digito_centena,Digito_milesima; 
    logic [3:0] in; 
    logic [6:0] cSeg7;
    
    bin_to_7segmentos_SubModulo DUT(reloj, in, Digito_decena, Digito_unidad, Digito_centena, Digito_milesima, cSeg7);
    
    always begin    
        #10;
        reloj = ~reloj;
    end
    initial begin
            reloj <=1;
            in <= 4'b0001; #10000000;
            in <= 4'b1010;
          
    end
 
endmodule
