`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2024 03:07:58 AM
// Design Name: 
// Module Name: img_display
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



module img_display(
    input clk,
    input rst,
    input [9:0] x_pos,
    input [9:0] y_pos,
    output [11:0] o_addr,
    output o_img_valid
    );

parameter X_MAX = 10'h0FF;
parameter Y_MAX = 10'h0FF;
 
parameter X_OFFSET = 10'h028;
parameter Y_OFFSET = 10'h025;
    
wire [15:0] o_addr;
wire o_img_valid;

reg [15:0] addr;
reg img_valid;

assign o_addr = addr;
assign o_img_valid = img_valid;

    always @(posedge clk) begin
        if(rst == 1'b1) begin
            addr <= 0;
        end
        else begin
            if((x_pos - X_OFFSET < X_MAX)  && (y_pos - Y_OFFSET < Y_MAX)) begin
                addr <= (256 * (x_pos - X_OFFSET)) + (y_pos - Y_OFFSET);
                img_valid <= 1'b1;
            end
            else begin
                img_valid <= 1'b0;
                addr <= 16'h0000;
            end
        end
    end
endmodule
