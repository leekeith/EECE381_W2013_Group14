/*
 * wk_io.c
 *
 *  Created on: 2013-09-18
 *      Author: keithlee
 */

#include"wk_io.h"
#include<io.h>
#include<system.h>

/*
 * InitHex: sets pointers of Hex[] to addresses of 7-segs and clears them
 */
void initHex()
{
	int i;
	Hex[0]=HEX0_ADDR;
	Hex[1]=HEX1_ADDR;
	Hex[2]=HEX2_ADDR;
	Hex[3]=HEX3_ADDR;
	Hex[4]=HEX4_ADDR;
	Hex[5]=HEX5_ADDR;
	Hex[6]=HEX6_ADDR;
	Hex[7]=HEX7_ADDR;
	clrHex();

}

/*
 * Converts an integer value into digits of base 2 - 16 and displays
 * them on the Hex output
 */
void hexPrintNum(int num,const int base)
{
	int i,digit;
	if(base>16 || base<=1)
		return;
	if(num==0)
	{
		*Hex[0]=DIGIT0;
		for(i=1;i<8;i++)
		{
			IOWR_8DIRECT(Hex[i],0,DIGIT_BLANK);
		}
	}
	else
	{
		for(i=0;i<8;i++)
		{
			if(num!=0)
			{
				digit=num%base;
				switch(digit)
				{
				case 0:
					IOWR_8DIRECT(Hex[i],0,DIGIT0);
					break;
				case 1:
					IOWR_8DIRECT(Hex[i],0,DIGIT1);
					break;
				case 2:
					IOWR_8DIRECT(Hex[i],0,DIGIT2);
					break;
				case 3:
					IOWR_8DIRECT(Hex[i],0,DIGIT3);
					break;
				case 4:
					IOWR_8DIRECT(Hex[i],0,DIGIT4);
					break;
				case 5:
					IOWR_8DIRECT(Hex[i],0,DIGIT5);
					break;
				case 6:
					IOWR_8DIRECT(Hex[i],0,DIGIT6);
					break;
				case 7:
					IOWR_8DIRECT(Hex[i],0,DIGIT7);
					break;
				case 8:
					IOWR_8DIRECT(Hex[i],0,DIGIT8);
					break;
				case 9:
					IOWR_8DIRECT(Hex[i],0,DIGIT9);
					break;
				case 10:
					IOWR_8DIRECT(Hex[i],0,DIGITA);
					break;
				case 11:
					IOWR_8DIRECT(Hex[i],0,DIGITB);
					break;
				case 12:
					IOWR_8DIRECT(Hex[i],0,DIGITC);
					break;
				case 13:
					IOWR_8DIRECT(Hex[i],0,DIGITD);
					break;
				case 14:
					IOWR_8DIRECT(Hex[i],0,DIGITE);
					break;
				case 15:
					IOWR_8DIRECT(Hex[i],0,DIGITF);
					break;
				default:
					IOWR_8DIRECT(Hex[i],0,DIGIT_BLANK);
					break;
				}
				if(digit==0)
					num=num/base;
				else
					num=(num-digit)/base;
			}
			else
				IOWR_8DIRECT(Hex[i],0,DIGIT_BLANK);
		}
	}
}

/*
 * Blacks out all 7-segs
 */
void clrHex()
{
	int i;
	for(i=0;i<8;i++)
	{
		IOWR_8DIRECT(Hex[i],0,DIGIT_BLANK);
	}
}


