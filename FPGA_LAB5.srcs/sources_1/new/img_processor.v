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
    output write_enable,
    output [7:0] leds
    );
    
    parameter READ = 1'b0;
    parameter WRITE = 1'b1;
    
    parameter X_MAX = 10'h0FF;
    parameter Y_MAX = 10'h0FF;
 
    parameter X_OFFSET = 10'h028;
    parameter Y_OFFSET = 10'h025;
    
    parameter STATE_IDLE  = 3'h0;
    parameter STATE_WAIT_TO_SYNC = 3'h1;
    parameter STATE_FILT = 3'h2;
    parameter STATE_NEXT_PIX = 3'h3;
    
    parameter BEGINNING = 8'h00;    // First row or column address
    parameter ENDING    = 8'hFF;    // Last row or column address
    
    // Types of filter to account for edges and corners
    parameter TYPE_4_TL = 4'h0;
    parameter TYPE_4_TR = 4'h1;
    parameter TYPE_4_BL = 4'h2;
    parameter TYPE_4_BR = 4'h3;
    parameter TYPE_9 = 4'h4;
    parameter TYPE_6H_TOP = 4'h5;
    parameter TYPE_6H_BOT = 4'h6;
    parameter TYPE_6V_LEFT = 4'h7;
    parameter TYPE_6V_RIGHT = 4'h8;
    
    parameter CLK_THRESH = 8'h40;
    
    parameter FIFTY_SEVEN = 8'h39;
    parameter EIGHTY_FIVE = 8'h55;
    
    parameter NINTH = 2'h0;
    parameter FOURTH = 2'h1;
    parameter SIXTH = 2'h2;
    
    reg [7:0] debug_leds;
    reg we;
    
    // We want to detect the posedge of num_valid;
    reg prev_num_valid;
    reg pres_num_valid;
    reg num_valid_edge;
    
    reg start_machine;
    reg [2:0] state;
    reg [3:0] filter_type;
    
    reg [2:0] divide_type;  // corners 1/4, edges 1/6, others 1/9
    reg [7:0] x;    // center pixel coordenates
    reg [7:0] y;    // center pixel coordenates
    
    reg [7:0] f_x;  // filter_pixel coordenates
    reg [7:0] f_y;  // filter_pixel coordenates
    
    
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
    
    reg [20:0] accum;
    
    reg [8:0]  clk_count; // we are going to need 18 cycles to retreive each ( = 9 x3 ) pixel of the kernel 
                          // + 1 for calculating each address + n for the actual filtering
    
    // Since the address calculation might take multiple cycles, I'll break it up
    reg [15:0] x_offset;
    reg [15:0] y_offset;
    reg [15:0] mult;
    
    reg [15:0] addr;
    reg [7:0] output_byte;
    
    assign write_enable = we;
    assign wr_addr = addr;
    assign o_pixel = output_byte;
    assign leds = debug_leds;
    
   always @(posedge clk) begin
        if(rst == 1'b1) begin
            pres_num_valid <= 1'b1;
            prev_num_valid <= 1'b1;
            num_valid_edge <= 1'b0;
        end
        else begin
            pres_num_valid <= num_valid;
            prev_num_valid <= pres_num_valid;
        end
        
        num_valid_edge <= ~prev_num_valid & pres_num_valid;
   end
   
   always @(posedge clk) begin
       if(rst == 1'b1) begin
            clk_count <= 3'h0;
       end
       else begin
            if((clk_count == CLK_THRESH)) begin
                clk_count <= 3'h0;
            end
            else begin
                clk_count <= clk_count + 1;
            end
       end
   end
    
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            start_machine <= 1'b0;
        end
        else begin
            if((num_valid_edge == 1'b1) &&( count == 4'h0)) begin
                start_machine <= 1'b1;
            end
            else begin
                start_machine <= 1'b0;
            end
        end
    
    end
    
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            state <= STATE_IDLE;
            x <= 8'h0;
            y <= 8'h0;
            debug_leds[7:0] <= 8'h00;
        end
        else begin
            if(start_machine == 1'b1) begin
                state <= STATE_WAIT_TO_SYNC;
                debug_leds[0] <= 1'b1;
            end
            else begin
                case(state)
                STATE_IDLE:
                begin
                    state <= STATE_IDLE;
                    debug_leds[7] <= ~debug_leds[7];
                end
                STATE_WAIT_TO_SYNC:
                begin
                    debug_leds[1] <= 1'b1;
                    if(clk_count == CLK_THRESH) begin
                        state <= STATE_FILT;
                        x <= 8'h0;
                        y <= 8'h0;
                    end
                end
                
                STATE_FILT: 
                begin
                debug_leds[2] <= 1'b1;
                    if(clk_count == CLK_THRESH) begin
                        state <= STATE_NEXT_PIX;
                    end
                end
                STATE_NEXT_PIX:
                begin
                    debug_leds[3] <= ~debug_leds[3];
                    if(clk_count == CLK_THRESH) begin
                        if(x == 8'hFF) begin    // If this is the last pixel of the row
                            x <= 8'h0;
                            if(y == 8'hFF) begin    // If this is the last column
                                y <= 8'h0;
                                state <= STATE_IDLE;
                                debug_leds[4] <= ~debug_leds[4];
                            end
                            else begin  // If this is not the last column
                                y <= y + 1;
                                state <= STATE_FILT;
                                debug_leds[5] <= ~debug_leds[5];
                            end
                        end
                        else begin      // If this is not the last pixel of the row
                            x <= x + 1;
                            state <= STATE_FILT;
                            debug_leds[6] <= ~debug_leds[6];
                        end
                    end
                end
                default: 
                begin
                    state <= STATE_IDLE;
                end
                endcase
            end
        end
    end
    
    // Taking the FILTERING STATE into a new block because it's a lot of code
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            filter_type <= TYPE_4_TL;
            divide_type <= FOURTH;
            addr <= 16'h0000;
            we <= READ;
        end
        else if(state == STATE_FILT) begin
            case(clk_count)
            8'h00:
            begin
                if(x == BEGINNING) begin    // If it's the first pixel of the row
                    if(y == BEGINNING) begin       // If it's on the top row
                        filter_type <= TYPE_4_TL;
                        divide_type <= FOURTH;
                    end
                    else if (y == ENDING) begin  // If it's on the last row
                        filter_type <= TYPE_4_BL;
                        divide_type <= FOURTH;
                    end
                    else begin                  // If it's somewhere in the middle of the 1st column
                        filter_type <= TYPE_6V_LEFT;
                        divide_type <= SIXTH;
                    end
                end
                else if( x == ENDING) begin  // If it's the last pixel of the row
                    if(y == BEGINNING) begin    // If it's on the top row
                        filter_type <= TYPE_4_TR;
                        divide_type <= FOURTH;
                    end
                    else if (y == ENDING) begin    // If it's on the bottom row
                        filter_type <= TYPE_4_BR;
                        divide_type <= FOURTH;
                    end
                    else begin                  // If it's somwehere in the middle of the last column
                        filter_type <= TYPE_6V_RIGHT;
                        divide_type <= SIXTH;
                    end
                end
                else if (y == BEGINNING) begin
                    filter_type <= TYPE_6H_TOP;
                    divide_type <= SIXTH;
                end
                else if (y  == ENDING) begin
                    filter_type <= TYPE_6H_BOT;
                    divide_type <= SIXTH; 
                end
                else begin
                    filter_type <= TYPE_9;
                    divide_type <= NINTH;
                end
            end
            // Top Left
            8'h01:  // Start fitst stage of calculating for Top Left
            begin         
                we <= READ;
                
                if((filter_type == TYPE_9 ) || (filter_type == TYPE_6H_BOT ) || 
                   (filter_type == TYPE_4_BR ) || (filter_type == TYPE_6V_RIGHT )) begin
                           
                    x_offset <= x - 1;   // First stage of address calculation
                    y_offset <= y - 1;
                end
            end
            8'h02: // second stage of address calculation
            begin
                if((filter_type == TYPE_9 ) || (filter_type == TYPE_6H_BOT ) || 
                   (filter_type == TYPE_4_BR ) || (filter_type == TYPE_6V_RIGHT )) begin
                            
                    mult <= {y_offset, 8'h00};
                end 
            end
            8'h03: // final stage of address calculation
            begin
                        if((filter_type == TYPE_9 ) || (filter_type == TYPE_6H_BOT ) || 
                           (filter_type == TYPE_4_BR ) || (filter_type == TYPE_6V_RIGHT )) begin
                                
                            addr <= x_offset + mult;
                        end
            end
            8'h06: // wait for 2 cycles to happen before getting the data
            begin                 
                if((filter_type == TYPE_9 ) || (filter_type == TYPE_6H_BOT ) || 
                   (filter_type == TYPE_4_BR ) || (filter_type == TYPE_6V_RIGHT )) begin
                    
                    if(divide_type == NINTH) begin  
                        topL <= i_pixel *  FIFTY_SEVEN;
                    end
                    else if(divide_type == SIXTH) begin
                        topL <= i_pixel * EIGHTY_FIVE;
                    end
                    else begin
                        topL <= i_pixel;
                    end
                end
            end
            // Top center
            8'h07: // Start first stage of calculating for top center
            begin
                if((filter_type == TYPE_9 ) || (filter_type == TYPE_4_BL ) || (filter_type == TYPE_4_BR ) || 
                   (filter_type == TYPE_6V_LEFT ) || (filter_type == TYPE_6V_RIGHT ) || (filter_type == TYPE_6H_BOT )) begin
                    
                    y_offset <= (y - 1);
                end
            end
            8'h08:  // second stage of address calculation
            begin
                if((filter_type == TYPE_9 ) || (filter_type == TYPE_4_BL ) || (filter_type == TYPE_4_BR ) || 
                   (filter_type == TYPE_6V_LEFT ) || (filter_type == TYPE_6V_RIGHT ) || (filter_type == TYPE_6H_BOT )) begin
                   
                   mult <= {y_offset, 8'h00};
                end
            end
            8'h09:  // final stage of address calculation
            begin
                if((filter_type == TYPE_9 ) || (filter_type == TYPE_4_BL ) || (filter_type == TYPE_4_BR ) || 
                   (filter_type == TYPE_6V_LEFT ) || (filter_type == TYPE_6V_RIGHT ) || (filter_type == TYPE_6H_BOT )) begin
                    
                    addr <= x + mult;
                end
            end
            8'h0C:  // wait for 2 cycles to happen before getting the data
            begin
                if((filter_type == TYPE_9 ) || (filter_type == TYPE_4_BL ) || (filter_type == TYPE_4_BR ) || 
                   (filter_type == TYPE_6V_LEFT ) || (filter_type == TYPE_6V_RIGHT ) || (filter_type == TYPE_6H_BOT )) begin
                    if(divide_type == NINTH) begin
                        top <= i_pixel * FIFTY_SEVEN;
                    end
                    else if(divide_type == SIXTH) begin
                        top <= i_pixel * EIGHTY_FIVE;
                    end
                    else begin
                        top <= i_pixel;
                    end
                end
            end
            // Top right
            8'h0D:  // Start first stage of calculating for top right
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_BL) || (filter_type == TYPE_6H_BOT) || 
                   (filter_type == TYPE_6V_LEFT)) begin
                   
                   y_offset <= y - 1;
                   x_offset <= x + 1;
                end
            end
            8'h0E:  // second stage of address calculation
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_BL) || (filter_type == TYPE_6H_BOT) || 
                   (filter_type == TYPE_6V_LEFT)) begin
                
                    mult <= {y_offset, 8'h00};
                end
            end
            8'h0F:  // final stage of address calculation
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_BL) || (filter_type == TYPE_6H_BOT) || 
                   (filter_type == TYPE_6V_LEFT)) begin
                
                    addr <= x_offset + mult;
                end
            8'h12:  // wait for 2 cycles to happen before getting the data
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_BL) || (filter_type == TYPE_6H_BOT) || 
                   (filter_type == TYPE_6V_LEFT)) begin
                    
                    if(divide_type == NINTH) begin
                        topR <= i_pixel * FIFTY_SEVEN;
                    end
                    else if(divide_type == SIXTH) begin
                        topR <= i_pixel * EIGHTY_FIVE;
                    end
                    else begin
                        topR <= i_pixel;
                    end
                end
            end
            // Center left
            8'h13:  // Start first stage of calculating for left center
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_BL) || (filter_type == TYPE_4_BR) || 
                   (filter_type == TYPE_6V_RIGHT) || (filter_type == TYPE_6H_BOT)) begin
                   
                   x_offset <= x - 1;
                   mult <= {y, 8'h00};
                end
            end
            8'h14:  // final stage of address calculation
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_BL) || (filter_type == TYPE_4_BR) || 
                   (filter_type == TYPE_6V_RIGHT) || (filter_type == TYPE_6H_BOT)) begin
                   
                   addr <= x_offset + mult;
                end
            end
            8'h17:  // wait for 2 cycles to happen before getting the data
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_BL) || (filter_type == TYPE_4_BR) || 
                   (filter_type == TYPE_6V_RIGHT) || (filter_type == TYPE_6H_BOT)) begin
                   
                   if(divide_type == NINTH) begin
                        cenL <= i_pixel * FIFTY_SEVEN;
                    end
                    else if(divide_type == SIXTH) begin
                        cenL <= i_pixel * EIGHTY_FIVE;
                    end
                    else begin
                        cenL <= i_pixel;
                    end
                end
            end
            // Center
            8'h18:  // Start first stage of calculating for center
            begin
                mult <= {y, 8'h00};
            end
            8'h19:// final stage of address calculation
            begin
                addr <= x + mult;
            end
            8'h1C:
            begin
                if(divide_type == NINTH) begin
                    center <= i_pixel * FIFTY_SEVEN;
                end
                else if(divide_type == SIXTH) begin
                    center <= i_pixel * EIGHTY_FIVE;
                end
                else begin
                    center <= i_pixel;
                end
            
            end
            // Center right
            8'h1D:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_4_BL) || 
                   (filter_type == TYPE_6H_TOP) || (filter_type == TYPE_6V_LEFT) || (filter_type == TYPE_6H_BOT)) begin
                    
                   x_offset <= x + 1;
                   mult <= {y, 8'h00};
                end
            end
            8'h1E:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_4_BL) || 
                   (filter_type == TYPE_6H_TOP) || (filter_type == TYPE_6V_LEFT) || (filter_type == TYPE_6H_BOT)) begin
                   
                    addr <= x_offset + mult;  
                end
            end
            8'h21:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_4_BL) || 
                   (filter_type == TYPE_6H_TOP) || (filter_type == TYPE_6V_LEFT) || (filter_type == TYPE_6H_BOT)) begin
                    
                    if(divide_type == NINTH) begin
                        cenR <= i_pixel * FIFTY_SEVEN;
                    end
                    else if(divide_type == SIXTH) begin
                        cenR <= i_pixel * EIGHTY_FIVE;
                    end
                    else begin
                        cenR <= i_pixel;
                    end
                    
                end
            end
            // Bottom left
            8'h22:
            begin
                if((filter_type == TYPE_4_TR ) || (filter_type == TYPE_6V_RIGHT ) || (filter_type == TYPE_9 ) || 
                (filter_type == TYPE_6H_TOP )) begin
                
                    x_offset <= x - 1;
                    y_offset <= y + 1;
                end
            end
            8'h23:
            begin
                if((filter_type == TYPE_4_TR ) || (filter_type == TYPE_6V_RIGHT ) || (filter_type == TYPE_9 ) || 
                (filter_type == TYPE_6H_TOP )) begin
                
                    mult <= {y_offset, 8'h00};
                end
            end
            8'h24:
            begin
                if((filter_type == TYPE_4_TR ) || (filter_type == TYPE_6V_RIGHT ) || (filter_type == TYPE_9 ) || 
                (filter_type == TYPE_6H_TOP )) begin
                
                    addr <= x_offset + mult;
                end
            end
            8'h27:
            begin
                if((filter_type == TYPE_4_TR ) || (filter_type == TYPE_6V_RIGHT ) || (filter_type == TYPE_9 ) || 
                (filter_type == TYPE_6H_TOP )) begin
                    
                    if(divide_type == NINTH) begin
                        botL <= i_pixel * FIFTY_SEVEN;
                    end
                    else if(divide_type == SIXTH) begin
                        botL <= i_pixel * EIGHTY_FIVE;
                    end
                    else begin
                        botL <= i_pixel;
                    end
                end
            end
            // Bottom center
            8'h28:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_4_TR) || 
                   (filter_type == TYPE_6H_TOP) || (filter_type == TYPE_6V_LEFT) || (filter_type == TYPE_6V_RIGHT)) begin
                   
                   y_offset <= y + 1;
                end
            end
            8'h29:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_4_TR) || 
                   (filter_type == TYPE_6H_TOP) || (filter_type == TYPE_6V_LEFT) || (filter_type == TYPE_6V_RIGHT)) begin
                   
                   mult <= {y_offset, 8'h00};
                end
            end
            8'h2A:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_4_TR) || 
                   (filter_type == TYPE_6H_TOP) || (filter_type == TYPE_6V_LEFT) || (filter_type == TYPE_6V_RIGHT)) begin
                   
                   addr <= x_offset + mult;
                end
            end
            8'h2D:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_4_TR) || 
                   (filter_type == TYPE_6H_TOP) || (filter_type == TYPE_6V_LEFT) || (filter_type == TYPE_6V_RIGHT)) begin
                    
                    if(divide_type == NINTH) begin
                        bottom <= i_pixel * FIFTY_SEVEN;
                    end
                    else if(divide_type == SIXTH) begin
                        bottom <= i_pixel * EIGHTY_FIVE;
                    end
                    else begin
                        bottom <= i_pixel;
                    end
                end
            end
            // Bottom right
            8'h2B:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_6H_TOP) || 
                   (filter_type == TYPE_6V_LEFT)) begin
                   
                   x_offset <= x + 1;
                   y_offset <= y + 1;
                end
            end
            8'h2C:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_6H_TOP) || 
                   (filter_type == TYPE_6V_LEFT)) begin
                   
                   mult <= {y_offset, 8'h00};
                end        
            end
            8'h2E:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_6H_TOP) || 
                   (filter_type == TYPE_6V_LEFT)) begin
                   
                   addr <= x_offset + mult;
                end       
            end
            8'h31:
            begin
                if((filter_type == TYPE_9) || (filter_type == TYPE_4_TL) || (filter_type == TYPE_6H_TOP) || 
                   (filter_type == TYPE_6V_LEFT)) begin
                   
                    if(divide_type == NINTH) begin
                        botR <= i_pixel * FIFTY_SEVEN;
                    end
                    else if(divide_type == SIXTH) begin
                        botR <= i_pixel * EIGHTY_FIVE;
                    end
                    else begin
                        botR <= i_pixel;
                    end
                    
                end        
            end
            8'h32:  // Adding the weighted pixels
                case(filter_type)
                TYPE_4_TL:
                begin
                    accum <= center + cenR + bottom + botR;
                end
                TYPE_4_TR:
                begin
                    accum <= center + cenL + botL + bottom;
                end
                TYPE_4_BL:
                begin
                    accum <= center + top + topR + cenR;
                end
                TYPE_4_BR:
                begin
                    accum <= center + topL + top + cenL;
                end
                TYPE_9:
                begin
                    accum <= center + topL + top + topR + cenL + cenR + botL + bottom + botR;
                end
                TYPE_6H_TOP:
                begin
                    accum <= center + cenL + cenR + botL + bottom + botR;
                end
                TYPE_6H_BOT:
                begin
                    accum <= center + cenL + cenR + topL + top + topR;
                end
                TYPE_6V_LEFT:
                begin
                    accum <= center + top + topR + cenR + bottom + botR;
                end
                TYPE_6V_RIGHT:
                begin
                    accum <= center + top + topL + cenL + bottom + botL;
                end
                default:
                begin
                    accum <= accum + 1;
                end
                endcase
            8'h33:  // Dividing the weighted sum
            begin
                if(divide_type == FOURTH) begin
                    accum <= (accum >> 2);  // divide by 4
                end
                else begin
                    accum <= (accum >> 9);  // divide by 512
                    // This is because for full kernel (9 pixels) I am using 57/512 for better presicion
                    // and for edge kernel (6 pixels) I am using 85/512 for better precision
                end
            end
            8'h34:  // First stage of calculating the address to save
            begin
                mult <= {y, 8'h00};
            end
            8'h35:  // Final stage of calculating the address to save, and setting up the output byte
            begin
                addr <= x + mult;
                output_byte <= accum[7:0];
                we <= WRITE;            // also enable writing
            end
            8'h39:  // Ensure we don't corrupt the data
            begin
                we <= READ;
            end
            default:
            begin
            end
            endcase
        end
    end
endmodule
