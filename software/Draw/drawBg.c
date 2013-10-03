/*
 * drawBg.c
 *
 *  Created on: 2013-09-28
 *      Author: Keith
 */

#include"wk_video.h"
#include"game.h"
#include"stdlib.h"
#include<system.h>
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
		hue=mkColor(128-(32*(int)the_sprite->type),32,32);
		switch(the_sprite->type)
		{
		case player:
			rad=6;
			break;
		case enemy1:
			rad=3;
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
	npcs[i].type=enemy1;
	npcs[i].health=100;

	do{
		npcs[i].loc.x=rand()%VRAM_W;
	}while(npcs[i].loc.x>(VRAM_W/4)-3 && npcs[i].loc.x<((3*VRAM_W)/4)+3);

	//npcs[i].loc.x=PLAYER_LB-10;
	npcs[i].loc.y=0;
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
