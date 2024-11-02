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
 
 
 wire rst; // Output from debounce
 
 
 wire [3:0] count; // Output from PS2
 
 wire data_valid; // Output from PS2
 wire number_valid; // Output from PS2
 wire img_valid;  // Output from img_display
 
 reg [2:0]an;
 
 wire [15:0] addra;     // Output from img_display
 wire [15:0] addrb;     // Output from img_processor
 wire [7:0] data;       // Output from ROM
 wire [7:0] proc_data_out;  // Output from img_processor
 wire [7:0] proc_data_in;   // Output from img_processor
 wire proc_w_rn;            // Output from img_processor
 wire [9:0] x_pos;          // Output from vga_low_level
 wire [9:0] y_pos;          // Output from vga_low_level
 
 wire read_only;
 
 assign read_only = 1'b0;
 assign {an_0, an_1, an_2} = an;
 
 always @(posedge clk) begin
    an <= 3'h7;
 end
 

 
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
    
    vga_top vga_ctrl(
    .clk(clk),
    .rst(rst),
    .i_img_valid(img_valid),
    .pix_data(data),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .count(count),
    .vgaRed(vgaRed),
    .vgaGreen(vgaGreen),
    .vgaBlue(vgaBlue),
    .Hsync(Hsync),
    .Vsync(Vsync)
    );
 
    img_display img_disp(
    .clk(clk),
    .rst(rst),
    .x_pos(x_pos),
    .y_pos(y_pos),
    .o_addr(addra),
    .o_img_valid(img_valid)
    );
    
    blk_mem_gen_0 my_rom(
    .clka(clk),
    .addra(addra),
    .dina(),
    .douta(data),
    .wea(read_only),
    /// a↑↓b
    .addrb(addrb),
    .clkb(clk),
    .dinb(proc_data_out),
    .doutb(proc_data_in),
    .web(proc_w_rn)
    );
        
   img_processor(
        .clk(clk),
        .rst(rst),
        .count(count),
        .num_valid(number_valid),
        .i_pixel(proc_data_in),
        .o_pixel(proc_data_out),
        .wr_addr(addrb),
        .write_enable(proc_w_rn)
        );
         
endmodule