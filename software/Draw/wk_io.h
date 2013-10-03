/*
 * wk_io.h
 *
 *  Created on: 2013-09-18
 *      Author: keithlee
 */

#ifndef WK_IO_H_
#define WK_IO_H_

#include <system.h>
#include<io.h>
#include"altera_avalon_pio_regs.h"
#include <nios2.h>

unsigned char* Hex[8];

#define LEDG_ADDR 	LEDG_BASE
#define LEDR_ADDR 	LEDR_BASE
#define SW_ADDR		SWITCHES_BASE
#define KEY_ADDR	KEYS_BASE
#define HEX0_ADDR	HEX0_BASE
#define HEX1_ADDR	HEX1_BASE
#define HEX2_ADDR	HEX2_BASE
#define HEX3_ADDR	HEX3_BASE
#define HEX4_ADDR	HEX4_BASE
#define HEX5_ADDR	HEX5_BASE
#define HEX6_ADDR	HEX6_BASE
#define HEX7_ADDR	HEX7_BASE


/*
 * digits 0-F in 7-seg output form
 */

#define DIGIT0 	0x40
#define DIGIT1 0x79
#define DIGIT2 0x24
#define DIGIT3 0x30
#define DIGIT4 0x19
#define DIGIT5 0x12
#define DIGIT6 0x02
#define DIGIT7 0x78
#define DIGIT8 0x00
#define DIGIT9 0x10
#define DIGITA 0x08
#define DIGITB 0x03
#define DIGITC 0x27
#define DIGITD 0x21
#define DIGITE 0x06
#define DIGITF 0x0e
#define DIGIT_BLANK 0x7f


/*
 * Helper functions for using the 7-seg display
 */
void initHex();
void hexPrintNum(int num, int base);
void clrHex();


/*
 * I/O read/write macros
 */
//Get switches
#define GET_SW\
		IORD_32DIRECT(SW_ADDR,0)
//Get Keys
#define GET_KEYS\
		IORD_8DIRECT(KEY_ADDR,0)

//Set green LEDs
#define SET_LEDG(val)\
		IOWR_8DIRECT(LEDG_ADDR,0,val)

//Set red LEDs
#define SET_LEDR(val)\
		IOWR_32DIRECT(LEDR_ADDR,0,val)


#endif /* WK_IO_H_ */
