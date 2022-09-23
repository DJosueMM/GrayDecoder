module convertidorCodigoGray(reloj, reset, numeroBinario, numeroBinarioCodigoGray);	
	input reloj;
	input reset;
	input [3:0] numeroBinario;
	output [3:0] numeroBinarioCodigoGray;
	
	always @(posedge reloj) begin
		if (!reset) begin
			case (numeroBinario)
				4'b0000: numeroBinarioCodigoGray = 4'b0000;
				4'b0001: numeroBinarioCodigoGray = 4'b0001;
				4'b0010: numeroBinarioCodigoGray = 4'b0011;
				4'b0011: numeroBinarioCodigoGray = 4'b0010;
				4'b0100: numeroBinarioCodigoGray = 4'b0110;
				4'b0101: numeroBinarioCodigoGray = 4'b0111;
				4'b0110: numeroBinarioCodigoGray = 4'b0101;
				4'b0111: numeroBinarioCodigoGray = 4'b0100;
				4'b1000: numeroBinarioCodigoGray = 4'b1100;
				4'b1001: numeroBinarioCodigoGray = 4'b1101;
				4'b1010: numeroBinarioCodigoGray = 4'b1111;
				4'b1011: numeroBinarioCodigoGray = 4'b1110;
				4'b1100: numeroBinarioCodigoGray = 4'b1010;
				4'b1101: numeroBinarioCodigoGray = 4'b1011;
				4'b1110: numeroBinarioCodigoGray = 4'b1001;
				4'b1111: numeroBinarioCodigoGray = 4'b1000;
				default: numeroBinarioCodigoGray = 4'b0000;
			endcase
		end
		else begin
			numeroBinarioCodigoGray = 4'b0000;
		end
	end
endmodule 