/*
 * wk_video.c
 *
 *  Created on: 2013-09-17
 *      Author: keithlee
 */


#include"wk_video.h"
//#define SCR_NOWAIT
#define VRAM_W 320
#define VRAM_H 240
#define VRAM_D 2



////////////////////////////////
//Initializers
///////////////////////////////

/*
 * Initializes the character buffer for use
 */
char_buffer_t* charInit()
{
	char_buffer_t* ch_buff;
	ch_buff=alt_up_char_buffer_open_dev(CHARBUFF_NAME);
	alt_up_char_buffer_init(ch_buff);
	return ch_buff;
}

/*
 * Initializes the pixel buffers and sets their base addresses in SRAM
 */
pixel_buffer_t* pixelInit()
{
	pixel_buffer_t* pix_buff;
	pix_buff=alt_up_pixel_buffer_dma_open_dev(PIXBUFF_NAME);
	alt_up_pixel_buffer_dma_change_back_buffer_address(pix_buff,VRAM_ADDR);
	alt_up_pixel_buffer_dma_swap_buffers(pix_buff);
	while(alt_up_pixel_buffer_dma_check_swap_buffers_status(pix_buff));
	alt_up_pixel_buffer_dma_change_back_buffer_address(pix_buff,VRAM_ADDR+(SRAM_SPAN/2));
	return pix_buff;
}



///////////////////////////////
//Draw functions
//////////////////////////////

inline void clrScr(pixel_buffer_t* screen)
{
	alt_up_pixel_buffer_dma_clear_screen(screen,0);
	alt_up_pixel_buffer_dma_clear_screen(screen,1);
}

inline void fillScr(pixel_buffer_t* screen, int color)
{
	alt_up_pixel_buffer_dma_draw_box(screen, 0,0, VRAM_W,VRAM_H, color, 1);
}

inline void drawLine(pixel_buffer_t* screen, int x0,int x1, int y0,int y1, int color)
{
	if(x0==x1)
		alt_up_pixel_buffer_dma_draw_vline(screen, x0, y0,y1, color,1);
	else if(y0==y1)
		alt_up_pixel_buffer_dma_draw_hline(screen, x0,x1, y0, color,1);
	else
		alt_up_pixel_buffer_dma_draw_line(screen, x0,x1, y0,y1, color,1);
}

inline void drawBox(pixel_buffer_t* screen, int x0,int y0, int x1,int y1, int color, int fill)
{
	if(fill!=0)
		alt_up_pixel_buffer_dma_draw_box(screen, x0,y0, x1,y1,  color,1);
	else
		alt_up_pixel_buffer_dma_draw_rectangle(screen, x0,y0, x1,y1,  color,1);
}

inline void drawPoly(pixel_buffer_t* screen, coord_t* points, int pt_count, int color)
{
	int i;
	for(i=0;i<pt_count;i++)
		drawLine(screen, points[i].x, points[(i+1)%pt_count].x, points[i].y, points[(i+1)%pt_count].y, color);
}

inline void swapBuffer(pixel_buffer_t* screen)
{
	alt_up_pixel_buffer_dma_swap_buffers(screen);
#ifndef SCR_NOWAIT
	while(alt_up_pixel_buffer_dma_check_swap_buffers_status(screen));
#endif
}

inline short mkColor(char R, char G, char B)
{
	return ((short)(R&0xf8)<<8)|((short)(G&0xfc)<<3)|((short)(B&0xf8)>>3);
}
