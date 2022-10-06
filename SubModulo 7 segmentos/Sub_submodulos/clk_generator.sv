`timescale 1ns / 1ps

//Creación de timer de 2ms para el muestreo de displays
module muestreoDisplay_timer(input logic clk,
                      output logic t_1k);
                      
    logic [17:0] ctr = 0; //Variable para contar hasta 200_000
    logic clk_out = 0;
    
    assign t_1k = clk_out;
    
    //Contador que crea el timer a partir del clock
    always @ (posedge clk)
        if (ctr == 99_999) begin
            ctr <= 0;
            clk_out <= ~clk_out;
            end
            
        else
            ctr = ctr + 1;        
endmodule
                                                                                                                                                                                               