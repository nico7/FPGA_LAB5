`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2024 02:00:58 PM
// Design Name: 
// Module Name: img_processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module img_processor(
    input clk,
    input rst,
    input [3:0] count,
    input num_valid,
    input  [7:0] i_pixel,
    output [7:0] o_pixel,
    output [15:0] wr_addr,
    output write_enable
    );
    
    parameter X_MAX = 10'h0FF;
    parameter Y_MAX = 10'h0FF;
 
    parameter X_OFFSET = 10'h028;
    parameter Y_OFFSET = 10'h025;
    
    parameter IDLE  = 3'h0;
    parameter STATE1 = 3'h1;
    
    
    reg we;
    reg start_machine;
    reg [2:0] state;
    reg [7:0] x;
    reg [7:0] y;
    
    // Defining each pixel of the Kernel
    reg [15:0] topL;
    reg [15:0] top;
    reg [15:0] topR;
    reg [15:0] cenL;
    reg [15:0] center;
    reg [15:0] cenR;
    reg [15:0] botL;
    reg [15:0] bottom;
    reg [15:0] botR;
    
    assign write_enable = we;
    
   
    
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            state <= IDLE;
            start_machine <= 1'b0;
        end
        else begin
            if((num_valid == 1'b1) &&( count == 3'h0)) begin
                start_machine <= 1'b1;
            end
            else begin
                start_machine <= 1'b0;
            end
        end
    
    end
    
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            state <= IDLE;
            x <= 8'h0;
            y <= 8'h0;
        end
        else begin
            if(start_machine == 1'b1) begin
                state <= STATE1; 
                x <= 8'h0;
                y <= 8'h0;
            end
            
            case(state)
            STATE1: 
            begin
            
                
            
            end
            default:
            endcase
        end
    end
    
endmodule
