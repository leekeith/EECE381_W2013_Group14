/*
 * wk_lcd.h
 *
 *  Created on: 2013-09-18
 *      Author: keithlee
 */

#ifndef WK_LCD_H_
#define WK_LCD_H_

#include<system.h>
#include<drivers/inc/altera_up_avalon_character_lcd.h>

#define BLANK_LINE "                "

typedef struct lcd	{
						alt_up_character_lcd_dev* device;
						char* line[2];
						short sel[2];
					}lcd_t;

void lcdInit(lcd_t* the_lcd);

void lcdPrint(lcd_t* the_lcd);

void lcdLineSet(lcd_t* the_lcd, char* str, short line_no);

void lcdClrScr(lcd_t* the_lcd);






#endif /* WK_LCD_H_ */
