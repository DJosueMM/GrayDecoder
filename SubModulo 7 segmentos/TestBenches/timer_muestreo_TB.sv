`timescale 1ns / 1ps


module timer_muestreo_TB();
    
    logic reloj; 
    logic t_1k;
    
    muestreoDisplay_timer DUT(reloj,t_1k);
    

    always begin    
        #10;
        reloj = ~reloj;
    end
    initial begin
            reloj <=1;

    end
 
endmodule
