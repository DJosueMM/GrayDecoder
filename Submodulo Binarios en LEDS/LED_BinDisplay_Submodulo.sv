`timescale 1ns / 1ps

module LED_BinDisplay(
    input [3:0]binNum, 
    input clk, 
    output reg LED1, 
    output reg LED2,
    output reg LED4,
    output reg LED8
    );
       
    logic [3:0]copy_binNum;
   
    always_ff @(posedge clk) begin
      copy_binNum[3:0] <= binNum[3:0]; 
    end
    
    // Se interpreta el binNum para encender los LEDs correspondientes
    always_comb
      begin
        LED1 = copy_binNum[0];
        LED2 = copy_binNum[1];
        LED4 = copy_binNum[2];
        LED8 = copy_binNum[3];
      end
      
endmodule
