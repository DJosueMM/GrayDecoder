`timescale 1ns / 1ps


module sync(input logic clk,
            input logic read,
            input logic [3:0] Gray_Switch,
            output logic [3:0] Gray_in);
            
    logic [3:0] n1;
    logic [3:0] d;
    logic [3:0] q;
    logic en;
    
    assign d = Gray_Switch;
    assign Gray_in = q;
    assign en = read;
    
    always_ff @(posedge clk)
        if(en)
            begin
                n1 <= d; 
                q <= n1; 
            end
 
endmodule