/*
 * wk_main.c
 *
 *  Created on: 2013-09-17
 *      Author: keithlee
 */
#include <system.h>
#include<io.h>
#include<nios2.h>
#include "wk_video.h"
#include "wk_io.h"
#include "wk_lcd.h"
int main(int argc, char** argv)
{
	lcd_t* lcd;
	unsigned int old_sw, new_sw;
	unsigned int x1, x2, y1, y2;

	lcd=(lcd_t*)malloc(sizeof(lcd_t));



	pixel_buffer_t* pBuffer;
	char_buffer_t* cBuffer;
	initHex();
	lcdInit(lcd);
	pBuffer=pixelInit();
	cBuffer=charInit();
	clrScr(pBuffer);
	clearChars(cBuffer);

	x1=5;
	x2=40;
	y1=200;
	y2=200;
	//drawString(cBuffer,"EECE 381 : Exercise 1.4 : Keith Lee",40,40);
	lcdLineSet(lcd,"Welcome to",0);
	lcdLineSet(lcd,"Working Test",1);
	old_sw=GET_SW;



	while(1)
	{

		new_sw=GET_SW;
		SET_LEDR(new_sw);
		SET_LEDG(GET_KEYS);
		if(new_sw%2==1)
		{
			if(old_sw!=new_sw)
			{
				clearChars(cBuffer);
				lcdClrScr(lcd);
			}

			lcdPrint(lcd);
			hexPrintNum(360*old_sw, 10);
		}
		else
		{
			if(old_sw!=new_sw)
			{
				clearChars(cBuffer);
				drawString(cBuffer,"EECE 381 : Exercise 1.4 : Keith Lee",new_sw%80,old_sw%60);
				lcdLineSet(lcd,"Line 1",0);
				lcdLineSet(lcd,"Line 2",1);
			}
			lcdPrint(lcd);
			hexPrintNum(360*old_sw,16);
		}
		x1=(x1++)%320;
		x2=(x2--)%320;
		y1=(y1--)%240;
		y2=(y2++)%240;
		fillScr(pBuffer,0xf0ff);
		drawLine(pBuffer,x1,40,10,y1,0xffff);
		drawLine(pBuffer,x2,200,y2,0,0x0);
		swapBuffer(pBuffer);
		old_sw=new_sw;
	}
	return 0;
}


