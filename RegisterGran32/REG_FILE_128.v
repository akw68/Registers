/*******************************************************************************
#                        NORTH CAROLINA STATE UNIVERSITY
#
#                               FabScalar Project
#
# FabScalar Copyright (c) 2007-2011 by Niket K. Choudhary, Salil Wadhavkar,
# and Eric Rotenberg.  All Rights Reserved.
#
# This is a beta-release version.  It must not be redistributed at this time.
#
# Purpose: 
# Author:  FabGen
*******************************************************************************/

`timescale 1ns/100ps

module REG_FILE_128(
	clk,
	reset,

	addr0_i,
	addr1_i,
	addr2_i,
	addr3_i,
	addr4_i,
	addr5_i,
	addr6_i,
	addr7_i,
	addr8_i,
	addr9_i,
	addr10_i,
	addr11_i,
	addr0wr_i,
	addr1wr_i,
	addr2wr_i,
	addr3wr_i,
	addr4wr_i,
	addr5wr_i,
	we0_i,
	we1_i,
	we2_i,
	we3_i,
	we4_i,
	we5_i,
	data0wr_i,
	data1wr_i,
	data2wr_i,
	data3wr_i,
	data4wr_i,
	data5wr_i,

decoded_addr0_o,
decoded_addr1_o,
decoded_addr2_o,
decoded_addr3_o,
decoded_addr4_o,
decoded_addr5_o,
decoded_addr6_o,
decoded_addr7_o,
decoded_addr8_o,
decoded_addr9_o,
decoded_addr10_o,
decoded_addr11_o,
decoded_addr0wr_o,
we0_o,
decoded_addr1wr_o,
we1_o,
decoded_addr2wr_o,
we2_o,
decoded_addr3wr_o,
we3_o,
decoded_addr4wr_o,
we4_o,
decoded_addr5wr_o,
we5_o,
	data0_o,
	data1_o,
	data2_o,
	data3_o,
	data4_o,
	data5_o,
	data6_o,
	data7_o,
	data8_o,
	data9_o,
	data10_o,
	data11_o
);


/* Parameters */
parameter SRAM_DEPTH = 128;
parameter SRAM_INDEX = 7;
parameter SRAM_WIDTH = 32;

input clk;
input reset;
/* The SRAM reg */
	input [SRAM_INDEX-1:0] addr0_i;
	input [SRAM_INDEX-1:0] addr1_i;
	input [SRAM_INDEX-1:0] addr2_i;
	input [SRAM_INDEX-1:0] addr3_i;
	input [SRAM_INDEX-1:0] addr4_i;
	input [SRAM_INDEX-1:0] addr5_i;
	input [SRAM_INDEX-1:0] addr6_i;
	input [SRAM_INDEX-1:0] addr7_i;
	input [SRAM_INDEX-1:0] addr8_i;
	input [SRAM_INDEX-1:0] addr9_i;
	input [SRAM_INDEX-1:0] addr10_i;
	input [SRAM_INDEX-1:0] addr11_i;
	input [SRAM_INDEX-1:0] addr0wr_i;
	input [SRAM_INDEX-1:0] addr1wr_i;
	input [SRAM_INDEX-1:0] addr2wr_i;
	input [SRAM_INDEX-1:0] addr3wr_i;
	input [SRAM_INDEX-1:0] addr4wr_i;
	input [SRAM_INDEX-1:0] addr5wr_i;
	input we0_i;
	input we1_i;
	input we2_i;
	input we3_i;
	input we4_i;
	input we5_i;
	input [SRAM_WIDTH-1:0] data0wr_i;
	input [SRAM_WIDTH-1:0] data1wr_i;
	input [SRAM_WIDTH-1:0] data2wr_i;
	input [SRAM_WIDTH-1:0] data3wr_i;
	input [SRAM_WIDTH-1:0] data4wr_i;
	input [SRAM_WIDTH-1:0] data5wr_i;

output [SRAM_DEPTH-1:0] decoded_addr0_o;
output [SRAM_DEPTH-1:0] decoded_addr1_o;
output [SRAM_DEPTH-1:0] decoded_addr2_o;
output [SRAM_DEPTH-1:0] decoded_addr3_o;
output [SRAM_DEPTH-1:0] decoded_addr4_o;
output [SRAM_DEPTH-1:0] decoded_addr5_o;
output [SRAM_DEPTH-1:0] decoded_addr6_o;
output [SRAM_DEPTH-1:0] decoded_addr7_o;
output [SRAM_DEPTH-1:0] decoded_addr8_o;
output [SRAM_DEPTH-1:0] decoded_addr9_o;
output [SRAM_DEPTH-1:0] decoded_addr10_o;
output [SRAM_DEPTH-1:0] decoded_addr11_o;
output [SRAM_DEPTH-1:0] decoded_addr0wr_o;
output we0_o;
output [SRAM_DEPTH-1:0] decoded_addr1wr_o;
output we1_o;
output [SRAM_DEPTH-1:0] decoded_addr2wr_o;
output we2_o;
output [SRAM_DEPTH-1:0] decoded_addr3wr_o;
output we3_o;
output [SRAM_DEPTH-1:0] decoded_addr4wr_o;
output we4_o;
output [SRAM_DEPTH-1:0] decoded_addr5wr_o;
output we5_o;
	output [SRAM_WIDTH-1:0] data0_o;
	output [SRAM_WIDTH-1:0] data1_o;
	output [SRAM_WIDTH-1:0] data2_o;
	output [SRAM_WIDTH-1:0] data3_o;
	output [SRAM_WIDTH-1:0] data4_o;
	output [SRAM_WIDTH-1:0] data5_o;
	output [SRAM_WIDTH-1:0] data6_o;
	output [SRAM_WIDTH-1:0] data7_o;
	output [SRAM_WIDTH-1:0] data8_o;
	output [SRAM_WIDTH-1:0] data9_o;
	output [SRAM_WIDTH-1:0] data10_o;
	output [SRAM_WIDTH-1:0] data11_o;



 wire we0_0_i;
 wire we0_1_i;
 wire we0_2_i;
 wire we0_3_i;
 wire we0_4_i;
 wire we0_5_i;
 
 wire we1_0_i;
 wire we1_1_i;
 wire we1_2_i;
 wire we1_3_i;
 wire we1_4_i;
 wire we1_5_i;

 wire [SRAM_WIDTH-1:0]                     data0_0; 
 wire [SRAM_WIDTH-1:0]                     data0_1;
 wire [SRAM_WIDTH-1:0]                     data0_2;
 wire [SRAM_WIDTH-1:0]                     data0_3;
 wire [SRAM_WIDTH-1:0]                     data0_4;
 wire [SRAM_WIDTH-1:0]                     data0_5;
 wire [SRAM_WIDTH-1:0]                     data0_6;
 wire [SRAM_WIDTH-1:0]                     data0_7;
 wire [SRAM_WIDTH-1:0]                     data0_8;
 wire [SRAM_WIDTH-1:0]                     data0_9;
 wire [SRAM_WIDTH-1:0]                     data0_10;
 wire [SRAM_WIDTH-1:0]                     data0_11;
 
 wire [SRAM_WIDTH-1:0]                     data1_0;
 wire [SRAM_WIDTH-1:0]                     data1_1;
 wire [SRAM_WIDTH-1:0]                     data1_2;
 wire [SRAM_WIDTH-1:0]                     data1_3;
 wire [SRAM_WIDTH-1:0]                     data1_4;
 wire [SRAM_WIDTH-1:0]                     data1_5;
 wire [SRAM_WIDTH-1:0]                     data1_6;
 wire [SRAM_WIDTH-1:0]                     data1_7;
 wire [SRAM_WIDTH-1:0]                     data1_8;
 wire [SRAM_WIDTH-1:0]                     data1_9;
 wire [SRAM_WIDTH-1:0]                     data1_10;
 wire [SRAM_WIDTH-1:0]                     data1_11;
 
 
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_0;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_1;
 wire [SRAM_DEPTH/2-1:0] 					 decoded_addr0_2;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_3;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_4;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_5;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_6;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_7;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_8;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_9;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_10;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_11;
 
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_0;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_1;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_2;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_3;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_4;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_5;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_6;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_7;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_8;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_9;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_10;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_11;
 
 
 
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_0wr;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_1wr;
 wire [SRAM_DEPTH/2-1:0] 					 decoded_addr0_2wr;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_3wr;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_4wr;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr0_5wr;
 
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_0wr;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_1wr;
 wire [SRAM_DEPTH/2-1:0] 					 decoded_addr1_2wr;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_3wr;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_4wr;
 wire [SRAM_DEPTH/2-1:0]					 decoded_addr1_5wr;
 
 
 //******************************************************************
 
 wire [SRAM_DEPTH-1:0]					 padded_addr0_0;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_1;
 wire [SRAM_DEPTH-1:0] 					 padded_addr0_2;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_3;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_4;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_5;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_6;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_7;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_8;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_9;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_10;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_11;
 
 wire [SRAM_DEPTH-1:0]					 padded_addr1_0;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_1;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_2;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_3;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_4;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_5;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_6;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_7;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_8;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_9;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_10;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_11;
 
 
 //************************************************************************
 
 wire [SRAM_DEPTH-1:0]					 padded_addr0_0wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_1wr;
 wire [SRAM_DEPTH-1:0] 					 padded_addr0_2wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_3wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_4wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr0_5wr;
 
 wire [SRAM_DEPTH-1:0]					 padded_addr1_0wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_1wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_2wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_3wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_4wr;
 wire [SRAM_DEPTH-1:0]					 padded_addr1_5wr;
 
 //************************************************************************
 
//****************WRITE ENABLE ASSIGNMENT STATEMENTS********************************
assign we0_0_i = (we0_i & ~addr0wr_i[SRAM_INDEX-1]);
assign we0_1_i = (we1_i & ~addr1wr_i[SRAM_INDEX-1]);
assign we0_2_i = (we2_i & ~addr2wr_i[SRAM_INDEX-1]);
assign we0_3_i = (we3_i & ~addr3wr_i[SRAM_INDEX-1]);
assign we0_4_i = (we4_i & ~addr4wr_i[SRAM_INDEX-1]);
assign we0_5_i = (we5_i & ~addr5wr_i[SRAM_INDEX-1]);

assign we1_0_i = (we0_i & addr0wr_i[SRAM_INDEX-1]);
assign we1_1_i = (we1_i & addr1wr_i[SRAM_INDEX-1]);
assign we1_2_i = (we2_i & addr2wr_i[SRAM_INDEX-1]);
assign we1_3_i = (we3_i & addr3wr_i[SRAM_INDEX-1]);
assign we1_4_i = (we4_i & addr4wr_i[SRAM_INDEX-1]);
assign we1_5_i = (we5_i & addr5wr_i[SRAM_INDEX-1]);



assign we0_o = we0_i;
assign we1_o = we1_i;
assign we2_o = we2_i;
assign we3_o = we3_i;
assign we4_o = we4_i;
assign we5_o = we5_i;

 
 
//**********************MUXES FOR REGISTER READ DATA OUTPUTS***********************
assign data0_o = addr0_i[SRAM_INDEX-1] ? data1_0 : data0_0;
assign data1_o = addr1_i[SRAM_INDEX-1] ? data1_1 : data0_1;
assign data2_o = addr2_i[SRAM_INDEX-1] ? data1_2 : data0_2;
assign data3_o = addr3_i[SRAM_INDEX-1] ? data1_3 : data0_3;
assign data4_o = addr4_i[SRAM_INDEX-1] ? data1_4 : data0_4;
assign data5_o = addr5_i[SRAM_INDEX-1] ? data1_5 : data0_5;
assign data6_o = addr6_i[SRAM_INDEX-1] ? data1_6 : data0_6;
assign data7_o = addr7_i[SRAM_INDEX-1] ? data1_7 : data0_7;
assign data8_o = addr8_i[SRAM_INDEX-1] ? data1_8 : data0_8;
assign data9_o = addr9_i[SRAM_INDEX-1] ? data1_9 : data0_9;
assign data10_o = addr10_i[SRAM_INDEX-1] ? data1_10 : data0_10;
assign data11_o = addr11_i[SRAM_INDEX-1] ? data1_11 : data0_11;



//********************PADDED DECODED ADDRESS****************************************
assign padded_addr1_0 = {decoded_addr1_0, 64'b0};
assign padded_addr1_1 = {decoded_addr1_1, 64'b0};
assign padded_addr1_2 = {decoded_addr1_2, 64'b0};
assign padded_addr1_3 = {decoded_addr1_3, 64'b0};
assign padded_addr1_4 = {decoded_addr1_4, 64'b0};
assign padded_addr1_5 = {decoded_addr1_5, 64'b0};
assign padded_addr1_6 = {decoded_addr1_6, 64'b0};
assign padded_addr1_7 = {decoded_addr1_7, 64'b0};
assign padded_addr1_8 = {decoded_addr1_8, 64'b0};
assign padded_addr1_9 = {decoded_addr1_9, 64'b0};
assign padded_addr1_10 = {decoded_addr1_10, 64'b0};
assign padded_addr1_11 = {decoded_addr1_11, 64'b0};



assign padded_addr0_0 = {64'b0, decoded_addr0_0};
assign padded_addr0_1 = {64'b0, decoded_addr0_1};
assign padded_addr0_2 = {64'b0, decoded_addr0_2};
assign padded_addr0_3 = {64'b0, decoded_addr0_3};
assign padded_addr0_4 = {64'b0, decoded_addr0_4};
assign padded_addr0_5 = {64'b0, decoded_addr0_5};
assign padded_addr0_6 = {64'b0, decoded_addr0_6};
assign padded_addr0_7 = {64'b0, decoded_addr0_7};
assign padded_addr0_8 = {64'b0, decoded_addr0_8};
assign padded_addr0_9 = {64'b0, decoded_addr0_9};
assign padded_addr0_10 = {64'b0, decoded_addr0_10};
assign padded_addr0_11 = {64'b0, decoded_addr0_11};

//*******************PADDED DECODED WRITE ADDRESSES******************************
assign padded_addr1_0wr = {decoded_addr1_0wr, 64'b0};
assign padded_addr1_1wr = {decoded_addr1_1wr, 64'b0};
assign padded_addr1_2wr = {decoded_addr1_2wr, 64'b0};
assign padded_addr1_3wr = {decoded_addr1_3wr, 64'b0};
assign padded_addr1_4wr = {decoded_addr1_4wr, 64'b0};
assign padded_addr1_5wr = {decoded_addr1_5wr, 64'b0};


assign padded_addr0_0wr = {64'b0, decoded_addr0_0wr};
assign padded_addr0_1wr = {64'b0, decoded_addr0_1wr};
assign padded_addr0_2wr = {64'b0, decoded_addr0_2wr};
assign padded_addr0_3wr = {64'b0, decoded_addr0_3wr};
assign padded_addr0_4wr = {64'b0, decoded_addr0_4wr};
assign padded_addr0_5wr = {64'b0, decoded_addr0_5wr};



//******************MUXES FOR DECODED ADDRESS OUTPUTS******************************
assign decoded_addr0_o = addr0_i[SRAM_INDEX-1] ? padded_addr1_0 : padded_addr0_0;
assign decoded_addr1_o = addr1_i[SRAM_INDEX-1] ? padded_addr1_1 : padded_addr0_1;
assign decoded_addr2_o = addr2_i[SRAM_INDEX-1] ? padded_addr1_2 : padded_addr0_2;
assign decoded_addr3_o = addr3_i[SRAM_INDEX-1] ? padded_addr1_3 : padded_addr0_3;
assign decoded_addr4_o = addr4_i[SRAM_INDEX-1] ? padded_addr1_4 : padded_addr0_4;
assign decoded_addr5_o = addr5_i[SRAM_INDEX-1] ? padded_addr1_5 : padded_addr0_5;
assign decoded_addr6_o = addr6_i[SRAM_INDEX-1] ? padded_addr1_6 : padded_addr0_6;
assign decoded_addr7_o = addr7_i[SRAM_INDEX-1] ? padded_addr1_7 : padded_addr0_7;
assign decoded_addr8_o = addr8_i[SRAM_INDEX-1] ? padded_addr1_8 : padded_addr0_8;
assign decoded_addr9_o = addr9_i[SRAM_INDEX-1] ? padded_addr1_9 : padded_addr0_9;
assign decoded_addr10_o = addr10_i[SRAM_INDEX-1] ? padded_addr1_10 : padded_addr0_10;
assign decoded_addr11_o = addr11_i[SRAM_INDEX-1] ? padded_addr1_11 : padded_addr0_11;



//***************MUXES FOR DECODED WRITE ADDRESS OUTPUTS***************************
assign decoded_addr0wr_o = addr0wr_i[SRAM_INDEX-1] ? padded_addr1_0wr : padded_addr0_0wr;
assign decoded_addr1wr_o = addr1wr_i[SRAM_INDEX-1] ? padded_addr1_1wr : padded_addr0_1wr;
assign decoded_addr2wr_o = addr2wr_i[SRAM_INDEX-1] ? padded_addr1_2wr : padded_addr0_2wr;
assign decoded_addr3wr_o = addr3wr_i[SRAM_INDEX-1] ? padded_addr1_3wr : padded_addr0_3wr;
assign decoded_addr4wr_o = addr4wr_i[SRAM_INDEX-1] ? padded_addr1_4wr : padded_addr0_4wr;
assign decoded_addr5wr_o = addr5wr_i[SRAM_INDEX-1] ? padded_addr1_5wr : padded_addr0_5wr;
 
 
 REG_FILE_64 #(SRAM_DEPTH/2,SRAM_INDEX-1,SRAM_WIDTH) 
		 PhyRegFile0( 
			 .addr0_i(addr0_i[SRAM_INDEX-2:0]), 
			 .addr1_i(addr1_i[SRAM_INDEX-2:0]), 
			 .we0_i(we0_0_i), 
			 .addr0wr_i(addr0wr_i[SRAM_INDEX-2:0]), 
			 .data0wr_i(data0wr_i), 
			 .decoded_addr0wr_o(decoded_addr0_0wr),  
			 .addr2_i(addr2_i[SRAM_INDEX-2:0]), 
			 .addr3_i(addr3_i[SRAM_INDEX-2:0]), 
			 .we1_i(we0_1_i), 
			 .addr1wr_i(addr1wr_i[SRAM_INDEX-2:0]), 
			 .data1wr_i(data1wr_i), 
			 .decoded_addr1wr_o(decoded_addr0_1wr),  
			 .addr4_i(addr4_i[SRAM_INDEX-2:0]), 
			 .addr5_i(addr5_i[SRAM_INDEX-2:0]), 
			 .we2_i(we0_2_i), 
			 .addr2wr_i(addr2wr_i[SRAM_INDEX-2:0]), 
			 .data2wr_i(data2wr_i), 
			 .decoded_addr2wr_o(decoded_addr0_2wr),  
			 .addr6_i(addr6_i[SRAM_INDEX-2:0]), 
			 .addr7_i(addr7_i[SRAM_INDEX-2:0]), 
			 .we3_i(we0_3_i), 
			 .addr3wr_i(addr3wr_i[SRAM_INDEX-2:0]), 
			 .data3wr_i(data3wr_i), 
			 .decoded_addr3wr_o(decoded_addr0_3wr),  
			 .addr8_i(addr8_i[SRAM_INDEX-2:0]), 
			 .addr9_i(addr9_i[SRAM_INDEX-2:0]), 
			 .we4_i(we0_4_i), 
			 .addr4wr_i(addr4wr_i[SRAM_INDEX-2:0]), 
			 .data4wr_i(data4wr_i), 
			 .decoded_addr4wr_o(decoded_addr0_4wr),  
			 .addr10_i(addr10_i[SRAM_INDEX-2:0]), 
			 .addr11_i(addr11_i[SRAM_INDEX-2:0]), 
			 .we5_i(we0_5_i), 
			 .addr5wr_i(addr5wr_i[SRAM_INDEX-2:0]), 
			 .data5wr_i(data5wr_i), 
			 .decoded_addr5wr_o(decoded_addr0_5wr),  
			 .data0_o(data0_0), 
			 .decoded_addr0_o(decoded_addr0_0), 
			 .data1_o(data0_1), 
			 .decoded_addr1_o(decoded_addr0_1), 
			 .data2_o(data0_2), 
			 .decoded_addr2_o(decoded_addr0_2), 
			 .data3_o(data0_3), 
			 .decoded_addr3_o(decoded_addr0_3), 
			 .data4_o(data0_4), 
			 .decoded_addr4_o(decoded_addr0_4), 
			 .data5_o(data0_5), 
			 .decoded_addr5_o(decoded_addr0_5), 
			 .data6_o(data0_6), 
			 .decoded_addr6_o(decoded_addr0_6), 
			 .data7_o(data0_7), 
			 .decoded_addr7_o(decoded_addr0_7), 
			 .data8_o(data0_8), 
			 .decoded_addr8_o(decoded_addr0_8), 
			 .data9_o(data0_9), 
			 .decoded_addr9_o(decoded_addr0_9), 
			 .data10_o(data0_10), 
			 .decoded_addr10_o(decoded_addr0_10), 
			 .data11_o(data0_11), 
			 .decoded_addr11_o(decoded_addr0_11), 
			 .clk(clk), 
			 .reset(reset) 
		);
		
		
 REG_FILE_64 #(SRAM_DEPTH/2,SRAM_INDEX-1,SRAM_WIDTH) 
		 PhyRegFile1( 
			 .addr0_i(addr0_i[SRAM_INDEX-2:0]), 
			 .addr1_i(addr1_i[SRAM_INDEX-2:0]), 
			 .we0_i(we1_0_i), 
			 .addr0wr_i(addr0wr_i[SRAM_INDEX-2:0]), 
			 .data0wr_i(data0wr_i), 
			 .decoded_addr0wr_o(decoded_addr1_0wr),  
			 .addr2_i(addr2_i[SRAM_INDEX-2:0]), 
			 .addr3_i(addr3_i[SRAM_INDEX-2:0]), 
			 .we1_i(we1_1_i), 
			 .addr1wr_i(addr1wr_i[SRAM_INDEX-2:0]), 
			 .data1wr_i(data1wr_i), 
			 .decoded_addr1wr_o(decoded_addr1_1wr),  
			 .addr4_i(addr4_i[SRAM_INDEX-2:0]), 
			 .addr5_i(addr5_i[SRAM_INDEX-2:0]), 
			 .we2_i(we1_2_i), 
			 .addr2wr_i(addr2wr_i[SRAM_INDEX-2:0]), 
			 .data2wr_i(data2wr_i), 
			 .decoded_addr2wr_o(decoded_addr1_2wr),  
			 .addr6_i(addr6_i[SRAM_INDEX-2:0]), 
			 .addr7_i(addr7_i[SRAM_INDEX-2:0]), 
			 .we3_i(we1_3_i), 
			 .addr3wr_i(addr3wr_i[SRAM_INDEX-2:0]), 
			 .data3wr_i(data3wr_i), 
			 .decoded_addr3wr_o(decoded_addr1_3wr),  
			 .addr8_i(addr8_i[SRAM_INDEX-2:0]), 
			 .addr9_i(addr9_i[SRAM_INDEX-2:0]), 
			 .we4_i(we1_4_i), 
			 .addr4wr_i(addr4wr_i[SRAM_INDEX-2:0]), 
			 .data4wr_i(data4wr_i), 
			 .decoded_addr4wr_o(decoded_addr1_4wr),  
			 .addr10_i(addr10_i[SRAM_INDEX-2:0]), 
			 .addr11_i(addr11_i[SRAM_INDEX-2:0]), 
			 .we5_i(we1_5_i), 
			 .addr5wr_i(addr5wr_i[SRAM_INDEX-2:0]), 
			 .data5wr_i(data5wr_i), 
			 .decoded_addr5wr_o(decoded_addr1_5wr),  
			 .data0_o(data1_0), 
			 .decoded_addr0_o(decoded_addr1_0), 
			 .data1_o(data1_1), 
			 .decoded_addr1_o(decoded_addr1_1), 
			 .data2_o(data1_2), 
			 .decoded_addr2_o(decoded_addr1_2), 
			 .data3_o(data1_3), 
			 .decoded_addr3_o(decoded_addr1_3), 
			 .data4_o(data1_4), 
			 .decoded_addr4_o(decoded_addr1_4), 
			 .data5_o(data1_5), 
			 .decoded_addr5_o(decoded_addr1_5), 
			 .data6_o(data1_6), 
			 .decoded_addr6_o(decoded_addr1_6), 
			 .data7_o(data1_7), 
			 .decoded_addr7_o(decoded_addr1_7), 
			 .data8_o(data1_8), 
			 .decoded_addr8_o(decoded_addr1_8), 
			 .data9_o(data1_9), 
			 .decoded_addr9_o(decoded_addr1_9), 
			 .data10_o(data1_10), 
			 .decoded_addr10_o(decoded_addr1_10), 
			 .data11_o(data1_11), 
			 .decoded_addr11_o(decoded_addr1_11), 
			 .clk(clk), 
			 .reset(reset) 
		);
endmodule