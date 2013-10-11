// (C) 2001-2012 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/12.0sp2/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2012/06/21 $
// $Author: swbranch $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module nios_system_addr_router_001_default_decode
  #(
     parameter DEFAULT_CHANNEL = 1,
               DEFAULT_DESTID = 1 
   )
  (output [96 - 92 : 0] default_destination_id,
   output [26-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[96 - 92 : 0];
  generate begin : default_decode
    if (DEFAULT_CHANNEL == -1)
      assign default_src_channel = '0;
    else
      assign default_src_channel = 26'b1 << DEFAULT_CHANNEL;
  end endgenerate

endmodule


module nios_system_addr_router_001
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [107-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [107-1    : 0] src_data,
    output reg [26-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 67;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 96;
    localparam PKT_DEST_ID_L = 92;
    localparam ST_DATA_W = 107;
    localparam ST_CHANNEL_W = 26;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 70;
    localparam PKT_TRANS_READ  = 71;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;




    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(32'h3000 - 32'h2800);
    localparam PAD1 = log2ceil(32'h3400 - 32'h3000);
    localparam PAD2 = log2ceil(32'h3420 - 32'h3400);
    localparam PAD3 = log2ceil(32'h3440 - 32'h3420);
    localparam PAD4 = log2ceil(32'h3450 - 32'h3440);
    localparam PAD5 = log2ceil(32'h3460 - 32'h3450);
    localparam PAD6 = log2ceil(32'h3470 - 32'h3460);
    localparam PAD7 = log2ceil(32'h3480 - 32'h3470);
    localparam PAD8 = log2ceil(32'h3490 - 32'h3480);
    localparam PAD9 = log2ceil(32'h34a0 - 32'h3490);
    localparam PAD10 = log2ceil(32'h34b0 - 32'h34a0);
    localparam PAD11 = log2ceil(32'h34c0 - 32'h34b0);
    localparam PAD12 = log2ceil(32'h34d0 - 32'h34c0);
    localparam PAD13 = log2ceil(32'h34e0 - 32'h34d0);
    localparam PAD14 = log2ceil(32'h34f0 - 32'h34e0);
    localparam PAD15 = log2ceil(32'h3500 - 32'h34f0);
    localparam PAD16 = log2ceil(32'h3510 - 32'h3500);
    localparam PAD17 = log2ceil(32'h3520 - 32'h3510);
    localparam PAD18 = log2ceil(32'h3530 - 32'h3520);
    localparam PAD19 = log2ceil(32'h3538 - 32'h3530);
    localparam PAD20 = log2ceil(32'h3540 - 32'h3538);
    localparam PAD21 = log2ceil(32'h3548 - 32'h3540);
    localparam PAD22 = log2ceil(32'h354a - 32'h3548);
    localparam PAD23 = log2ceil(32'h42000 - 32'h40000);
    localparam PAD24 = log2ceil(32'h180000 - 32'h100000);
    localparam PAD25 = log2ceil(32'h1800000 - 32'h1000000);

    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 32'h1800000;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;
    localparam RG = RANGE_ADDR_WIDTH-1;

      wire [PKT_ADDR_W-1 : 0] address = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;

    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [26-1 : 0] default_src_channel;




    nios_system_addr_router_001_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_src_channel (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;

        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;
        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

        // ( 0x2800 .. 0x3000 )
        if ( {address[RG:PAD0],{PAD0{1'b0}}} == 'h2800 ) begin
            src_channel = 26'b00000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
        end

        // ( 0x3000 .. 0x3400 )
        if ( {address[RG:PAD1],{PAD1{1'b0}}} == 'h3000 ) begin
            src_channel = 26'b00000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
        end

        // ( 0x3400 .. 0x3420 )
        if ( {address[RG:PAD2],{PAD2{1'b0}}} == 'h3400 ) begin
            src_channel = 26'b00001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
        end

        // ( 0x3420 .. 0x3440 )
        if ( {address[RG:PAD3],{PAD3{1'b0}}} == 'h3420 ) begin
            src_channel = 26'b00010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
        end

        // ( 0x3440 .. 0x3450 )
        if ( {address[RG:PAD4],{PAD4{1'b0}}} == 'h3440 ) begin
            src_channel = 26'b00000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
        end

        // ( 0x3450 .. 0x3460 )
        if ( {address[RG:PAD5],{PAD5{1'b0}}} == 'h3450 ) begin
            src_channel = 26'b00000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
        end

        // ( 0x3460 .. 0x3470 )
        if ( {address[RG:PAD6],{PAD6{1'b0}}} == 'h3460 ) begin
            src_channel = 26'b00000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
        end

        // ( 0x3470 .. 0x3480 )
        if ( {address[RG:PAD7],{PAD7{1'b0}}} == 'h3470 ) begin
            src_channel = 26'b00000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
        end

        // ( 0x3480 .. 0x3490 )
        if ( {address[RG:PAD8],{PAD8{1'b0}}} == 'h3480 ) begin
            src_channel = 26'b00000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
        end

        // ( 0x3490 .. 0x34a0 )
        if ( {address[RG:PAD9],{PAD9{1'b0}}} == 'h3490 ) begin
            src_channel = 26'b00000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
        end

        // ( 0x34a0 .. 0x34b0 )
        if ( {address[RG:PAD10],{PAD10{1'b0}}} == 'h34a0 ) begin
            src_channel = 26'b00000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
        end

        // ( 0x34b0 .. 0x34c0 )
        if ( {address[RG:PAD11],{PAD11{1'b0}}} == 'h34b0 ) begin
            src_channel = 26'b00000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
        end

        // ( 0x34c0 .. 0x34d0 )
        if ( {address[RG:PAD12],{PAD12{1'b0}}} == 'h34c0 ) begin
            src_channel = 26'b00000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
        end

        // ( 0x34d0 .. 0x34e0 )
        if ( {address[RG:PAD13],{PAD13{1'b0}}} == 'h34d0 ) begin
            src_channel = 26'b00000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
        end

        // ( 0x34e0 .. 0x34f0 )
        if ( {address[RG:PAD14],{PAD14{1'b0}}} == 'h34e0 ) begin
            src_channel = 26'b00000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
        end

        // ( 0x34f0 .. 0x3500 )
        if ( {address[RG:PAD15],{PAD15{1'b0}}} == 'h34f0 ) begin
            src_channel = 26'b00000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
        end

        // ( 0x3500 .. 0x3510 )
        if ( {address[RG:PAD16],{PAD16{1'b0}}} == 'h3500 ) begin
            src_channel = 26'b00000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
        end

        // ( 0x3510 .. 0x3520 )
        if ( {address[RG:PAD17],{PAD17{1'b0}}} == 'h3510 ) begin
            src_channel = 26'b01000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
        end

        // ( 0x3520 .. 0x3530 )
        if ( {address[RG:PAD18],{PAD18{1'b0}}} == 'h3520 ) begin
            src_channel = 26'b10000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
        end

        // ( 0x3530 .. 0x3538 )
        if ( {address[RG:PAD19],{PAD19{1'b0}}} == 'h3530 ) begin
            src_channel = 26'b00000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
        end

        // ( 0x3538 .. 0x3540 )
        if ( {address[RG:PAD20],{PAD20{1'b0}}} == 'h3538 ) begin
            src_channel = 26'b00000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
        end

        // ( 0x3540 .. 0x3548 )
        if ( {address[RG:PAD21],{PAD21{1'b0}}} == 'h3540 ) begin
            src_channel = 26'b00100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
        end

        // ( 0x3548 .. 0x354a )
        if ( {address[RG:PAD22],{PAD22{1'b0}}} == 'h3548 ) begin
            src_channel = 26'b00000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
        end

        // ( 0x40000 .. 0x42000 )
        if ( {address[RG:PAD23],{PAD23{1'b0}}} == 'h40000 ) begin
            src_channel = 26'b00000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
        end

        // ( 0x100000 .. 0x180000 )
        if ( {address[RG:PAD24],{PAD24{1'b0}}} == 'h100000 ) begin
            src_channel = 26'b00000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
        end

        // ( 0x1000000 .. 0x1800000 )
        if ( {address[RG:PAD25],{PAD25{1'b0}}} == 'h1000000 ) begin
            src_channel = 26'b00000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
        end
    end

    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[63:0] val;
        reg [63:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


