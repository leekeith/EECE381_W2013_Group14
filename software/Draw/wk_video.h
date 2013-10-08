/*
 * wk_video.h
 *
 *  Created on: 2013-09-17
 *      Author: keithlee
 */

#ifndef WK_VIDEO_H_
#define WK_VIDEO_H_

#include <system.h>
#include <drivers/inc/altera_up_avalon_video_character_buffer_with_dma.h>
#include <drivers/inc/altera_up_avalon_video_pixel_buffer_dma.h>
#include <string.h>

#define VRAM_ADDR 		SRAM_BASE
#define CHARBUFF_NAME 	"/dev/char_buffer"
#define PIXBUFF_NAME	PIXEL_BUFFER_NAME
#define VRAM_W			320
#define VRAM_H			240

typedef alt_up_pixel_buffer_dma_dev 	pixel_buffer_t;
typedef alt_up_char_buffer_dev 			char_buffer_t;
typedef struct coord{int x,y;}coord_t;

char_buffer_t* charInit();

pixel_buffer_t* pixelInit();

inline void clrScr(pixel_buffer_t* screen);

inline void fillScr(pixel_buffer_t* screen, int color);

inline void drawLine(pixel_buffer_t* screen, int x0,int x1, int y0,int y1, int color);

inline void drawBox(pixel_buffer_t* screen, int x0,int y0, int x1,int y1, int color, int fill);

inline void drawPoly(pixel_buffer_t* screen, coord_t* points, int pt_count, int color);

inline void swapBuffer(pixel_buffer_t* screen);

inline short mkColor(char R, char G, char B);

inline void showHealth(int health);
//////////////////////////////
//Char Functions
//////////////////////////////

#define drawChar(char_buffer, ch, x, y)\
{\
	do{\
		alt_up_char_buffer_draw(char_buffer, ch, x, y);\
	}while(0);\
}\

#define drawString(char_buffer, str, x, y)\
{\
	do{\
		alt_up_char_buffer_string(char_buffer, str, x, y);\
	}while(0);\
}\

#define clearChars(char_buffer)\
{\
	do{\
		alt_up_char_buffer_clear(char_buffer);\
	}while(0);\
}\




#endif /* WK_VIDEO_H_ */
