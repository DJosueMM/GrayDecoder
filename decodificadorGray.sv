`timescale 1ns / 1ps

module decodificadorCodigoGray(reloj, reset, g, b);	
    input reloj;
    input reset;
    input [3:0] g;
    output reg [3:0] b;
    always @(posedge reloj) begin
        if (!reset) begin
            b[0] = g[0];
            b[1] = (~g[0]&g[1])|(g[0]&~g[1]);
            b[2] = (~g[0]&~g[1]&g[2])|(~g[0]&g[1]&~g[2])|(g[0]&~g[1]&~g[2])|(g[0]&g[1]&g[2]);
            b[3] = (~g[0]&~g[1]&~g[2]&g[3])|(~g[0]&~g[1]&g[2]&~g[3])|(~g[0]&g[1]&~g[2]&~g[3])|(~g[0]&g[1]&g[2]&g[3])|(g[0]&~g[1]&~g[2]&~g[3])|(g[0]&~g[1]&g[2]&g[3])|(g[0]&g[1]&~g[2]&g[3])|(g[0]&g[1]&g[2]&~g[3]);
        end
        else begin
            b = 4'b0000;
        end
    end
endmodule