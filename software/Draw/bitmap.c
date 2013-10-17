/*
 * bitmap.c
 *
 *  Created on: 2013-10-09
 *      Author: Keith
 */
#include"stdio.h"
#include"wkAll.h"
#include"sdcard.h"
#include"bitmap.h"
#include"nios2.h"
#include"stdlib.h"

bitmap_t* bitmap_getBmp(char* file_name)
{
	int i;
	bitmap_t* the_bmp;
	void* temp_ptr;
	the_bmp=(bitmap_t*)malloc(sizeof(bitmap_t));
	the_bmp->handle=sdcard_fopen(file_name,0);
	for(i=0;i<54;i++)
		the_bmp->head[i]=(unsigned char)sdcard_readbyte(the_bmp->handle);
	if(the_bmp->head[0]!='B'||the_bmp->head[1]!='M')
	{
		free(the_bmp);
		return 0;
	}
	temp_ptr=the_bmp->head+0x22;
	the_bmp->size=*(int*)temp_ptr;
	temp_ptr=the_bmp->head+0xA;
	the_bmp->offset=*(int*)temp_ptr;
	temp_ptr=the_bmp->head+0x12;
	the_bmp->width=*(int*)temp_ptr;
	temp_ptr=the_bmp->head+0x16;
	the_bmp->height=*(int*)temp_ptr;
	the_bmp->data=(char*)malloc((the_bmp->size)*sizeof(char));
	while(i<the_bmp->offset)
	{
		sdcard_readbyte(the_bmp->handle);
		i++;
	}
	for(i=0;i<the_bmp->size;i++)
		the_bmp->data[i]=(char)sdcard_readbyte(the_bmp->handle);
	sdcard_fclose(the_bmp->handle);
	return the_bmp;
}

void bitmap_to16bit(bitmap_t* the_bmp)
{
	int size=(the_bmp->size)/3;
	char red;
	char green;
	char blue;
	short* bmp16bit;
	bmp16bit=(short*)malloc(size*sizeof(short));
	int i;
	for(i=0;i<size;i++)
	{
		blue=the_bmp->data[(3*i)];
		green=the_bmp->data[(3*i)+1];
		red=the_bmp->data[(3*i)+2];
		bmp16bit[i]=mkColor(red,green,blue);
	}
	the_bmp->offset=0;
	the_bmp->size=size;
	free(the_bmp->data);
	the_bmp->data16b=bmp16bit;
}

void bitmap_drawToScr(bitmap_t* the_bmp, pixel_buffer_t* screen, int x, int y)
{
	int i,j,newX,newY;
	for(i=0;i<the_bmp->height;i++)
	{
		for(j=0;j<the_bmp->width;j++)
		{
			newX=x-(the_bmp->width/2)+j;
			newY=y-(the_bmp->height/2)+i;
			if(newX>=0&&newY>=0&&the_bmp->data16b[(i*the_bmp->width)+j]!=-1)
				alt_up_pixel_buffer_dma_draw(screen,the_bmp->data16b[(i*the_bmp->width)+j],newX, newY);
		}
	}

}

void scrolling_bgDrawToScr(scrolling_bmp_t* bmp, int scroll_rate, pixel_buffer_t* screen)
{
	unsigned int offset;
	int i,j,imax,jmax;
	offset=bmp->first_row*bmp->width;
	if(bmp->height>VRAM_H)
		imax=VRAM_H;
	else
		imax=bmp->height;
	if(bmp->width>VRAM_W)
		jmax=VRAM_W;
	else
		jmax=bmp->width;
	for(i=0;i<imax;i++)
	{
		for(j=0;j<jmax;j++)
		{
			alt_up_pixel_buffer_dma_draw(screen,bmp->data16b[(offset+(i*bmp->width)+j)%bmp->size],j,i);
		}
	}
	if(bmp->first_row>=scroll_rate)
		bmp->first_row=bmp->first_row-scroll_rate;
	else
		bmp->first_row=bmp->height+bmp->first_row-scroll_rate;
}

scrolling_bmp_t* bitmap_makeScrolling(bitmap_t* bmp)
{
	scrolling_bmp_t* scroller;
	scroller=(scrolling_bmp_t*)malloc(sizeof(scrolling_bmp_t));
	scroller->data16b=bmp->data16b;
	scroller->handle=bmp->handle;
	scroller->size=bmp->size;
	scroller->first_row=0;
	scroller->width=bmp->width;
	scroller->height=bmp->height;
	return scroller;
}

