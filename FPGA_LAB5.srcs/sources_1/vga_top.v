//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 12:07:26 AM
// Design Name: 
// Module Name: vga_top
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


module vga_top(
input clk,
input rst,
input i_img_valid,
input [7:0] pix_data,
output [9:0] x_pos,
output [9:0] y_pos,
input [3:0] count,
output [3:0] vgaRed,
output [3:0] vgaGreen,
output [3:0] vgaBlue,
output Hsync,
output Vsync
);

    parameter ZERO  = 4'h0;
    parameter ONE   = 4'h1;
    parameter TWO   = 4'h2;
    parameter THREE = 4'h3;
    parameter FOUR  = 4'h4;
    parameter FIVE  = 4'h5;
    parameter SIX   = 4'h6;
    parameter SEVEN = 4'h7;
    parameter EIGHT = 4'h8;
    parameter NINE  = 4'h9;
    
    parameter GRAY     = 12'h555;
    parameter BLACK    = 12'h000;
    parameter RED      = 12'hE00;
    parameter WHITE    = 12'hFFF;
    parameter GREEN    = 12'h082;
    parameter BLEU     = 12'h08A;
    parameter GOLD     = 12'hB90;
    parameter PINK     = 12'hC8A;
    
    parameter X_MAX    = 10'h008;
    parameter Y_MAX    = 10'h010;
    
    reg [11:0] color;
    reg [11:0] img_data;
    
    always @(posedge clk) begin
    //    else begin
            case(count)
                ZERO: 
                begin
                    color <= color;
                end
                ONE:
                begin
                    color <= BLACK;
                end
                TWO:
                begin
                    color <= RED;
                end
                THREE:
                begin
                    color <= WHITE;
                end
                FOUR:
                begin
                    color <= GOLD;
                end
                FIVE:
                begin
                    color <= BLEU;
                end
                SIX:
                begin
                    color <= GREEN;
                end
                SEVEN:
                begin
                    color <= PINK;
                end
                EIGHT:
                begin
                    color <= GREEN ^ PINK;
                end
                NINE:
                begin
                    color <= BLEU ^ WHITE;
                end
                default:
                    color <= BLACK;
            endcase
        //end
    end
    
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            img_data <= 12'h000;
        end
//        else if((x_pos < X_MAX) && (y_pos < Y_MAX)) begin
//            img_data <= ~color;
//        end
        else begin
            if(i_img_valid == 1'b1) begin
                img_data <= color ^{pix_data[7:4], pix_data[7:4], pix_data[7:4]};
            end
            else begin
                img_data <= color;
            end
        end
    end
    
    
    vga_low_level vga_driver(
    .clk(clk),
    .rst(rst),
    .color(img_data),
    .vgaRed(vgaRed),
    .vgaGreen(vgaGreen),
    .vgaBlue(vgaBlue),
    .Hsync(Hsync),
    .Vsync(Vsync),
    .x_pos(x_pos),
    .y_pos(y_pos)
    );
    
    
endmodule