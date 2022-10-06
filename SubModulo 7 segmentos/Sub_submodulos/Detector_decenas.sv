`timescale 1ns / 1ps

module Control_displays(input logic [3:0]in,
                        input logic clk, 
                        input logic d_timer,
					    output logic En_unidad,
					    output logic En_decena );

    logic [3:0]Dbin_in; //Entrada al bloque combinacional
    
    // Salida del bloque combinacional
    logic unidad;   
    logic decena;
    logic d;
    
    
    assign Dbin_in[3:0] = in[3:0]; //Salida del registro de entrada
    
    assign En_unidad = unidad;
    assign En_decena = decena;
    
    //Detección de decenas
    always_comb
        begin
            d  =  Dbin_in[3] & Dbin_in[2] |  Dbin_in[3] & Dbin_in[1];
        end
    
    //FSM
    
    typedef enum logic {S0,S1} statetype;
    statetype state, nextstate;
    
    // Registro de estado
    always_ff@(posedge clk)
        if(d_timer)  state <= nextstate;
    
    //Logica de siguiente estado
    always_comb
        case(state)
            S0: if(d) nextstate = S1;
                else  nextstate = S0;
            S1: nextstate = S0;
        endcase
    
    //Lógica de salida
    always_comb
        case(state)
            S0: unidad = 0;
            S0: decena = 1;
            S1: unidad = 1;
            S1: decena = 0;
        endcase
    
endmodule
