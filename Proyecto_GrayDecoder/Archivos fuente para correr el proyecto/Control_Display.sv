`timescale 1ns / 1ps

module Control_displays(input logic d,
                        input logic clk, 
                        input logic d_timer,
					    output logic En_unidad,
					    output logic En_decena);

    // Salida del bloque combinacional
    logic unidad;   
    logic decena;
    
    logic en;

    assign En_unidad = unidad;
    assign En_decena = decena;
    assign en = d_timer;
    
    //FSM 
    
    typedef enum logic {S0,S1} statetype;
    statetype state, nextstate;
    
    // Registro de estado
    always_ff@(posedge en)
        state <= nextstate;
    //Logica de siguiente estado
    always_comb
        case(state)
            S0: if(d) nextstate = S1;
                else  nextstate = S0;
            S1: if(d) nextstate = S0;
                else  nextstate = S0;
            default: nextstate = S0;
        endcase
    
    //Lógica de salida
    always_comb
        case(state)
            S1: unidad = 1;
            S0: unidad = 0;
            default unidad = 1; 
        endcase
        
    assign decena = ~unidad;
    
endmodule