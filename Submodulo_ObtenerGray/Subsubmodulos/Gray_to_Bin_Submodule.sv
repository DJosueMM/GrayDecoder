`timescale 1ns / 1ps

module Gray_to_Bin_Submodule(input logic clk,
                             input logic read,
                             input logic [3:0] inSwitch,
                             output logic [3:0] Dbin_out_in);
               
    
    wire [3:0] dGray;

 
    //Conexión de los subsubmodulos
    Gray_to_Bin sub1 (.in(dGray),.clk(clk),.dbin_out(Dbin_out_in));
    sync sub2 (.clk(clk),.read(read), .Gray_Switch(inSwitch),.Gray_in(dGray));
    
    
    
endmodule
