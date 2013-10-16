/*
 * drawBg.c
 *
 *  Created on: 2013-09-28
 *      Author: Keith
 */

#include"wk_video.h"
#include"game.h"
#include"stdlib.h"
#include"bitmap.h"
#include<system.h>
#include<stdbool.h>
#include<string.h>

extern int scrollRate;
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
	short rad;
	if(the_sprite->type!=null)
	{
		hue=mkColor(255-(32*(int)the_sprite->type),(255- 32*(int)the_sprite->type),64);
		switch(the_sprite->type)
		{
		case player:
			rad=6;
			break;
		case enemy1:
			rad=3;
			break;
		case enemy2:
			rad=8;
			break;
		default:
			break;
		}
		if(the_sprite->loc.x>=rad && the_sprite->loc.y>=rad)
			drawBox(screen, the_sprite->loc.x-rad,the_sprite->loc.y-rad, the_sprite->loc.x+rad,the_sprite->loc.y+rad, hue,1);
		else if(the_sprite->loc.x>=rad)
			drawBox(screen,the_sprite->loc.x-rad,0, the_sprite->loc.x+rad,the_sprite->loc.y+rad, hue,1);
		else if(the_sprite->loc.y>=rad)
			drawBox(screen, 0,the_sprite->loc.y-rad, the_sprite->loc.x+rad,the_sprite->loc.y+rad, hue,1);
		else
			drawBox(screen, 0,0, the_sprite->loc.x+rad,the_sprite->loc.y+rad, hue,1);

	}
}
void makeNPC(sprite* npcs)
{
	int i=0;
	while(i<MAX_NPC && npcs[i].type!=null)
		i++;
	if(i==MAX_NPC)
		return;

	if(i%2 == 0)
	{
		npcs[i].type=enemy1;
		npcs[i].health=100;

		do{
			npcs[i].loc.x=rand()%VRAM_W;
		}while(npcs[i].loc.x>(VRAM_W/4)-5 && npcs[i].loc.x<((3*VRAM_W)/4)+5);
	}
	else
	{
		npcs[i].type=enemy2;
		npcs[i].health=100;

		do{
			npcs[i].loc.x=rand()%VRAM_W;
		}while(npcs[i].loc.x<(VRAM_W/4)+8 || npcs[i].loc.x>((3*VRAM_W)/4)-8);
	}

	//npcs[i].loc.x=PLAYER_LB-10;
	npcs[i].loc.y=0;
}
void bitmap_drawNPCs(bitmap_t** enemy_bmps, pixel_buffer_t* screen, sprite* npcs, int eTypeCnt)
{
	int i;
	for(i=0;i<MAX_NPC;i++)
	{
		if(npcs[i].type!=null)
		{
			switch(npcs[i].type)
			{
			case enemy1:
				bitmap_drawToScr(enemy_bmps[0],screen,npcs[i].loc.x,npcs[i].loc.y);
				break;
			case enemy2:
				bitmap_drawToScr(enemy_bmps[1],screen,npcs[i].loc.x,npcs[i].loc.y);
				break;
			default:
				break;
			}

			npcs[i].loc.y+=scrollRate;
			if(npcs[i].loc.y>=VRAM_H+3)
				npcs[i].type=null;
		}
	}
}
void drawNPCs(pixel_buffer_t* screen, sprite* npcs)
{
	int i;
	for(i=0;i<MAX_NPC;i++)
	{
		if(npcs[i].type!=null)
		{

			drawSprite(screen, &(npcs[i]));

			npcs[i].loc.y+=scrollRate;
			if(npcs[i].loc.y>=VRAM_H+3)
				npcs[i].type=null;
		}
	}
}

void draw_health(pixel_buffer_t* screen, sprite* c)
{
	short red=mkColor(0xff,0,0);
	drawBox(screen,4,4 ,62,20,0,1);
	drawBox(screen,8,6 ,58,12,red,0);
	drawBox(screen,8,6, 8+(c->health/2),12,red,1);
}
