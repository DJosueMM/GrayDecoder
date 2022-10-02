`timescale 1ns / 1ps

module LED_BinDisplay_Submodulo(input logic [3:0]binNum,
				input logic clk);

    // LEDs para representar un digito binario. Inicialmente apagados todos
    output logic LED1;
    output logic LED2;
    output logic LED4;
    output logic LED8;

    assign logic LED1 = 0;
    assign logic LED2 = 0;
    assign logic LED4 = 0;
    assign logic LED8 = 0;

    // Se declara una variable logica para almacenar el binNum
    logic [3:0]copy_binNum;

    // Necesitamos almacenar la entrada para enviarla al LED. Para ello, un registro
    always_ff @ (posedge clk)
       copy_binNum[3:0] = binNum[3:0];

    // Se interpreta el binNum para encender los LEDs correspondientes
    always_comb
      begin
        LED1 = copy_binNum[0];
        LED2 = copy_binNum[1];
        LED4 = copy_binNum[2];
        LED8 = copy_binNum[3];
      end
endmodule
