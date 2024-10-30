

module ps2 (
input clk,
input rst,
input PS2Clk,
input PS2Data,
output [3:0] count,
output data_valid,
output debug_data,
output debug_clk,
output [7:0] leds,
output valid_number,
output o_parity,
output o_parity_cx
);



parameter IDLE = 2'h0;
parameter RECEIVING = 2'h1;
parameter ERROR = 2'h2;

parameter ZERO      = 8'h45;
parameter ONE       = 8'h16;
parameter TWO       = 8'h1E;
parameter THREE     = 8'h26;
parameter FOUR      = 8'h25;
parameter FIVE      = 8'h2E;
parameter SIX       = 8'h36;
parameter SEVEN     = 8'h3D;
parameter EIGHT     = 8'h3E;
parameter NINE      = 8'h46;
parameter ENTER     = 8'h5A;

reg [3:0] bit_count;
reg [3:0] count_buffer;
reg prev_clk, pres_clk, clk_neg_edge;
reg prev_data, pres_data;
reg [1:0] state;
reg [7:0] data_byte;
reg byte_valid;
reg parity, parity_calc;

reg debug_data_out;
reg debug_clk_out;

reg [7:0]led_data;
reg num_valid;

assign o_parity = parity;
assign o_parity_cx = parity_calc;

assign valid_number = num_valid;
assign leds = led_data;

assign data_valid = byte_valid;
assign count = count_buffer;
assign debug_data = debug_data_out;
assign debug_clk = debug_clk_out;

always @(posedge clk) begin
    debug_data_out <= PS2Data;  // Mirror the PS2 signals out to pins
    debug_clk_out  <= PS2Clk;   
end 

// Keep track of PS2 clk so that I can tell where its negative edge is
always @(posedge clk) begin
    if (rst == 1'b1) begin
        prev_clk <= 1'b0;
        pres_clk <= 1'b0;
        clk_neg_edge <= 1'b0;
    end
    else begin
        prev_clk <= pres_clk;
        pres_clk <= PS2Clk;
        
        clk_neg_edge <= prev_clk & ~pres_clk;   // negative edge is valud when the previous PS2CLK was positive and the new PS2CLK is negative
    end
end

always @(posedge clk) begin
    if(rst == 1'b1) begin       // When in reset, we reset all the variables
        state <= IDLE;          // then we move into the state machine
        bit_count <= 4'h1;      
        data_byte <= 8'h00;
        byte_valid <= 1'b0;
        parity <= 1'b0;
        parity_calc <= 1'b0;
        count_buffer <= 4'h0;
        led_data <= 8'h00;
        num_valid <= 1'b0;
    end
    else begin
        case(state)
            IDLE: begin                     
                if(PS2Data == 1'b0 && clk_neg_edge == 1'b1) begin       // When the first byte comes, we expect the start bit to happen on the first neg_edge
                    state <= RECEIVING;                                 // When we receive the valid byte, we set the next STATE to be RECEIVING so we can 
                    byte_valid <= 1'b0;                                 // process the input
                end
                
                case(data_byte)                                         // At the same time, if we're idle, then we're just going to keep our count of what the
                    ZERO: begin                                         // data currently holds
                        count_buffer <= 4'h0;
                        num_valid <= 1'b1;
                    end
                    ONE: begin
                        count_buffer <= 4'h1;
                        num_valid <= 1'b1;
                    end
                    TWO: begin
                        count_buffer <= 4'h2;
                        num_valid <= 1'b1;
                    end
                    THREE: begin
                        count_buffer <= 4'h3;
                        num_valid <= 1'b1;
                    end
                    FOUR: begin
                        count_buffer <= 4'h4;
                        num_valid <= 1'b1;
                    end
                    FIVE: begin
                        count_buffer <= 4'h5;
                        num_valid <= 1'b1;
                    end
                    SIX: begin
                        count_buffer <= 4'h6;
                        num_valid <= 1'b1;
                    end
                    SEVEN: begin
                        count_buffer <= 4'h7;
                        num_valid <= 1'b1;
                    end
                    EIGHT: begin
                        count_buffer <= 4'h8;
                        num_valid <= 1'b1;
                    end
                    NINE: begin
                        count_buffer <= 4'h9;
                        num_valid <= 1'b1;
                    end
                    ENTER: begin
                        count_buffer <= 4'hA;
                        num_valid <= 1'b1;
                    end
                    default: begin
                        count_buffer <= 4'h0;
                        num_valid <= 1'b0;
                    end
                
                endcase
                end
            RECEIVING: begin                         // If we are receiving, then we are processing the inputs
                if(clk_neg_edge == 1'b1) begin       // but we always process the input at the neg-edge of the clock
                    
                    if(bit_count == 4'hA) begin      // if we are at the 10th bit, then the data is the parity    // the next state will be set to id
                        state <= IDLE;               // NOTE that I'm not counting the START bit as a bit, therefore I'm only counting to 10 bits
                        bit_count <= 4'h1;
                        if(parity == parity_calc) begin     // Check that the parity bit matches the actual parity
                            byte_valid <= 1'b1;
                        end
                        else begin
                            byte_valid <= 1'b0;
                        end
                    end
                 
                    else begin
                         bit_count <= bit_count + 1;     // Otherwise (if the bit count < 10), then increment the bit_count
                        if(bit_count < 4'h9) begin      // If the bit_count is less than 9
                             data_byte[bit_count - 1] <= PS2Data;     // then add the bit to the data_byte (LSB first)
                        end
                        else if(bit_count == 9) begin   // If the bit_count is 9, then we're looking at the parity bit
                             parity <= PS2Data;          // we save the parity bit
                             parity_calc <= ~(^data_byte[7:0]);  // we calculate the parity
                             led_data <= data_byte;
                        end
                    end
                end
            end
            default:
                state <= IDLE;
        endcase
    end
end

endmodule