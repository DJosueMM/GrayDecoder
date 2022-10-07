`timescale 1ns / 1ps


module Control_display_TB();
    
    logic reloj; 
    logic d; 
    logic d_timer;
    logic En_unidad;
    logic En_decena;
    
    muestreoDisplay_timer com1(.clk(reloj),.t_1k(d_timer));
    Control_displays DUT(d, reloj, d_timer, En_unidad, En_decena);
   
    always begin    
        #10;
        reloj = ~reloj;
    end
    initial begin
            reloj <=1;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 0; #1000000;
            d <= 1; #1000000;
            d <= 1; #1000000;
            d <= 1; #1000000;
            d <= 1; #1000000;
            d <= 0; #1000000;
            d <= 1; #1000000;
            d <= 1; #1000000;
            d <= 1; #1000000;
            d <= 1; #1000000;
            d <= 1; 
    end
 
endmodule