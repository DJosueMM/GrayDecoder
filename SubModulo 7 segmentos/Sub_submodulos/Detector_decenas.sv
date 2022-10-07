`timescale 1ns / 1ps

module Control_displays(input logic d,
                        input logic clk, 
                        input logic d_timer,
					    output logic En_unidad,
					    output logic En_decena );

    // Salida del bloque combinacional
    logic unidad;   
    logic decena;

    assign En_unidad = unidad;
    assign En_decena = decena;
    
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
