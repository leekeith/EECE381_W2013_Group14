/*
 * drawBg.c
 *
 *  Created on: 2013-09-28
 *      Author: Keith
 */

#include"wk_video.h"
#include"game.h"
#include<system.h>

void drawBg(pixel_buffer_t* screen)
{
	unsigned short water;
	unsigned short land;
	water=mkColor(0,32,255);
	land=mkColor(0,255,32);
	fillScr(screen, land);
	drawBox(screen, (VRAM_W/4),0, ((3*VRAM_W)/4),VRAM_H, water,1);
}

void drawSprite(pixel_buffer_t* screen, sprite* the_sprite)
{
	short hue;
	hue=mkColor(128,32,32);

	drawBox(screen, the_sprite->loc.x-6,the_sprite->loc.y-6, the_sprite->loc.x+6,the_sprite->loc.y+6, hue,1);
}
