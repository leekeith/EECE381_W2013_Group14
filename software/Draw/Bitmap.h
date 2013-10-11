/*
 * Bitmap.h
 *
 *  Created on: 2013-10-09
 *      Author: Keith
 */

#ifndef BITMAP_H_
#define BITMAP_H_

#include "stdio.h"
#include "stddef.h"
#include "sdcard.h"
#define BYTES_PER_PIX 3

typedef struct scrolling_bmp_s
	{
		short int handle;
		unsigned char head[54];
		unsigned int size;
		short* data16b;
		int width;
		int height;
		int first_row;
	}scrolling_bmp_t;

typedef struct bitmap_s
	{	short int handle;
		char head[54];
		int size;
		int offset;
		char* data;
		short* data16b;
		int width;
		int height;
	}bitmap_t;

bitmap_t* bitmap_getBmp(char* file_name);

scrolling_bmp_t* bitmap_makeScrolling(bitmap_t* bmp);

void bitmap_to16bit(bitmap_t* the_bmp);

void bitmap_drawToScr(bitmap_t* the_bmp, pixel_buffer_t* screen, int x, int y);

void scrolling_bgDrawToScr(scrolling_bmp_t* bmp, int scroll_rate, pixel_buffer_t* screen);


#endif /* BITMAP_H_ */
