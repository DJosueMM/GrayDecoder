`timescale 1ns / 1ps

module LED_BinDisplay_Testbench( 
    );
    
    logic [3:0]binNumber;
    logic clock;
    
    logic led1;
    logic led2;
    logic led4;
    logic led8;
    
    LED_BinDisplay instancia(binNumber, clock, led1, led2, led4, led8);
    
    always begin    
        #10;
        clock = ~clock;
    end

    initial begin 

    	clock <= 1;
    
    	binNumber <= 4'b0000; #100; // Delay 10 ns
    	binNumber <= 4'b0001; #100;
    	binNumber <= 4'b0010; #100;
    	binNumber <= 4'b0011; #100; // Delay 10 ns
    	binNumber <= 4'b0100; #100;
    	binNumber <= 4'b0101; #100;
    	binNumber <= 4'b0110; #100; // Delay 10 ns
    	binNumber <= 4'b0111; #100;
    	binNumber <= 4'b1000; #100;
    	binNumber <= 4'b1001; #100; // Delay 10 ns
    	binNumber <= 4'b1010; #100;
    	binNumber <= 4'b1011; #100;
    	binNumber <= 4'b1100; #100;
    	binNumber <= 4'b1101; #100;
    	binNumber <= 4'b1110; #100;
    	binNumber <= 4'b1111; 
    
    end
    
    
    
  
endmodule
