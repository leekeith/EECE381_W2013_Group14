/*
 * wk_lcd.c
 *
 *  Created on: 2013-09-18
 *      Author: keithlee
 */

#include"system.h"
#include<stdlib.h>
#include<stdio.h>
#include<nios2.h>
#include<string.h>
#include"wk_lcd.h"


/*
 * Configures the 16x2 LCD display for use
 */
void lcdInit(lcd_t* the_lcd)
{
	the_lcd->device=alt_up_character_lcd_open_dev ("/dev/lcd");
	alt_up_character_lcd_init (the_lcd->device);
	the_lcd->line[0]=(char*)malloc(17*sizeof(char));
	the_lcd->line[1]=(char*)malloc(17*sizeof(char));
	the_lcd->sel[0]=0;
	the_lcd->sel[0]=0;
}

/*
 * Writes stored strings of flagged/selected lines to the LCD HW
 * Unflags written lines
 */
void lcdPrint(lcd_t* the_lcd)
{
	int i;
	for(i=0;i<2;i++)
	{
		if(the_lcd->sel[i]!=0)
		{
			alt_up_character_lcd_set_cursor_pos(the_lcd->device, 0,i);
			alt_up_character_lcd_string(the_lcd->device, the_lcd->line[i]);
			the_lcd->sel[i]=0;
		}
	}
}

/*
 * Sets the string to be printed to either line 0 or line 1
 * Flags the line for output
 */
void lcdLineSet(lcd_t* the_lcd, char* str, short line_no)
{

	int i;
	int len;
	len=strlen(str);
	if(len>17)
		str[16]=0;

	strcpy(the_lcd->line[line_no], str);
	if(len<17) for(i=len;i<16;i++)
			the_lcd->line[line_no][i]=' ';
	the_lcd->sel[line_no]=1;

}


/*
 * Sets each line to a string of spaces
 * Flags both lines for writing
 */
void lcdClrScr(lcd_t* the_lcd)
{
	strcpy(the_lcd->line[0], BLANK_LINE);
	strcpy(the_lcd->line[1], BLANK_LINE);
	the_lcd->sel[0]=1;
	the_lcd->sel[1]=1;
}

