`timescale 1ns / 1ps

module LED_BinDisplay_Testbench( 
    );
    
    logic [3:0]binNumber;
    logic clock;
    
    reg led1;
    reg led2;
    reg led4;
    reg led8;
    
    LED_BinDisplay instancia(binNumber, clock, led1, led2, led4, led8);
    
    always begin    
        #10;
        clock = ~clock;
    end

    initial begin 

    	clock <= 1;
    
    	binNumber = "4'b1010"; #100; // Delay 100 ns
    	binNumber = "4'b0111"; #100;
    	binNumber = "4'b0001"; #100;
    	binNumber = "4'b1111"; #100;
    
    end
    
    
    
  
endmodule
