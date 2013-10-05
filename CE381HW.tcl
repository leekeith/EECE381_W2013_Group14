# Copyright (C) 1991-2012 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II: Generate Tcl File for Project
# File: CE381HW.tcl
# Generated on: Wed Oct 02 12:28:40 2013

# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "CE381HW"]} {
		puts "Project CE381HW is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists CE381HW]} {
		project_open -revision CE381HW CE381HW
	} else {
		project_new -revision CE381HW CE381HW
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone II"
	set_global_assignment -name DEVICE EP2C35F672C6
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION "12.0 SP2"
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "22:06:52  SEPTEMBER 23, 2013"
	set_global_assignment -name LAST_QUARTUS_VERSION "12.0 SP2"
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name VHDL_FILE nios_system/synthesis/submodules/Altera_UP_SD_Card_Memory_Block.vhd
	set_global_assignment -name SOURCE_FILE nios_system/synthesis/submodules/Altera_UP_SD_Card_Memory_Block.cmp
	set_global_assignment -name QSYS_FILE nios_system.qsys
	set_global_assignment -name VHDL_FILE CE381HW.vhd
	set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"
	set_location_assignment PIN_N25 -to SW[0]
	set_location_assignment PIN_N26 -to SW[1]
	set_location_assignment PIN_P25 -to SW[2]
	set_location_assignment PIN_AE14 -to SW[3]
	set_location_assignment PIN_AF14 -to SW[4]
	set_location_assignment PIN_AD13 -to SW[5]
	set_location_assignment PIN_AC13 -to SW[6]
	set_location_assignment PIN_C13 -to SW[7]
	set_location_assignment PIN_B13 -to SW[8]
	set_location_assignment PIN_A13 -to SW[9]
	set_location_assignment PIN_N1 -to SW[10]
	set_location_assignment PIN_P1 -to SW[11]
	set_location_assignment PIN_P2 -to SW[12]
	set_location_assignment PIN_T7 -to SW[13]
	set_location_assignment PIN_U3 -to SW[14]
	set_location_assignment PIN_U4 -to SW[15]
	set_location_assignment PIN_V1 -to SW[16]
	set_location_assignment PIN_V2 -to SW[17]
	set_location_assignment PIN_T6 -to DRAM_ADDR[0]
	set_location_assignment PIN_V4 -to DRAM_ADDR[1]
	set_location_assignment PIN_V3 -to DRAM_ADDR[2]
	set_location_assignment PIN_W2 -to DRAM_ADDR[3]
	set_location_assignment PIN_W1 -to DRAM_ADDR[4]
	set_location_assignment PIN_U6 -to DRAM_ADDR[5]
	set_location_assignment PIN_U7 -to DRAM_ADDR[6]
	set_location_assignment PIN_U5 -to DRAM_ADDR[7]
	set_location_assignment PIN_W4 -to DRAM_ADDR[8]
	set_location_assignment PIN_W3 -to DRAM_ADDR[9]
	set_location_assignment PIN_Y1 -to DRAM_ADDR[10]
	set_location_assignment PIN_V5 -to DRAM_ADDR[11]
	set_location_assignment PIN_AE2 -to DRAM_BA_0
	set_location_assignment PIN_AE3 -to DRAM_BA_1
	set_location_assignment PIN_AB3 -to DRAM_CAS_N
	set_location_assignment PIN_AA6 -to DRAM_CKE
	set_location_assignment PIN_AA7 -to DRAM_CLK
	set_location_assignment PIN_AC3 -to DRAM_CS_N
	set_location_assignment PIN_V6 -to DRAM_DQ[0]
	set_location_assignment PIN_AA2 -to DRAM_DQ[1]
	set_location_assignment PIN_AA1 -to DRAM_DQ[2]
	set_location_assignment PIN_Y3 -to DRAM_DQ[3]
	set_location_assignment PIN_Y4 -to DRAM_DQ[4]
	set_location_assignment PIN_R8 -to DRAM_DQ[5]
	set_location_assignment PIN_T8 -to DRAM_DQ[6]
	set_location_assignment PIN_V7 -to DRAM_DQ[7]
	set_location_assignment PIN_W6 -to DRAM_DQ[8]
	set_location_assignment PIN_AB2 -to DRAM_DQ[9]
	set_location_assignment PIN_AB1 -to DRAM_DQ[10]
	set_location_assignment PIN_AA4 -to DRAM_DQ[11]
	set_location_assignment PIN_AA3 -to DRAM_DQ[12]
	set_location_assignment PIN_AC2 -to DRAM_DQ[13]
	set_location_assignment PIN_AC1 -to DRAM_DQ[14]
	set_location_assignment PIN_AA5 -to DRAM_DQ[15]
	set_location_assignment PIN_AD2 -to DRAM_LDQM
	set_location_assignment PIN_Y5 -to DRAM_UDQM
	set_location_assignment PIN_AB4 -to DRAM_RAS_N
	set_location_assignment PIN_AD3 -to DRAM_WE_N
	set_location_assignment PIN_AC18 -to FL_ADDR[0]
	set_location_assignment PIN_AB18 -to FL_ADDR[1]
	set_location_assignment PIN_AE19 -to FL_ADDR[2]
	set_location_assignment PIN_AF19 -to FL_ADDR[3]
	set_location_assignment PIN_AE18 -to FL_ADDR[4]
	set_location_assignment PIN_AF18 -to FL_ADDR[5]
	set_location_assignment PIN_Y16 -to FL_ADDR[6]
	set_location_assignment PIN_AA16 -to FL_ADDR[7]
	set_location_assignment PIN_AD17 -to FL_ADDR[8]
	set_location_assignment PIN_AC17 -to FL_ADDR[9]
	set_location_assignment PIN_AE17 -to FL_ADDR[10]
	set_location_assignment PIN_AF17 -to FL_ADDR[11]
	set_location_assignment PIN_W16 -to FL_ADDR[12]
	set_location_assignment PIN_W15 -to FL_ADDR[13]
	set_location_assignment PIN_AC16 -to FL_ADDR[14]
	set_location_assignment PIN_AD16 -to FL_ADDR[15]
	set_location_assignment PIN_AE16 -to FL_ADDR[16]
	set_location_assignment PIN_AC15 -to FL_ADDR[17]
	set_location_assignment PIN_AB15 -to FL_ADDR[18]
	set_location_assignment PIN_AA15 -to FL_ADDR[19]
	set_location_assignment PIN_Y15 -to FL_ADDR[20]
	set_location_assignment PIN_Y14 -to FL_ADDR[21]
	set_location_assignment PIN_V17 -to FL_CE_N
	set_location_assignment PIN_W17 -to FL_OE_N
	set_location_assignment PIN_AD19 -to FL_DQ[0]
	set_location_assignment PIN_AC19 -to FL_DQ[1]
	set_location_assignment PIN_AF20 -to FL_DQ[2]
	set_location_assignment PIN_AE20 -to FL_DQ[3]
	set_location_assignment PIN_AB20 -to FL_DQ[4]
	set_location_assignment PIN_AC20 -to FL_DQ[5]
	set_location_assignment PIN_AF21 -to FL_DQ[6]
	set_location_assignment PIN_AE21 -to FL_DQ[7]
	set_location_assignment PIN_AA18 -to FL_RST_N
	set_location_assignment PIN_AA17 -to FL_WE_N
	set_location_assignment PIN_AF10 -to HEX0[0]
	set_location_assignment PIN_AB12 -to HEX0[1]
	set_location_assignment PIN_AC12 -to HEX0[2]
	set_location_assignment PIN_AD11 -to HEX0[3]
	set_location_assignment PIN_AE11 -to HEX0[4]
	set_location_assignment PIN_V14 -to HEX0[5]
	set_location_assignment PIN_V13 -to HEX0[6]
	set_location_assignment PIN_V20 -to HEX1[0]
	set_location_assignment PIN_V21 -to HEX1[1]
	set_location_assignment PIN_W21 -to HEX1[2]
	set_location_assignment PIN_Y22 -to HEX1[3]
	set_location_assignment PIN_AA24 -to HEX1[4]
	set_location_assignment PIN_AA23 -to HEX1[5]
	set_location_assignment PIN_AB24 -to HEX1[6]
	set_location_assignment PIN_AB23 -to HEX2[0]
	set_location_assignment PIN_V22 -to HEX2[1]
	set_location_assignment PIN_AC25 -to HEX2[2]
	set_location_assignment PIN_AC26 -to HEX2[3]
	set_location_assignment PIN_AB26 -to HEX2[4]
	set_location_assignment PIN_AB25 -to HEX2[5]
	set_location_assignment PIN_Y24 -to HEX2[6]
	set_location_assignment PIN_Y23 -to HEX3[0]
	set_location_assignment PIN_AA25 -to HEX3[1]
	set_location_assignment PIN_AA26 -to HEX3[2]
	set_location_assignment PIN_Y26 -to HEX3[3]
	set_location_assignment PIN_Y25 -to HEX3[4]
	set_location_assignment PIN_U22 -to HEX3[5]
	set_location_assignment PIN_W24 -to HEX3[6]
	set_location_assignment PIN_U9 -to HEX4[0]
	set_location_assignment PIN_U1 -to HEX4[1]
	set_location_assignment PIN_U2 -to HEX4[2]
	set_location_assignment PIN_T4 -to HEX4[3]
	set_location_assignment PIN_R7 -to HEX4[4]
	set_location_assignment PIN_R6 -to HEX4[5]
	set_location_assignment PIN_T3 -to HEX4[6]
	set_location_assignment PIN_T2 -to HEX5[0]
	set_location_assignment PIN_P6 -to HEX5[1]
	set_location_assignment PIN_P7 -to HEX5[2]
	set_location_assignment PIN_T9 -to HEX5[3]
	set_location_assignment PIN_R5 -to HEX5[4]
	set_location_assignment PIN_R4 -to HEX5[5]
	set_location_assignment PIN_R3 -to HEX5[6]
	set_location_assignment PIN_R2 -to HEX6[0]
	set_location_assignment PIN_P4 -to HEX6[1]
	set_location_assignment PIN_P3 -to HEX6[2]
	set_location_assignment PIN_M2 -to HEX6[3]
	set_location_assignment PIN_M3 -to HEX6[4]
	set_location_assignment PIN_M5 -to HEX6[5]
	set_location_assignment PIN_M4 -to HEX6[6]
	set_location_assignment PIN_L3 -to HEX7[0]
	set_location_assignment PIN_L2 -to HEX7[1]
	set_location_assignment PIN_L9 -to HEX7[2]
	set_location_assignment PIN_L6 -to HEX7[3]
	set_location_assignment PIN_L7 -to HEX7[4]
	set_location_assignment PIN_P9 -to HEX7[5]
	set_location_assignment PIN_N9 -to HEX7[6]
	set_location_assignment PIN_G26 -to KEY[0]
	set_location_assignment PIN_N23 -to KEY[1]
	set_location_assignment PIN_P23 -to KEY[2]
	set_location_assignment PIN_W26 -to KEY[3]
	set_location_assignment PIN_AE23 -to LEDR[0]
	set_location_assignment PIN_AF23 -to LEDR[1]
	set_location_assignment PIN_AB21 -to LEDR[2]
	set_location_assignment PIN_AC22 -to LEDR[3]
	set_location_assignment PIN_AD22 -to LEDR[4]
	set_location_assignment PIN_AD23 -to LEDR[5]
	set_location_assignment PIN_AD21 -to LEDR[6]
	set_location_assignment PIN_AC21 -to LEDR[7]
	set_location_assignment PIN_AA14 -to LEDR[8]
	set_location_assignment PIN_Y13 -to LEDR[9]
	set_location_assignment PIN_AA13 -to LEDR[10]
	set_location_assignment PIN_AC14 -to LEDR[11]
	set_location_assignment PIN_AD15 -to LEDR[12]
	set_location_assignment PIN_AE15 -to LEDR[13]
	set_location_assignment PIN_AF13 -to LEDR[14]
	set_location_assignment PIN_AE13 -to LEDR[15]
	set_location_assignment PIN_AE12 -to LEDR[16]
	set_location_assignment PIN_AD12 -to LEDR[17]
	set_location_assignment PIN_AE22 -to LEDG[0]
	set_location_assignment PIN_AF22 -to LEDG[1]
	set_location_assignment PIN_W19 -to LEDG[2]
	set_location_assignment PIN_V18 -to LEDG[3]
	set_location_assignment PIN_U18 -to LEDG[4]
	set_location_assignment PIN_U17 -to LEDG[5]
	set_location_assignment PIN_AA20 -to LEDG[6]
	set_location_assignment PIN_Y18 -to LEDG[7]
	set_location_assignment PIN_Y12 -to LEDG[8]
	set_location_assignment PIN_D13 -to CLOCK_27
	set_location_assignment PIN_N2 -to CLOCK_50
	set_location_assignment PIN_P26 -to EXT_CLOCK
	set_location_assignment PIN_D26 -to PS2_CLK
	set_location_assignment PIN_C24 -to PS2_DAT
	set_location_assignment PIN_C25 -to UART_RXD
	set_location_assignment PIN_B25 -to UART_TXD
	set_location_assignment PIN_K4 -to LCD_RW
	set_location_assignment PIN_K3 -to LCD_EN
	set_location_assignment PIN_K1 -to LCD_RS
	set_location_assignment PIN_J1 -to LCD_DATA[0]
	set_location_assignment PIN_J2 -to LCD_DATA[1]
	set_location_assignment PIN_H1 -to LCD_DATA[2]
	set_location_assignment PIN_H2 -to LCD_DATA[3]
	set_location_assignment PIN_J4 -to LCD_DATA[4]
	set_location_assignment PIN_J3 -to LCD_DATA[5]
	set_location_assignment PIN_H4 -to LCD_DATA[6]
	set_location_assignment PIN_H3 -to LCD_DATA[7]
	set_location_assignment PIN_L4 -to LCD_ON
	set_location_assignment PIN_K2 -to LCD_BLON
	set_location_assignment PIN_AE4 -to SRAM_ADDR[0]
	set_location_assignment PIN_AF4 -to SRAM_ADDR[1]
	set_location_assignment PIN_AC5 -to SRAM_ADDR[2]
	set_location_assignment PIN_AC6 -to SRAM_ADDR[3]
	set_location_assignment PIN_AD4 -to SRAM_ADDR[4]
	set_location_assignment PIN_AD5 -to SRAM_ADDR[5]
	set_location_assignment PIN_AE5 -to SRAM_ADDR[6]
	set_location_assignment PIN_AF5 -to SRAM_ADDR[7]
	set_location_assignment PIN_AD6 -to SRAM_ADDR[8]
	set_location_assignment PIN_AD7 -to SRAM_ADDR[9]
	set_location_assignment PIN_V10 -to SRAM_ADDR[10]
	set_location_assignment PIN_V9 -to SRAM_ADDR[11]
	set_location_assignment PIN_AC7 -to SRAM_ADDR[12]
	set_location_assignment PIN_W8 -to SRAM_ADDR[13]
	set_location_assignment PIN_W10 -to SRAM_ADDR[14]
	set_location_assignment PIN_Y10 -to SRAM_ADDR[15]
	set_location_assignment PIN_AB8 -to SRAM_ADDR[16]
	set_location_assignment PIN_AC8 -to SRAM_ADDR[17]
	set_location_assignment PIN_AD8 -to SRAM_DQ[0]
	set_location_assignment PIN_AE6 -to SRAM_DQ[1]
	set_location_assignment PIN_AF6 -to SRAM_DQ[2]
	set_location_assignment PIN_AA9 -to SRAM_DQ[3]
	set_location_assignment PIN_AA10 -to SRAM_DQ[4]
	set_location_assignment PIN_AB10 -to SRAM_DQ[5]
	set_location_assignment PIN_AA11 -to SRAM_DQ[6]
	set_location_assignment PIN_Y11 -to SRAM_DQ[7]
	set_location_assignment PIN_AE7 -to SRAM_DQ[8]
	set_location_assignment PIN_AF7 -to SRAM_DQ[9]
	set_location_assignment PIN_AE8 -to SRAM_DQ[10]
	set_location_assignment PIN_AF8 -to SRAM_DQ[11]
	set_location_assignment PIN_W11 -to SRAM_DQ[12]
	set_location_assignment PIN_W12 -to SRAM_DQ[13]
	set_location_assignment PIN_AC9 -to SRAM_DQ[14]
	set_location_assignment PIN_AC10 -to SRAM_DQ[15]
	set_location_assignment PIN_AE10 -to SRAM_WE_N
	set_location_assignment PIN_AD10 -to SRAM_OE_N
	set_location_assignment PIN_AF9 -to SRAM_UB_N
	set_location_assignment PIN_AE9 -to SRAM_LB_N
	set_location_assignment PIN_AC11 -to SRAM_CE_N
	set_location_assignment PIN_K7 -to OTG_ADDR[0]
	set_location_assignment PIN_F2 -to OTG_ADDR[1]
	set_location_assignment PIN_F1 -to OTG_CS_N
	set_location_assignment PIN_G2 -to OTG_RD_N
	set_location_assignment PIN_G1 -to OTG_WR_N
	set_location_assignment PIN_G5 -to OTG_RST_N
	set_location_assignment PIN_F4 -to OTG_DATA[0]
	set_location_assignment PIN_D2 -to OTG_DATA[1]
	set_location_assignment PIN_D1 -to OTG_DATA[2]
	set_location_assignment PIN_F7 -to OTG_DATA[3]
	set_location_assignment PIN_J5 -to OTG_DATA[4]
	set_location_assignment PIN_J8 -to OTG_DATA[5]
	set_location_assignment PIN_J7 -to OTG_DATA[6]
	set_location_assignment PIN_H6 -to OTG_DATA[7]
	set_location_assignment PIN_E2 -to OTG_DATA[8]
	set_location_assignment PIN_E1 -to OTG_DATA[9]
	set_location_assignment PIN_K6 -to OTG_DATA[10]
	set_location_assignment PIN_K5 -to OTG_DATA[11]
	set_location_assignment PIN_G4 -to OTG_DATA[12]
	set_location_assignment PIN_G3 -to OTG_DATA[13]
	set_location_assignment PIN_J6 -to OTG_DATA[14]
	set_location_assignment PIN_K8 -to OTG_DATA[15]
	set_location_assignment PIN_B3 -to OTG_INT0
	set_location_assignment PIN_C3 -to OTG_INT1
	set_location_assignment PIN_C2 -to OTG_DACK0_N
	set_location_assignment PIN_B2 -to OTG_DACK1_N
	set_location_assignment PIN_F6 -to OTG_DREQ0
	set_location_assignment PIN_E5 -to OTG_DREQ1
	set_location_assignment PIN_F3 -to OTG_FSPEED
	set_location_assignment PIN_G6 -to OTG_LSPEED
	set_location_assignment PIN_B14 -to TDI
	set_location_assignment PIN_A14 -to TCS
	set_location_assignment PIN_D14 -to TCK
	set_location_assignment PIN_F14 -to TDO
	set_location_assignment PIN_C4 -to TD_RESET
	set_location_assignment PIN_C8 -to VGA_R[0]
	set_location_assignment PIN_F10 -to VGA_R[1]
	set_location_assignment PIN_G10 -to VGA_R[2]
	set_location_assignment PIN_D9 -to VGA_R[3]
	set_location_assignment PIN_C9 -to VGA_R[4]
	set_location_assignment PIN_A8 -to VGA_R[5]
	set_location_assignment PIN_H11 -to VGA_R[6]
	set_location_assignment PIN_H12 -to VGA_R[7]
	set_location_assignment PIN_F11 -to VGA_R[8]
	set_location_assignment PIN_E10 -to VGA_R[9]
	set_location_assignment PIN_B9 -to VGA_G[0]
	set_location_assignment PIN_A9 -to VGA_G[1]
	set_location_assignment PIN_C10 -to VGA_G[2]
	set_location_assignment PIN_D10 -to VGA_G[3]
	set_location_assignment PIN_B10 -to VGA_G[4]
	set_location_assignment PIN_A10 -to VGA_G[5]
	set_location_assignment PIN_G11 -to VGA_G[6]
	set_location_assignment PIN_D11 -to VGA_G[7]
	set_location_assignment PIN_E12 -to VGA_G[8]
	set_location_assignment PIN_D12 -to VGA_G[9]
	set_location_assignment PIN_J13 -to VGA_B[0]
	set_location_assignment PIN_J14 -to VGA_B[1]
	set_location_assignment PIN_F12 -to VGA_B[2]
	set_location_assignment PIN_G12 -to VGA_B[3]
	set_location_assignment PIN_J10 -to VGA_B[4]
	set_location_assignment PIN_J11 -to VGA_B[5]
	set_location_assignment PIN_C11 -to VGA_B[6]
	set_location_assignment PIN_B11 -to VGA_B[7]
	set_location_assignment PIN_C12 -to VGA_B[8]
	set_location_assignment PIN_B12 -to VGA_B[9]
	set_location_assignment PIN_B8 -to VGA_CLK
	set_location_assignment PIN_D6 -to VGA_BLANK
	set_location_assignment PIN_A7 -to VGA_HS
	set_location_assignment PIN_D8 -to VGA_VS
	set_location_assignment PIN_B7 -to VGA_SYNC
	set_location_assignment PIN_A6 -to I2C_SCLK
	set_location_assignment PIN_B6 -to I2C_SDAT
	set_location_assignment PIN_J9 -to TD_DATA[0]
	set_location_assignment PIN_E8 -to TD_DATA[1]
	set_location_assignment PIN_H8 -to TD_DATA[2]
	set_location_assignment PIN_H10 -to TD_DATA[3]
	set_location_assignment PIN_G9 -to TD_DATA[4]
	set_location_assignment PIN_F9 -to TD_DATA[5]
	set_location_assignment PIN_D7 -to TD_DATA[6]
	set_location_assignment PIN_C7 -to TD_DATA[7]
	set_location_assignment PIN_D5 -to TD_HS
	set_location_assignment PIN_K9 -to TD_VS
	set_location_assignment PIN_C5 -to AUD_ADCLRCK
	set_location_assignment PIN_B5 -to AUD_ADCDAT
	set_location_assignment PIN_C6 -to AUD_DACLRCK
	set_location_assignment PIN_A4 -to AUD_DACDAT
	set_location_assignment PIN_A5 -to AUD_XCK
	set_location_assignment PIN_B4 -to AUD_BCLK
	set_location_assignment PIN_D17 -to ENET_DATA[0]
	set_location_assignment PIN_C17 -to ENET_DATA[1]
	set_location_assignment PIN_B18 -to ENET_DATA[2]
	set_location_assignment PIN_A18 -to ENET_DATA[3]
	set_location_assignment PIN_B17 -to ENET_DATA[4]
	set_location_assignment PIN_A17 -to ENET_DATA[5]
	set_location_assignment PIN_B16 -to ENET_DATA[6]
	set_location_assignment PIN_B15 -to ENET_DATA[7]
	set_location_assignment PIN_B20 -to ENET_DATA[8]
	set_location_assignment PIN_A20 -to ENET_DATA[9]
	set_location_assignment PIN_C19 -to ENET_DATA[10]
	set_location_assignment PIN_D19 -to ENET_DATA[11]
	set_location_assignment PIN_B19 -to ENET_DATA[12]
	set_location_assignment PIN_A19 -to ENET_DATA[13]
	set_location_assignment PIN_E18 -to ENET_DATA[14]
	set_location_assignment PIN_D18 -to ENET_DATA[15]
	set_location_assignment PIN_B24 -to ENET_CLK
	set_location_assignment PIN_A21 -to ENET_CMD
	set_location_assignment PIN_A23 -to ENET_CS_N
	set_location_assignment PIN_B21 -to ENET_INT
	set_location_assignment PIN_A22 -to ENET_RD_N
	set_location_assignment PIN_B22 -to ENET_WR_N
	set_location_assignment PIN_B23 -to ENET_RST_N
	set_location_assignment PIN_AE24 -to IRDA_TXD
	set_location_assignment PIN_AE25 -to IRDA_RXD
	set_location_assignment PIN_AD24 -to SD_DAT
	set_location_assignment PIN_AC23 -to SD_DAT3
	set_location_assignment PIN_Y21 -to SD_CMD
	set_location_assignment PIN_AD25 -to SD_CLK
	set_location_assignment PIN_D25 -to GPIO_0[0]
	set_location_assignment PIN_J22 -to GPIO_0[1]
	set_location_assignment PIN_E26 -to GPIO_0[2]
	set_location_assignment PIN_E25 -to GPIO_0[3]
	set_location_assignment PIN_F24 -to GPIO_0[4]
	set_location_assignment PIN_F23 -to GPIO_0[5]
	set_location_assignment PIN_J21 -to GPIO_0[6]
	set_location_assignment PIN_J20 -to GPIO_0[7]
	set_location_assignment PIN_F25 -to GPIO_0[8]
	set_location_assignment PIN_F26 -to GPIO_0[9]
	set_location_assignment PIN_N18 -to GPIO_0[10]
	set_location_assignment PIN_P18 -to GPIO_0[11]
	set_location_assignment PIN_G23 -to GPIO_0[12]
	set_location_assignment PIN_G24 -to GPIO_0[13]
	set_location_assignment PIN_K22 -to GPIO_0[14]
	set_location_assignment PIN_G25 -to GPIO_0[15]
	set_location_assignment PIN_H23 -to GPIO_0[16]
	set_location_assignment PIN_H24 -to GPIO_0[17]
	set_location_assignment PIN_J23 -to GPIO_0[18]
	set_location_assignment PIN_J24 -to GPIO_0[19]
	set_location_assignment PIN_H25 -to GPIO_0[20]
	set_location_assignment PIN_H26 -to GPIO_0[21]
	set_location_assignment PIN_H19 -to GPIO_0[22]
	set_location_assignment PIN_K18 -to GPIO_0[23]
	set_location_assignment PIN_K19 -to GPIO_0[24]
	set_location_assignment PIN_K21 -to GPIO_0[25]
	set_location_assignment PIN_K23 -to GPIO_0[26]
	set_location_assignment PIN_K24 -to GPIO_0[27]
	set_location_assignment PIN_L21 -to GPIO_0[28]
	set_location_assignment PIN_L20 -to GPIO_0[29]
	set_location_assignment PIN_J25 -to GPIO_0[30]
	set_location_assignment PIN_J26 -to GPIO_0[31]
	set_location_assignment PIN_L23 -to GPIO_0[32]
	set_location_assignment PIN_L24 -to GPIO_0[33]
	set_location_assignment PIN_L25 -to GPIO_0[34]
	set_location_assignment PIN_L19 -to GPIO_0[35]
	set_location_assignment PIN_K25 -to GPIO_1[0]
	set_location_assignment PIN_K26 -to GPIO_1[1]
	set_location_assignment PIN_M22 -to GPIO_1[2]
	set_location_assignment PIN_M23 -to GPIO_1[3]
	set_location_assignment PIN_M19 -to GPIO_1[4]
	set_location_assignment PIN_M20 -to GPIO_1[5]
	set_location_assignment PIN_N20 -to GPIO_1[6]
	set_location_assignment PIN_M21 -to GPIO_1[7]
	set_location_assignment PIN_M24 -to GPIO_1[8]
	set_location_assignment PIN_M25 -to GPIO_1[9]
	set_location_assignment PIN_N24 -to GPIO_1[10]
	set_location_assignment PIN_P24 -to GPIO_1[11]
	set_location_assignment PIN_R25 -to GPIO_1[12]
	set_location_assignment PIN_R24 -to GPIO_1[13]
	set_location_assignment PIN_R20 -to GPIO_1[14]
	set_location_assignment PIN_T22 -to GPIO_1[15]
	set_location_assignment PIN_T23 -to GPIO_1[16]
	set_location_assignment PIN_T24 -to GPIO_1[17]
	set_location_assignment PIN_T25 -to GPIO_1[18]
	set_location_assignment PIN_T18 -to GPIO_1[19]
	set_location_assignment PIN_T21 -to GPIO_1[20]
	set_location_assignment PIN_T20 -to GPIO_1[21]
	set_location_assignment PIN_U26 -to GPIO_1[22]
	set_location_assignment PIN_U25 -to GPIO_1[23]
	set_location_assignment PIN_U23 -to GPIO_1[24]
	set_location_assignment PIN_U24 -to GPIO_1[25]
	set_location_assignment PIN_R19 -to GPIO_1[26]
	set_location_assignment PIN_T19 -to GPIO_1[27]
	set_location_assignment PIN_U20 -to GPIO_1[28]
	set_location_assignment PIN_U21 -to GPIO_1[29]
	set_location_assignment PIN_V26 -to GPIO_1[30]
	set_location_assignment PIN_V25 -to GPIO_1[31]
	set_location_assignment PIN_V24 -to GPIO_1[32]
	set_location_assignment PIN_V23 -to GPIO_1[33]
	set_location_assignment PIN_W25 -to GPIO_1[34]
	set_location_assignment PIN_W23 -to GPIO_1[35]
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Including default assignments
	set_global_assignment -name PROJECT_SHOW_ENTITY_NAME ON
	set_global_assignment -name PROJECT_USE_SIMPLIFIED_NAMES OFF
	set_global_assignment -name ENABLE_REDUCED_MEMORY_MODE OFF
	set_global_assignment -name VER_COMPATIBLE_DB_DIR export_db
	set_global_assignment -name AUTO_EXPORT_VER_COMPATIBLE_DB OFF
	set_global_assignment -name SMART_RECOMPILE OFF
	set_global_assignment -name FLOW_DISABLE_ASSEMBLER OFF
	set_global_assignment -name FLOW_ENABLE_POWER_ANALYZER OFF
	set_global_assignment -name FLOW_ENABLE_HC_COMPARE OFF
	set_global_assignment -name HC_OUTPUT_DIR hc_output
	set_global_assignment -name SAVE_MIGRATION_INFO_DURING_COMPILATION OFF
	set_global_assignment -name FLOW_ENABLE_IO_ASSIGNMENT_ANALYSIS OFF
	set_global_assignment -name RUN_FULL_COMPILE_ON_DEVICE_CHANGE ON
	set_global_assignment -name FLOW_ENABLE_RTL_VIEWER OFF
	set_global_assignment -name READ_OR_WRITE_IN_BYTE_ADDRESS "USE GLOBAL SETTINGS"
	set_global_assignment -name FLOW_HARDCOPY_DESIGN_READINESS_CHECK ON
	set_global_assignment -name FLOW_ENABLE_PARALLEL_MODULES ON
	set_global_assignment -name ENABLE_COMPACT_REPORT_TABLE OFF
	set_global_assignment -name REVISION_TYPE BASE
	set_global_assignment -name DEFAULT_HOLD_MULTICYCLE "SAME AS MULTICYCLE"
	set_global_assignment -name CUT_OFF_PATHS_BETWEEN_CLOCK_DOMAINS ON
	set_global_assignment -name CUT_OFF_READ_DURING_WRITE_PATHS ON
	set_global_assignment -name CUT_OFF_CLEAR_AND_PRESET_PATHS ON
	set_global_assignment -name CUT_OFF_IO_PIN_FEEDBACK ON
	set_global_assignment -name DO_COMBINED_ANALYSIS OFF
	set_global_assignment -name IGNORE_CLOCK_SETTINGS OFF
	set_global_assignment -name ANALYZE_LATCHES_AS_SYNCHRONOUS_ELEMENTS ON
	set_global_assignment -name DO_MINMAX_ANALYSIS_USING_RISEFALL_DELAYS OFF
	set_global_assignment -name ENABLE_RECOVERY_REMOVAL_ANALYSIS OFF
	set_global_assignment -name ENABLE_CLOCK_LATENCY OFF
	set_global_assignment -name NUMBER_OF_SOURCES_PER_DESTINATION_TO_REPORT 10
	set_global_assignment -name NUMBER_OF_DESTINATION_TO_REPORT 10
	set_global_assignment -name NUMBER_OF_PATHS_TO_REPORT 200
	set_global_assignment -name DO_MIN_ANALYSIS OFF
	set_global_assignment -name DO_MIN_TIMING OFF
	set_global_assignment -name REPORT_IO_PATHS_SEPARATELY OFF
	set_global_assignment -name CLOCK_ANALYSIS_ONLY OFF
	set_global_assignment -name FLOW_ENABLE_TIMING_CONSTRAINT_CHECK OFF
	set_global_assignment -name TIMEQUEST_REPORT_SCRIPT_INCLUDE_DEFAULT_ANALYSIS ON
	set_global_assignment -name TIMEQUEST_MULTICORNER_ANALYSIS ON -family "Cyclone II"
	set_global_assignment -name TIMEQUEST_DO_REPORT_TIMING OFF
	set_global_assignment -name TIMEQUEST_REPORT_WORST_CASE_TIMING_PATHS ON -family "Cyclone II"
	set_global_assignment -name TIMEQUEST_REPORT_NUM_WORST_CASE_TIMING_PATHS 100
	set_global_assignment -name TIMEQUEST_CCPP_TRADEOFF_TOLERANCE 0 -family "Cyclone II"
	set_global_assignment -name TDC_CCPP_TRADEOFF_TOLERANCE 0 -family "Cyclone II"
	set_global_assignment -name TIMEQUEST_DO_CCPP_REMOVAL OFF -family "Cyclone II"
	set_global_assignment -name MUX_RESTRUCTURE AUTO
	set_global_assignment -name MLAB_ADD_TIMING_CONSTRAINTS_FOR_MIXED_PORT_FEED_THROUGH_MODE_SETTING_DONT_CARE OFF
	set_global_assignment -name ENABLE_IP_DEBUG OFF
	set_global_assignment -name SAVE_DISK_SPACE ON
	set_global_assignment -name DISABLE_OCP_HW_EVAL OFF
	set_global_assignment -name DEVICE_FILTER_PACKAGE ANY
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT ANY
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE ANY
	set_global_assignment -name EDA_DESIGN_ENTRY_SYNTHESIS_TOOL "<None>"
	set_global_assignment -name VERILOG_INPUT_VERSION VERILOG_2001
	set_global_assignment -name VHDL_INPUT_VERSION VHDL_1993
	set_global_assignment -name COMPILATION_LEVEL FULL
	set_global_assignment -name TRUE_WYSIWYG_FLOW OFF
	set_global_assignment -name SMART_COMPILE_IGNORES_TDC_FOR_STRATIX_PLL_CHANGES OFF
	set_global_assignment -name STATE_MACHINE_PROCESSING AUTO
	set_global_assignment -name SAFE_STATE_MACHINE OFF
	set_global_assignment -name EXTRACT_VERILOG_STATE_MACHINES ON
	set_global_assignment -name EXTRACT_VHDL_STATE_MACHINES ON
	set_global_assignment -name IGNORE_VERILOG_INITIAL_CONSTRUCTS OFF
	set_global_assignment -name VERILOG_CONSTANT_LOOP_LIMIT 5000
	set_global_assignment -name VERILOG_NON_CONSTANT_LOOP_LIMIT 250
	set_global_assignment -name ADD_PASS_THROUGH_LOGIC_TO_INFERRED_RAMS ON
	set_global_assignment -name INFER_RAMS_FROM_RAW_LOGIC ON
	set_global_assignment -name PARALLEL_SYNTHESIS ON
	set_global_assignment -name DSP_BLOCK_BALANCING AUTO
	set_global_assignment -name NOT_GATE_PUSH_BACK ON
	set_global_assignment -name ALLOW_POWER_UP_DONT_CARE ON
	set_global_assignment -name REMOVE_REDUNDANT_LOGIC_CELLS OFF
	set_global_assignment -name REMOVE_DUPLICATE_REGISTERS ON
	set_global_assignment -name IGNORE_CARRY_BUFFERS OFF
	set_global_assignment -name IGNORE_CASCADE_BUFFERS OFF
	set_global_assignment -name IGNORE_GLOBAL_BUFFERS OFF
	set_global_assignment -name IGNORE_ROW_GLOBAL_BUFFERS OFF
	set_global_assignment -name IGNORE_LCELL_BUFFERS OFF
	set_global_assignment -name MAX7000_IGNORE_LCELL_BUFFERS AUTO
	set_global_assignment -name IGNORE_SOFT_BUFFERS ON
	set_global_assignment -name MAX7000_IGNORE_SOFT_BUFFERS OFF
	set_global_assignment -name LIMIT_AHDL_INTEGERS_TO_32_BITS OFF
	set_global_assignment -name AUTO_GLOBAL_CLOCK_MAX ON
	set_global_assignment -name AUTO_GLOBAL_OE_MAX ON
	set_global_assignment -name MAX_AUTO_GLOBAL_REGISTER_CONTROLS ON
	set_global_assignment -name AUTO_IMPLEMENT_IN_ROM OFF
	set_global_assignment -name STRATIX_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name MAX7000_TECHNOLOGY_MAPPER "PRODUCT TERM"
	set_global_assignment -name APEX20K_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name MERCURY_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name FLEX6K_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name FLEX10K_TECHNOLOGY_MAPPER LUT
	set_global_assignment -name OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name STRATIXII_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name CYCLONE_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name STRATIX_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name MAXII_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name MAX7000_OPTIMIZATION_TECHNIQUE SPEED
	set_global_assignment -name APEX20K_OPTIMIZATION_TECHNIQUE BALANCED
	set_global_assignment -name MERCURY_OPTIMIZATION_TECHNIQUE AREA
	set_global_assignment -name FLEX6K_OPTIMIZATION_TECHNIQUE AREA
	set_global_assignment -name FLEX10K_OPTIMIZATION_TECHNIQUE AREA
	set_global_assignment -name ALLOW_XOR_GATE_USAGE ON
	set_global_assignment -name AUTO_LCELL_INSERTION ON
	set_global_assignment -name CARRY_CHAIN_LENGTH 48
	set_global_assignment -name FLEX6K_CARRY_CHAIN_LENGTH 32
	set_global_assignment -name FLEX10K_CARRY_CHAIN_LENGTH 32
	set_global_assignment -name MERCURY_CARRY_CHAIN_LENGTH 48
	set_global_assignment -name STRATIX_CARRY_CHAIN_LENGTH 70
	set_global_assignment -name STRATIXII_CARRY_CHAIN_LENGTH 70
	set_global_assignment -name CASCADE_CHAIN_LENGTH 2
	set_global_assignment -name PARALLEL_EXPANDER_CHAIN_LENGTH 16
	set_global_assignment -name MAX7000_PARALLEL_EXPANDER_CHAIN_LENGTH 4
	set_global_assignment -name AUTO_CARRY_CHAINS ON
	set_global_assignment -name AUTO_CASCADE_CHAINS ON
	set_global_assignment -name AUTO_PARALLEL_EXPANDERS ON
	set_global_assignment -name AUTO_OPEN_DRAIN_PINS ON
	set_global_assignment -name REMOVE_DUPLICATE_LOGIC ON
	set_global_assignment -name ADV_NETLIST_OPT_SYNTH_WYSIWYG_REMAP OFF
	set_global_assignment -name ADV_NETLIST_OPT_SYNTH_GATE_RETIME OFF
	set_global_assignment -name ADV_NETLIST_OPT_RETIME_CORE_AND_IO ON
	set_global_assignment -name AUTO_ROM_RECOGNITION ON
	set_global_assignment -name AUTO_RAM_RECOGNITION ON
	set_global_assignment -name AUTO_DSP_RECOGNITION ON
	set_global_assignment -name AUTO_SHIFT_REGISTER_RECOGNITION AUTO
	set_global_assignment -name ALLOW_SHIFT_REGISTER_MERGING_ACROSS_HIERARCHIES AUTO
	set_global_assignment -name AUTO_CLOCK_ENABLE_RECOGNITION ON
	set_global_assignment -name STRICT_RAM_RECOGNITION OFF
	set_global_assignment -name ALLOW_SYNCH_CTRL_USAGE ON
	set_global_assignment -name FORCE_SYNCH_CLEAR OFF
	set_global_assignment -name DONT_TOUCH_USER_CELL OFF
	set_global_assignment -name AUTO_RAM_BLOCK_BALANCING ON
	set_global_assignment -name AUTO_RAM_TO_LCELL_CONVERSION OFF
	set_global_assignment -name IP_SHOW_ANALYSIS_MESSAGES OFF
	set_global_assignment -name AUTO_RESOURCE_SHARING OFF
	set_global_assignment -name USE_NEW_TEXT_REPORT_TABLE_FORMAT OFF
	set_global_assignment -name ALLOW_ANY_RAM_SIZE_FOR_RECOGNITION OFF
	set_global_assignment -name ALLOW_ANY_ROM_SIZE_FOR_RECOGNITION OFF
	set_global_assignment -name ALLOW_ANY_SHIFT_REGISTER_SIZE_FOR_RECOGNITION OFF
	set_global_assignment -name MAX7000_FANIN_PER_CELL 100
	set_global_assignment -name USE_LOGICLOCK_CONSTRAINTS_IN_BALANCING ON
	set_global_assignment -name IGNORE_TRANSLATE_OFF_AND_SYNTHESIS_OFF OFF
	set_global_assignment -name STRATIXGX_BYPASS_REMAPPING_OF_FORCE_SIGNAL_DETECT_SIGNAL_THRESHOLD_SELECT OFF
	set_global_assignment -name SYNTH_TIMING_DRIVEN_REGISTER_DUPLICATION OFF
	set_global_assignment -name SYNTH_TIMING_DRIVEN_BALANCED_MAPPING OFF
	set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS OFF -family "Cyclone II"
	set_global_assignment -name REPORT_PARAMETER_SETTINGS ON
	set_global_assignment -name REPORT_SOURCE_ASSIGNMENTS ON
	set_global_assignment -name REPORT_CONNECTIVITY_CHECKS ON
	set_global_assignment -name IGNORE_MAX_FANOUT_ASSIGNMENTS OFF
	set_global_assignment -name SYNCHRONIZATION_REGISTER_CHAIN_LENGTH 2 -family "Cyclone II"
	set_global_assignment -name OPTIMIZE_POWER_DURING_SYNTHESIS "NORMAL COMPILATION"
	set_global_assignment -name HDL_MESSAGE_LEVEL LEVEL2
	set_global_assignment -name HDL_INTERFACE_OUTPUT_PATH ./
	set_global_assignment -name SUPPRESS_REG_MINIMIZATION_MSG OFF
	set_global_assignment -name USE_HIGH_SPEED_ADDER AUTO
	set_global_assignment -name NUMBER_OF_REMOVED_REGISTERS_REPORTED 5000
	set_global_assignment -name NUMBER_OF_SWEPT_NODES_REPORTED 5000
	set_global_assignment -name NUMBER_OF_INVERTED_REGISTERS_REPORTED 100
	set_global_assignment -name ENCRYPTED_LUTMASK OFF
	set_global_assignment -name SYNTH_CLOCK_MUX_PROTECTION ON
	set_global_assignment -name SYNTH_GATED_CLOCK_CONVERSION OFF
	set_global_assignment -name BLOCK_DESIGN_NAMING AUTO
	set_global_assignment -name SYNTH_PROTECT_SDC_CONSTRAINT OFF
	set_global_assignment -name SYNTHESIS_EFFORT AUTO
	set_global_assignment -name SHIFT_REGISTER_RECOGNITION_ACLR_SIGNAL ON
	set_global_assignment -name PRE_MAPPING_RESYNTHESIS OFF
	set_global_assignment -name SYNTH_MESSAGE_LEVEL MEDIUM
	set_global_assignment -name DISABLE_MLAB_RAM_USE OFF
	set_global_assignment -name DISABLE_REGISTER_MERGING_ACROSS_HIERARCHIES AUTO
	set_global_assignment -name SYNTH_RESOURCE_AWARE_INFERENCE_FOR_BLOCK_RAM ON -family "Cyclone II"
	set_global_assignment -name RBCGEN_CRITICAL_WARNING_TO_ERROR ON
	set_global_assignment -name SYNTHESIS_SEED 1
	set_global_assignment -name RAPID_RECOMPILE_SYNTHESIS_MODE ON
	set_global_assignment -name FLEX10K_ENABLE_LOCK_OUTPUT OFF
	set_global_assignment -name DISABLE_PLL_COMPENSATION_DELAY_CHANGE_WARNING OFF
	set_global_assignment -name AUTO_MERGE_PLLS ON
	set_global_assignment -name IGNORE_MODE_FOR_MERGE OFF
	set_global_assignment -name TXPMA_SLEW_RATE LOW
	set_global_assignment -name ADCE_ENABLED AUTO
	set_global_assignment -name ROUTER_TIMING_OPTIMIZATION_LEVEL NORMAL
	set_global_assignment -name ROUTER_CLOCKING_TOPOLOGY_ANALYSIS OFF
	set_global_assignment -name PLACEMENT_EFFORT_MULTIPLIER 1.0
	set_global_assignment -name ROUTER_EFFORT_MULTIPLIER 1.0
	set_global_assignment -name FIT_ATTEMPTS_TO_SKIP 0
	set_global_assignment -name ECO_ALLOW_ROUTING_CHANGES OFF
	set_global_assignment -name BASE_PIN_OUT_FILE_ON_SAMEFRAME_DEVICE OFF
	set_global_assignment -name ENABLE_JTAG_BST_SUPPORT OFF
	set_global_assignment -name MAX7000_ENABLE_JTAG_BST_SUPPORT ON
	set_global_assignment -name ENABLE_NCEO_OUTPUT OFF
	set_global_assignment -name RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS PROGRAMMING PIN"
	set_global_assignment -name STRATIXIII_UPDATE_MODE STANDARD
	set_global_assignment -name STRATIX_UPDATE_MODE STANDARD
	set_global_assignment -name CVP_MODE OFF
	set_global_assignment -name STRATIXIII_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name CYCLONEIII_CONFIGURATION_SCHEME "ACTIVE SERIAL"
	set_global_assignment -name STRATIXII_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name CYCLONEII_CONFIGURATION_SCHEME "ACTIVE SERIAL"
	set_global_assignment -name APEX20K_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name STRATIX_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name CYCLONE_CONFIGURATION_SCHEME "ACTIVE SERIAL"
	set_global_assignment -name MERCURY_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name FLEX6K_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name FLEX10K_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name APEXII_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name USER_START_UP_CLOCK OFF
	set_global_assignment -name ENABLE_VREFA_PIN OFF
	set_global_assignment -name ENABLE_VREFB_PIN OFF
	set_global_assignment -name ALWAYS_ENABLE_INPUT_BUFFERS OFF
	set_global_assignment -name ENABLE_ASMI_FOR_FLASH_LOADER OFF
	set_global_assignment -name ENABLE_DEVICE_WIDE_RESET OFF
	set_global_assignment -name ENABLE_DEVICE_WIDE_OE OFF
	set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS OUTPUT DRIVING GROUND"
	set_global_assignment -name ENABLE_INIT_DONE_OUTPUT OFF
	set_global_assignment -name INIT_DONE_OPEN_DRAIN ON
	set_global_assignment -name RESERVE_NWS_NRS_NCS_CS_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_RDYNBUSY_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA31_THROUGH_DATA16_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA15_THROUGH_DATA8_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA7_THROUGH_DATA1_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA0_AFTER_CONFIGURATION "AS INPUT TRI-STATED"
	set_global_assignment -name RESERVE_ASDO_AFTER_CONFIGURATION "USE AS REGULAR IO" -family "Cyclone II"
	set_global_assignment -name RESERVE_DATA1_AFTER_CONFIGURATION "AS INPUT TRI-STATED"
	set_global_assignment -name RESERVE_DATA7_THROUGH_DATA2_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DATA7_THROUGH_DATA5_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_FLASH_NCE_AFTER_CONFIGURATION "AS INPUT TRI-STATED"
	set_global_assignment -name RESERVE_OTHER_AP_PINS_AFTER_CONFIGURATION "USE AS REGULAR IO"
	set_global_assignment -name RESERVE_DCLK_AFTER_CONFIGURATION "USE AS PROGRAMMING PIN"
	set_global_assignment -name CRC_ERROR_CHECKING OFF
	set_global_assignment -name INTERNAL_SCRUBBING OFF
	set_global_assignment -name PR_ERROR_OPEN_DRAIN ON
	set_global_assignment -name PR_READY_OPEN_DRAIN ON
	set_global_assignment -name ENABLE_CVP_CONFDONE OFF
	set_global_assignment -name CVP_CONFDONE_OPEN_DRAIN ON
	set_global_assignment -name OPTIMIZE_HOLD_TIMING "IO PATHS AND MINIMUM TPD PATHS" -family "Cyclone II"
	set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON -family "Cyclone II"
	set_global_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION_FOR_NON_GLOBAL_CLOCKS OFF
	set_global_assignment -name ENABLE_ADVANCED_IO_DELAY_CHAIN_OPTIMIZATION OFF
	set_global_assignment -name BLOCK_RAM_TO_MLAB_CELL_CONVERSION ON
	set_global_assignment -name BLOCK_RAM_AND_MLAB_EQUIVALENT_POWER_UP_CONDITIONS AUTO
	set_global_assignment -name BLOCK_RAM_AND_MLAB_EQUIVALENT_PAUSED_READ_CAPABILITIES CARE
	set_global_assignment -name PROGRAMMABLE_POWER_TECHNOLOGY_SETTING "FORCE ALL TILES WITH FAILING TIMING PATHS TO HIGH SPEED"
	set_global_assignment -name PROGRAMMABLE_POWER_MAXIMUM_HIGH_SPEED_FRACTION_OF_USED_LAB_TILES 1.0
	set_global_assignment -name GUARANTEE_MIN_DELAY_CORNER_IO_ZERO_HOLD_TIME ON
	set_global_assignment -name OPTIMIZE_POWER_DURING_FITTING "NORMAL COMPILATION"
	set_global_assignment -name OPTIMIZE_SSN OFF
	set_global_assignment -name OPTIMIZE_TIMING "NORMAL COMPILATION"
	set_global_assignment -name ECO_OPTIMIZE_TIMING OFF
	set_global_assignment -name ECO_REGENERATE_REPORT OFF
	set_global_assignment -name OPTIMIZE_IOC_REGISTER_PLACEMENT_FOR_TIMING NORMAL
	set_global_assignment -name FIT_ONLY_ONE_ATTEMPT OFF
	set_global_assignment -name FINAL_PLACEMENT_OPTIMIZATION AUTOMATICALLY
	set_global_assignment -name FITTER_AGGRESSIVE_ROUTABILITY_OPTIMIZATION AUTOMATICALLY
	set_global_assignment -name SEED 1
	set_global_assignment -name SLOW_SLEW_RATE OFF
	set_global_assignment -name PCI_IO OFF
	set_global_assignment -name TURBO_BIT ON
	set_global_assignment -name WEAK_PULL_UP_RESISTOR OFF
	set_global_assignment -name ENABLE_BUS_HOLD_CIRCUITRY OFF
	set_global_assignment -name AUTO_GLOBAL_MEMORY_CONTROLS OFF
	set_global_assignment -name MIGRATION_CONSTRAIN_CORE_RESOURCES ON
	set_global_assignment -name SET_PULSE_WIDTH WIDTH_0
	set_global_assignment -name LOCAL_LINE_DELAY_CHAIN OFF
	set_global_assignment -name AUTO_PACKED_REGISTERS_STRATIXII AUTO
	set_global_assignment -name AUTO_PACKED_REGISTERS_MAXII AUTO
	set_global_assignment -name AUTO_PACKED_REGISTERS_CYCLONE AUTO
	set_global_assignment -name AUTO_PACKED_REGISTERS OFF
	set_global_assignment -name AUTO_PACKED_REGISTERS_STRATIX AUTO
	set_global_assignment -name NORMAL_LCELL_INSERT ON
	set_global_assignment -name CARRY_OUT_PINS_LCELL_INSERT ON
	set_global_assignment -name AUTO_DELAY_CHAINS ON
	set_global_assignment -name AUTO_FAST_INPUT_REGISTERS OFF
	set_global_assignment -name AUTO_FAST_OUTPUT_REGISTERS OFF
	set_global_assignment -name AUTO_FAST_OUTPUT_ENABLE_REGISTERS OFF
	set_global_assignment -name XSTL_INPUT_ALLOW_SE_BUFFER OFF
	set_global_assignment -name TREAT_BIDIR_AS_OUTPUT OFF
	set_global_assignment -name AUTO_TURBO_BIT ON
	set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC_FOR_AREA OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_COMBO_LOGIC OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_LOG_FILE OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_MAP_LOGIC_TO_MEMORY_FOR_AREA OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_RETIMING OFF
	set_global_assignment -name PHYSICAL_SYNTHESIS_ASYNCHRONOUS_SIGNAL_PIPELINING OFF
	set_global_assignment -name IO_PLACEMENT_OPTIMIZATION ON
	set_global_assignment -name ALLOW_LVTTL_LVCMOS_INPUT_LEVELS_TO_OVERDRIVE_INPUT_BUFFER OFF
	set_global_assignment -name OVERRIDE_DEFAULT_ELECTROMIGRATION_PARAMETERS OFF
	set_global_assignment -name FITTER_EFFORT "AUTO FIT"
	set_global_assignment -name FITTER_AUTO_EFFORT_DESIRED_SLACK_MARGIN "0 ns"
	set_global_assignment -name PHYSICAL_SYNTHESIS_EFFORT NORMAL
	set_global_assignment -name ROUTER_LCELL_INSERTION_AND_LOGIC_DUPLICATION AUTO
	set_global_assignment -name ROUTER_REGISTER_DUPLICATION AUTO
	set_global_assignment -name ALLOW_SERIES_TERMINATION OFF
	set_global_assignment -name ALLOW_SERIES_WITH_CALIBRATION_TERMINATION OFF
	set_global_assignment -name ALLOW_PARALLEL_TERMINATION OFF
	set_global_assignment -name STRATIXGX_ALLOW_CLOCK_FANOUT_WITH_ANALOG_RESET OFF
	set_global_assignment -name AUTO_GLOBAL_CLOCK ON
	set_global_assignment -name AUTO_GLOBAL_OE ON
	set_global_assignment -name AUTO_GLOBAL_REGISTER_CONTROLS ON
	set_global_assignment -name FITTER_EARLY_TIMING_ESTIMATE_MODE REALISTIC
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_UNDER_FULL_DATARATE_RANGE OFF
	set_global_assignment -name STRATIXGX_ALLOW_RX_CORECLK_FROM_NON_RX_CLKOUT_SOURCE_IN_DOUBLE_DATA_WIDTH_MODE OFF
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_IN_DOUBLE_DATA_WIDTH_MODE OFF
	set_global_assignment -name STRATIXGX_ALLOW_PARALLEL_LOOPBACK_IN_DOUBLE_DATA_WIDTH_MODE OFF
	set_global_assignment -name STRATIXGX_ALLOW_XAUI_IN_SINGLE_DATA_WIDTH_MODE OFF
	set_global_assignment -name STRATIXGX_ALLOW_XAUI_WITH_CORECLK_SELECTED_AT_RATE_MATCHER OFF
	set_global_assignment -name STRATIXGX_ALLOW_XAUI_WITH_RX_CORECLK_FROM_NON_TXPLL_SOURCE OFF
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_WITH_CORECLK_SELECTED_AT_RATE_MATCHER OFF
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_WITHOUT_8B10B OFF
	set_global_assignment -name STRATIXGX_ALLOW_GIGE_WITH_RX_CORECLK_FROM_NON_TXPLL_SOURCE OFF
	set_global_assignment -name STRATIXGX_ALLOW_POST8B10B_LOOPBACK OFF
	set_global_assignment -name STRATIXGX_ALLOW_REVERSE_PARALLEL_LOOPBACK OFF
	set_global_assignment -name STRATIXGX_ALLOW_USE_OF_GXB_COUPLED_IOS OFF
	set_global_assignment -name IO_SSO_CHECKING ON
	set_global_assignment -name GENERATE_GXB_RECONFIG_MIF OFF
	set_global_assignment -name GENERATE_GXB_RECONFIG_MIF_WITH_PLL OFF
	set_global_assignment -name UNIPHY_SEQUENCER_DQS_CONFIG_ENABLE OFF
	set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED WITH WEAK PULL-UP"
	set_global_assignment -name ENABLE_HOLD_BACK_OFF ON
	set_global_assignment -name CONFIGURATION_VCCIO_LEVEL AUTO
	set_global_assignment -name FORCE_CONFIGURATION_VCCIO OFF
	set_global_assignment -name SYNCHRONIZER_IDENTIFICATION OFF
	set_global_assignment -name ENABLE_BENEFICIAL_SKEW_OPTIMIZATION ON
	set_global_assignment -name OPTIMIZE_FOR_METASTABILITY ON
	set_global_assignment -name RAM_BLOCK_READ_CLOCK_DUTY_CYCLE_DEPENDENCY ON
	set_global_assignment -name M144K_BLOCK_READ_CLOCK_DUTY_CYCLE_DEPENDENCY OFF
	set_global_assignment -name STRATIXIII_MRAM_COMPATIBILITY ON
	set_global_assignment -name STRATIXIII_LUTAB_SLOWDOWN OFF
	set_global_assignment -name FORCE_FITTER_TO_AVOID_PERIPHERY_PLACEMENT_WARNINGS OFF
	set_global_assignment -name AUTO_C3_M9K_BIT_SKIP OFF
	set_global_assignment -name PR_DONE_OPEN_DRAIN ON
	set_global_assignment -name NCEO_OPEN_DRAIN ON
	set_global_assignment -name ENABLE_CRC_ERROR_PIN OFF
	set_global_assignment -name ENABLE_PR_PINS OFF
	set_global_assignment -name CLAMPING_DIODE OFF
	set_global_assignment -name TRI_STATE_SPI_PINS OFF
	set_global_assignment -name SKIP_CRC_CHECK_IN_HC OFF
	set_global_assignment -name UNUSED_TSD_PINS_GND OFF
	set_global_assignment -name IMPLEMENT_MLAB_IN_16_BIT_DEEP_MODE OFF
	set_global_assignment -name FORM_DDR_CLUSTERING_CLIQUE OFF
	set_global_assignment -name EDA_SIMULATION_TOOL "<None>"
	set_global_assignment -name EDA_TIMING_ANALYSIS_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_TIMING_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_SYMBOL_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_SIGNAL_INTEGRITY_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_BOUNDARY_SCAN_TOOL "<None>"
	set_global_assignment -name EDA_BOARD_DESIGN_TOOL "<None>"
	set_global_assignment -name EDA_FORMAL_VERIFICATION_TOOL "<None>"
	set_global_assignment -name EDA_RESYNTHESIS_TOOL "<None>"
	set_global_assignment -name STRATIX_FAST_PLL_INCREASE_LOCK_WINDOW OFF
	set_global_assignment -name ON_CHIP_BITSTREAM_DECOMPRESSION ON
	set_global_assignment -name COMPRESSION_MODE OFF
	set_global_assignment -name CLOCK_SOURCE INTERNAL
	set_global_assignment -name CONFIGURATION_CLOCK_FREQUENCY "10 MHZ"
	set_global_assignment -name CONFIGURATION_CLOCK_DIVISOR 1
	set_global_assignment -name ENABLE_LOW_VOLTAGE_MODE_ON_CONFIG_DEVICE ON
	set_global_assignment -name FLEX6K_ENABLE_LOW_VOLTAGE_MODE_ON_CONFIG_DEVICE OFF
	set_global_assignment -name FLEX10K_ENABLE_LOW_VOLTAGE_MODE_ON_CONFIG_DEVICE ON
	set_global_assignment -name MAX7000S_JTAG_USER_CODE FFFF
	set_global_assignment -name STRATIX_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name APEX20K_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name MERCURY_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name FLEX10K_JTAG_USER_CODE 7F
	set_global_assignment -name MAX7000_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name MAX7000_USE_CHECKSUM_AS_USERCODE OFF
	set_global_assignment -name USE_CHECKSUM_AS_USERCODE OFF
	set_global_assignment -name SECURITY_BIT OFF
	set_global_assignment -name USE_CONFIGURATION_DEVICE ON -family "Cyclone II"
	set_global_assignment -name CYCLONEIII_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name STRATIXII_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name APEX20K_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name MERCURY_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name FLEX6K_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name FLEX10K_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name CYCLONE_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name STRATIX_CONFIGURATION_DEVICE AUTO
	set_global_assignment -name APEX20K_CONFIG_DEVICE_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name STRATIX_CONFIG_DEVICE_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name MERCURY_CONFIG_DEVICE_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name FLEX10K_CONFIG_DEVICE_JTAG_USER_CODE FFFFFFFF
	set_global_assignment -name EPROM_USE_CHECKSUM_AS_USERCODE OFF
	set_global_assignment -name AUTO_INCREMENT_CONFIG_DEVICE_JTAG_USER_CODE ON
	set_global_assignment -name DISABLE_NCS_AND_OE_PULLUPS_ON_CONFIG_DEVICE OFF
	set_global_assignment -name GENERATE_TTF_FILE OFF
	set_global_assignment -name GENERATE_RBF_FILE OFF
	set_global_assignment -name GENERATE_HEX_FILE OFF
	set_global_assignment -name HEXOUT_FILE_START_ADDRESS 0
	set_global_assignment -name HEXOUT_FILE_COUNT_DIRECTION UP
	set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS OUTPUT DRIVING AN UNSPECIFIED SIGNAL"
	set_global_assignment -name RELEASE_CLEARS_BEFORE_TRI_STATES OFF
	set_global_assignment -name AUTO_RESTART_CONFIGURATION ON
	set_global_assignment -name HARDCOPYII_POWER_ON_EXTRA_DELAY OFF
	set_global_assignment -name STRATIXII_EP2S60ES_ALLOW_MRAM_USAGE OFF
	set_global_assignment -name STRATIXII_ALLOW_DUAL_PORT_DUAL_CLOCK_MRAM_USAGE OFF
	set_global_assignment -name STRATIXII_MRAM_COMPATIBILITY OFF
	set_global_assignment -name CYCLONEII_M4K_COMPATIBILITY ON
	set_global_assignment -name ENABLE_OCT_DONE OFF
	set_global_assignment -name USE_CHECKERED_PATTERN_AS_UNINITIALIZED_RAM_CONTENT OFF
	set_global_assignment -name ARRIAIIGX_RX_CDR_LOCKUP_FIX_OVERRIDE OFF
	set_global_assignment -name ENABLE_AUTONOMOUS_PCIE_HIP OFF
	set_global_assignment -name START_TIME "0 ns"
	set_global_assignment -name SIMULATION_MODE TIMING
	set_global_assignment -name AUTO_USE_SIMULATION_PDB_NETLIST OFF
	set_global_assignment -name ADD_DEFAULT_PINS_TO_SIMULATION_OUTPUT_WAVEFORMS ON
	set_global_assignment -name SETUP_HOLD_DETECTION OFF
	set_global_assignment -name SETUP_HOLD_DETECTION_INPUT_REGISTERS_BIDIR_PINS_DISABLED OFF
	set_global_assignment -name CHECK_OUTPUTS OFF
	set_global_assignment -name SIMULATION_COVERAGE ON
	set_global_assignment -name SIMULATION_COMPLETE_COVERAGE_REPORT_PANEL ON
	set_global_assignment -name SIMULATION_MISSING_1_VALUE_COVERAGE_REPORT_PANEL ON
	set_global_assignment -name SIMULATION_MISSING_0_VALUE_COVERAGE_REPORT_PANEL ON
	set_global_assignment -name GLITCH_DETECTION OFF
	set_global_assignment -name GLITCH_INTERVAL "1 ns"
	set_global_assignment -name SIM_NO_DELAYS OFF
	set_global_assignment -name SIMULATOR_GENERATE_SIGNAL_ACTIVITY_FILE OFF
	set_global_assignment -name SIMULATION_WITH_GLITCH_FILTERING_WHEN_GENERATING_SAF ON
	set_global_assignment -name SIMULATION_BUS_CHANNEL_GROUPING OFF
	set_global_assignment -name SIMULATION_VDB_RESULT_FLUSH ON
	set_global_assignment -name VECTOR_COMPARE_TRIGGER_MODE INPUT_EDGE
	set_global_assignment -name SIMULATION_NETLIST_VIEWER OFF
	set_global_assignment -name SIMULATION_INTERCONNECT_DELAY_MODEL_TYPE TRANSPORT
	set_global_assignment -name SIMULATION_CELL_DELAY_MODEL_TYPE TRANSPORT
	set_global_assignment -name SIMULATOR_GENERATE_POWERPLAY_VCD_FILE OFF
	set_global_assignment -name SIMULATOR_PVT_TIMING_MODEL_TYPE AUTO
	set_global_assignment -name SIMULATION_WITH_AUTO_GLITCH_FILTERING AUTO
	set_global_assignment -name DRC_TOP_FANOUT 50
	set_global_assignment -name DRC_FANOUT_EXCEEDING 30
	set_global_assignment -name DRC_GATED_CLOCK_FEED 30
	set_global_assignment -name ASSG_CAT ON
	set_global_assignment -name ASSG_RULE_MISSING_FMAX ON
	set_global_assignment -name ASSG_RULE_MISSING_TIMING ON
	set_global_assignment -name HARDCOPY_FLOW_AUTOMATION MIGRATION_ONLY
	set_global_assignment -name ENABLE_DRC_SETTINGS OFF
	set_global_assignment -name CLK_RULE_CLKNET_CLKSPINES_THRESHOLD 25
	set_global_assignment -name TIMING_RULE_SHIFT_REG ON
	set_global_assignment -name TIMING_RULE_COIN_CLKEDGE ON
	set_global_assignment -name DRC_DETAIL_MESSAGE_LIMIT 10
	set_global_assignment -name DRC_VIOLATION_MESSAGE_LIMIT 30
	set_global_assignment -name DRC_DEADLOCK_STATE_LIMIT 2
	set_global_assignment -name MERGE_HEX_FILE OFF
	set_global_assignment -name GENERATE_SVF_FILE OFF
	set_global_assignment -name GENERATE_ISC_FILE OFF
	set_global_assignment -name GENERATE_JAM_FILE OFF
	set_global_assignment -name GENERATE_JBC_FILE OFF
	set_global_assignment -name GENERATE_JBC_FILE_COMPRESSED ON
	set_global_assignment -name GENERATE_CONFIG_SVF_FILE OFF
	set_global_assignment -name GENERATE_CONFIG_ISC_FILE OFF
	set_global_assignment -name GENERATE_CONFIG_JAM_FILE OFF
	set_global_assignment -name GENERATE_CONFIG_JBC_FILE OFF
	set_global_assignment -name GENERATE_CONFIG_JBC_FILE_COMPRESSED ON
	set_global_assignment -name GENERATE_CONFIG_HEXOUT_FILE OFF
	set_global_assignment -name ISP_CLAMP_STATE_DEFAULT "TRI-STATE"
	set_global_assignment -name SIGNALPROBE_ALLOW_OVERUSE OFF
	set_global_assignment -name SIGNALPROBE_DURING_NORMAL_COMPILATION OFF
	set_global_assignment -name HUB_ENTITY_NAME sld_hub
	set_global_assignment -name HUB_INSTANCE_NAME auto_hub
	set_global_assignment -name LOGICLOCK_INCREMENTAL_COMPILE_ASSIGNMENT OFF
	set_global_assignment -name POWER_DEFAULT_TOGGLE_RATE 12.5%
	set_global_assignment -name POWER_DEFAULT_INPUT_IO_TOGGLE_RATE 12.5%
	set_global_assignment -name POWER_USE_PVA ON
	set_global_assignment -name POWER_USE_INPUT_FILE "NO FILE"
	set_global_assignment -name POWER_USE_INPUT_FILES OFF
	set_global_assignment -name POWER_VCD_FILTER_GLITCHES ON
	set_global_assignment -name POWER_REPORT_SIGNAL_ACTIVITY OFF
	set_global_assignment -name POWER_REPORT_POWER_DISSIPATION OFF
	set_global_assignment -name POWER_USE_DEVICE_CHARACTERISTICS TYPICAL
	set_global_assignment -name POWER_AUTO_COMPUTE_TJ ON
	set_global_assignment -name POWER_TJ_VALUE 25
	set_global_assignment -name POWER_USE_TA_VALUE 25
	set_global_assignment -name POWER_USE_CUSTOM_COOLING_SOLUTION OFF
	set_global_assignment -name POWER_BOARD_TEMPERATURE 25
	set_global_assignment -name POWER_HPS_ENABLE OFF
	set_global_assignment -name POWER_HPS_PROC_FREQ 0.0
	set_global_assignment -name IGNORE_PARTITIONS OFF
	set_global_assignment -name AUTO_EXPORT_INCREMENTAL_COMPILATION OFF
	set_global_assignment -name RAPID_RECOMPILE_MODE OFF
	set_global_assignment -name QIC_USE_BINARY_DATABASES ON
	set_global_assignment -name ENABLE_ACCELERATED_INCREMENTAL_COMPILE ON
	set_global_assignment -name OUTPUT_IO_TIMING_ENDPOINT "NEAR END"
	set_global_assignment -name RTLV_REMOVE_FANOUT_FREE_REGISTERS ON
	set_global_assignment -name RTLV_SIMPLIFIED_LOGIC ON
	set_global_assignment -name RTLV_GROUP_RELATED_NODES ON
	set_global_assignment -name RTLV_GROUP_COMB_LOGIC_IN_CLOUD OFF
	set_global_assignment -name RTLV_GROUP_COMB_LOGIC_IN_CLOUD_TMV OFF
	set_global_assignment -name RTLV_GROUP_RELATED_NODES_TMV ON
	set_global_assignment -name EQC_CONSTANT_DFF_DETECTION ON
	set_global_assignment -name EQC_DUPLICATE_DFF_DETECTION ON
	set_global_assignment -name EQC_BBOX_MERGE ON
	set_global_assignment -name EQC_LVDS_MERGE ON
	set_global_assignment -name EQC_RAM_UNMERGING ON
	set_global_assignment -name EQC_DFF_SS_EMULATION ON
	set_global_assignment -name EQC_RAM_REGISTER_UNPACK ON
	set_global_assignment -name EQC_MAC_REGISTER_UNPACK ON
	set_global_assignment -name EQC_SET_PARTITION_BB_TO_VCC_GND ON
	set_global_assignment -name EQC_STRUCTURE_MATCHING ON
	set_global_assignment -name EQC_AUTO_BREAK_CONE ON
	set_global_assignment -name EQC_POWER_UP_COMPARE OFF
	set_global_assignment -name EQC_AUTO_COMP_LOOP_CUT ON
	set_global_assignment -name EQC_AUTO_INVERSION ON
	set_global_assignment -name EQC_AUTO_TERMINATE ON
	set_global_assignment -name EQC_SUB_CONE_REPORT OFF
	set_global_assignment -name EQC_RENAMING_RULES ON
	set_global_assignment -name EQC_PARAMETER_CHECK ON
	set_global_assignment -name EQC_AUTO_PORTSWAP ON
	set_global_assignment -name EQC_DETECT_DONT_CARES ON
	set_global_assignment -name EQC_SHOW_ALL_MAPPED_POINTS OFF
	set_global_assignment -name TESTING_BOOL ON
	set_global_assignment -name STRATIXV_CONFIGURATION_SCHEME "PASSIVE SERIAL"
	set_global_assignment -name TOP_LEVEL_ENTITY CE381HW
	set_global_assignment -name PARTITION_PRESERVE_HIGH_SPEED_TILES ON -section_id Top
	set_global_assignment -name PARTITION_IGNORE_SOURCE_FILE_CHANGES OFF -section_id Top
	set_global_assignment -name PARTITION_ALWAYS_USE_QXP_NETLIST OFF -section_id Top
	set_global_assignment -name PARTITION_IMPORT_ASSIGNMENTS ON -section_id Top
	set_global_assignment -name PARTITION_IMPORT_EXISTING_ASSIGNMENTS REPLACE_CONFLICTING -section_id Top
	set_global_assignment -name PARTITION_IMPORT_EXISTING_LOGICLOCK_REGIONS REPLACE_CONFLICTING -section_id Top
	set_global_assignment -name PARTITION_IMPORT_PIN_ASSIGNMENTS ON -section_id Top
	set_global_assignment -name PARTITION_IMPORT_PROMOTE_ASSIGNMENTS ON -section_id Top
	set_global_assignment -name PARTITION_TYPE STANDARD_PARTITION -section_id Top
	set_global_assignment -name ALLOW_MULTIPLE_PERSONAS OFF -section_id Top
	set_global_assignment -name PARTITION_EXTRACT_HARD_BLOCK_NODES ON -section_id Top
	set_global_assignment -name EDA_RTL_SIM_MODE NOT_USED -section_id eda_simulation

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}