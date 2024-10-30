`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2024 07:24:46 PM
// Design Name: 
// Module Name: topLevel
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


module topLevel(
input clk,
input btnC,
input PS2Clk,
input PS2Data,
output [3:0] vgaRed,
output [3:0] vgaGreen,
output [3:0] vgaBlue,
output Hsync,
output Vsync,
output debug_data,
output debug_clk,
output ca,
output cb,
output cc,
output cd,
output ce,
output cf,
output cg,
output an_0,
output an_1,
output an_2,
output anode,
output [7:0] led,
output myParity,
output myParityCX
);
 
 parameter X_MAX = 10'h008;
 parameter Y_MAX = 10'h010;
 
 parameter X_OFFSET = 10'h028;
 parameter Y_OFFSET = 10'h025;
 
 
 wire [3:0] count;
 wire rst;
 wire data_valid;
 wire number_valid;
 reg [2:0]an;
 reg [11:0] addr;
 wire [23:0] data;
 
 wire [9:0] x_pos;
 wire [9:0] y_pos;
 
 assign {an_0, an_1, an_2} = an;
 
 always @(posedge clk) begin
    an <= 3'h7;
 end
 
 vga_top vga_ctrl(
 .clk(clk),
 .rst(rst),
 .pix_data(data),
 .x_pos(x_pos),
 .y_pos(y_pos),
 .count(count),
 .num_valid(number_valid),
 .vgaRed(vgaRed),
 .vgaGreen(vgaGreen),
 .vgaBlue(vgaBlue),
 .Hsync(Hsync),
 .Vsync(Vsync)
 );
 
 debounce debounce_btn(
    .clk(clk),
    .button(btnC),
    .pushed(rst)
    );
    
    sev_seg number(
    .clk(clk),
    .rst(rst),
    .data_valid(data_valid),
    .count(count),
    .anode(anode),
    .ca(ca),
    .cb(cb),
    .cc(cc),
    .cd(cd),
    .ce(ce),
    .cf(cf),
    .cg(cg),
    .valid_number(number_valid)
    );
    
    ps2 kb(
    .clk(clk),
    .rst(rst),
    .PS2Clk(PS2Clk),
    .PS2Data(PS2Data),
    .count(count),
    .data_valid(data_valid),
    .debug_data(debug_data),
    .debug_clk(debug_clk),
    .leds(led),
    .valid_number(number_valid),
    .o_parity(myParity),
    .o_parity_cx(myParityCX)
    );
    
    
    blk_mem_gen_0 my_rom(
    .clka(clk),
    .addra(addr),
    .douta(data)
    );
    
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            addr <= 0;
        end
        else if(data_valid == 1'b1) begin
            if((x_pos - X_OFFSET < X_MAX)  && (y_pos - Y_OFFSET < Y_MAX)) begin
                addr <= (count * 128) + (x_pos - X_OFFSET) + ((y_pos - Y_OFFSET) * 8);
            end
            else begin
                addr <= 12'hFFF;
            end
        end
    end
    
    
endmodule