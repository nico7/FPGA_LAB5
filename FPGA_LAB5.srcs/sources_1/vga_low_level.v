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

module vga_low_level(
input clk,
input rst,
input [11:0] color,
output [3:0] vgaRed,
output [3:0] vgaGreen,
output [3:0] vgaBlue,
output Hsync,
output Vsync,
output [9:0] x_pos,
output [9:0] y_pos
);

parameter HSYNC_PW          = 96;
parameter HSYNC_FP          = 16;
parameter HSYNC_BP          = 48;
parameter HSYNC_DISPLAY     = 640;
parameter HTHRESH_1         = 688;
parameter HSYNC_ACTIVE      = 704;
parameter HSYNC_PERIOD      = 800;

parameter VSYNC_PW          = 2;
parameter VSYNC_FP          = 10;
parameter VSYNC_BP          = 29;
parameter VSYNC_DISPLAY     = 480;
//parameter VTHRESH_1       = 490;
parameter VSYNC_ACTIVE      = 519;
parameter VSYNC_PERIOD      = 521;   


parameter BLACK         = 12'h000;


//reg pres_clk, prev_clk, slow_clk;
reg [2:0] fast_clk_counter;
reg [9:0] hor_count;
reg [9:0] ver_count;

reg [11:0] current_color;


reg hor_local, ver_local;
reg color_out;



assign {vgaRed, vgaGreen, vgaBlue} = current_color;
assign Hsync = hor_local;
assign Vsync = ver_local;
assign x_pos = hor_count;
assign y_pos = ver_count;

// Use a clock counter to be used to divide the clock
always @(posedge clk) begin
    if(rst == 1'b1) begin
        fast_clk_counter <= 0;
    end
    else begin
        fast_clk_counter <= fast_clk_counter + 1;
    end
end

 

// This block makes sure that changing color_out enables or disables the image signal
always @(posedge clk) begin
    if(rst == 1'b1) begin
        current_color <= BLACK;
    end
    else begin
        if(color_out == 1'b1) begin
            current_color <= color;
        end
        else begin
            current_color <= BLACK;
        end
    end
end

always @(posedge fast_clk_counter[1]) begin
    if (rst == 1'b1) begin
        hor_count <= 1'b0;
        ver_count <= 1'b0;
    end
   // if(slow_clk == 1'b1) begin
        if(hor_count == HSYNC_PERIOD - 1) begin
            hor_count <= 0;
            if(ver_count == VSYNC_PERIOD - 1) begin
                ver_count <= 0;
            end
            else begin
                ver_count <= ver_count + 1;
            end
        end
        else begin
            hor_count <= hor_count + 1;
        end
   // end
end


always @(posedge clk) begin
    if(rst == 1'b1) begin
        hor_local <= 1'b1;
        ver_local <= 1'b1;
    end
    else if(hor_count < HSYNC_ACTIVE) begin
        hor_local <= 1'b1;
    end
    else begin
        hor_local <= 1'b0;
    end
    
    if(ver_count < VSYNC_ACTIVE) begin
        ver_local <= 1'b1;
    end
    else begin
        ver_local <= 1'b0;
    end
 end
 
 always @(posedge clk) begin
    if (rst == 1'b1) begin
        color_out <= 1'b1;
    end
    else if (hor_count < HSYNC_ACTIVE && ver_count < VSYNC_ACTIVE) begin
        color_out <= 1'b1;
    end
    else begin
        color_out <= 1'b0;
    end
 end
 
 

endmodule