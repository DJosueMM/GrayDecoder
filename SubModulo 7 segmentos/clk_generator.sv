`timescale 1ns / 1ps

module muestreoDisplay_timer(input logic clk,
                      output logic t_1k);
                      
    logic [18:0] ctr = 0;
    logic clk_out = 0;
    
    assign t_1k = clk;
    
    always @ (posedge clk)
        if (ctr == 200_000) begin
            ctr <= 0;
            clk_out <= ~clk_out;
            end
            
        else
            ctr <= ctr + 1;
               
endmodule
                                                                                                                                                                                               