/******************************************************************************
 * License Agreement                                                          *
 *                                                                            *
 * Copyright (c) 1991-2012 Altera Corporation, San Jose, California, USA.     *
 * All rights reserved.                                                       *
 *                                                                            *
 * Any megafunction design, and related net list (encrypted or decrypted),    *
 *  support information, device programming or simulation file, and any other *
 *  associated documentation or information provided by Altera or a partner   *
 *  under Altera's Megafunction Partnership Program may be used only to       *
 *  program PLD devices (but not masked PLD devices) from Altera.  Any other  *
 *  use of such megafunction design, net list, support information, device    *
 *  programming or simulation file, or any other related documentation or     *
 *  information is prohibited for any other purpose, including, but not       *
 *  limited to modification, reverse engineering, de-compiling, or use with   *
 *  any other silicon devices, unless such use is explicitly licensed under   *
 *  a separate agreement with Altera or a megafunction partner.  Title to     *
 *  the intellectual property, including patents, copyrights, trademarks,     *
 *  trade secrets, or maskworks, embodied in any such megafunction design,    *
 *  net list, support information, device programming or simulation file, or  *
 *  any other related documentation or information provided by Altera or a    *
 *  megafunction partner, remains with Altera, the megafunction partner, or   *
 *  their respective licensors.  No other licenses, including any licenses    *
 *  needed under any third party's intellectual property, are provided herein.*
 *  Copying or modifying any file, or portion thereof, to which this notice   *
 *  is attached violates this copyright.                                      *
 *                                                                            *
 * THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    *
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *
 * FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  *
 * IN THIS FILE.                                                              *
 *                                                                            *
 * This agreement shall be governed in all respects by the laws of the State  *
 *  of California and by the laws of the United States of America.            *
 *                                                                            *
 ******************************************************************************/

/******************************************************************************
 *                                                                            *
 * This module reads and writes data to the Audio chip on Altera's DE2        *
 *  Development and Education Board. The audio chip must be in master mode    *
 *  and the digital format must be left justified.                            *
 *                                                                            *
 ******************************************************************************/

module nios_system_audio (
	// Inputs
	clk,
	reset,
	
	address,
	chipselect,
	read,
	write,
	writedata,

	AUD_ADCDAT,

	// Bidirectionals
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,

	// Outputs
	irq,
	readdata,

	AUD_DACDAT
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input						clk;
input						reset;

input			[ 1: 0]	address;
input						chipselect;
input						read;
input						write;
input			[31: 0]	writedata;

input						AUD_BCLK;
input						AUD_DACLRCK;

// Bidirectionals

// Outputs
output reg				irq;
output reg	[31: 0]	readdata;

output					AUD_DACDAT;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

localparam DW						= 15;
localparam BIT_COUNTER_INIT	= 5'd15;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire						bclk_rising_edge;
wire						bclk_falling_edge;

wire						dac_lrclk_rising_edge;
wire						dac_lrclk_falling_edge;

wire			[ 7: 0]	left_channel_write_space;
wire			[ 7: 0]	right_channel_write_space;

// Internal Registers
reg						done_dac_channel_sync;
reg						write_interrupt_en;
reg						clear_write_fifos;
reg						write_interrupt;

// State Machine Registers


/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset == 1'b1)
		irq <= 1'b0;
	else
		irq <= 
			write_interrupt |
			1'b0;
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		readdata <= 32'h00000000;
	else if (chipselect == 1'b1)
	begin
		if (address == 2'h0)
			readdata <= 
				{22'h000000,
				 write_interrupt,
				1'b0,
				 4'h0,
				 clear_write_fifos,
				1'b0,
				 write_interrupt_en,
				1'b0};
		else if (address == 2'h1)
		begin
			readdata[31:24] <= left_channel_write_space;
			readdata[23:16] <= right_channel_write_space;
			readdata[15: 8] <= 8'h00;
			readdata[ 7: 0] <= 8'h00;
		end
		else
			readdata <= 32'h00000000;
	end
end



always @(posedge clk)
begin
	if (reset == 1'b1)
		write_interrupt_en <= 1'b0;
	else if ((chipselect == 1'b1) && (write == 1'b1) && (address == 2'h0))
		write_interrupt_en <= writedata[1];
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		clear_write_fifos <= 1'b0;
	else if ((chipselect == 1'b1) && (write == 1'b1) && (address == 2'h0))
		clear_write_fifos <= writedata[3];
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		write_interrupt <= 1'b0;
	else if (write_interrupt_en == 1'b0)
		write_interrupt <= 1'b0;
	else
		write_interrupt <= 
			(&(left_channel_write_space[6:5])  | left_channel_write_space[7]) | 
			(&(right_channel_write_space[6:5]) | right_channel_write_space[7]);
end


always @(posedge clk)
begin
	if (reset == 1'b1)
		done_dac_channel_sync <= 1'b0;
	else if (dac_lrclk_falling_edge == 1'b1)
		done_dac_channel_sync <= 1'b1;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_clock_edge Bit_Clock_Edges (
	// Inputs
	.clk				(clk),
	.reset			(reset),
	
	.test_clk		(AUD_BCLK),
	
	// Bidirectionals

	// Outputs
	.rising_edge	(bclk_rising_edge),
	.falling_edge	(bclk_falling_edge)
);


altera_up_clock_edge DAC_Left_Right_Clock_Edges (
	// Inputs
	.clk				(clk),
	.reset			(reset),
	
	.test_clk		(AUD_DACLRCK),
	
	// Bidirectionals

	// Outputs
	.rising_edge	(dac_lrclk_rising_edge),
	.falling_edge	(dac_lrclk_falling_edge)
);


altera_up_audio_out_serializer Audio_Out_Serializer (
	// Inputs
	.clk										(clk),
	.reset									(reset | clear_write_fifos),
	
	.bit_clk_rising_edge					(bclk_rising_edge),
	.bit_clk_falling_edge				(bclk_falling_edge),
	.left_right_clk_rising_edge		(done_dac_channel_sync & dac_lrclk_rising_edge),
	.left_right_clk_falling_edge		(done_dac_channel_sync & dac_lrclk_falling_edge),
	
	.left_channel_data					(writedata[DW:0]),
	.left_channel_data_en				((address == 2'h2) & chipselect & write),

	.right_channel_data					(writedata[DW:0]),
	.right_channel_data_en				((address == 2'h3) & chipselect & write),
	
	// Bidirectionals

	// Outputs
	.left_channel_fifo_write_space	(left_channel_write_space),
	.right_channel_fifo_write_space	(right_channel_write_space),

	.serial_audio_out_data				(AUD_DACDAT)
);
defparam
	Audio_Out_Serializer.DW = DW;

endmodule

