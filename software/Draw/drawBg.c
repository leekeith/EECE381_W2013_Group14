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
#define CENTER_X (VRAM_W/2)
#define CENTER_Y (VRAM_H/2)
#define TXT_CTR_X 40
#define TXT_CTR_Y 30

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
const char* option1="View Leaderboard";
const char* option2="Return to Game";
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
		case bullet:
			rad=1;
			hue = mkColor(50,50,50);
			break;
		case bullet_npc:
			rad = 1;
			hue = mkColor(200,200,200);
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
			case bullet:
				drawSprite(screen, &npcs[i]);
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

			if (npcs[i].type==bullet)
			{

				if (npcs[i].dir==1)
				{
					npcs[i].loc.x-=2*scrollRate;
					npcs[i].loc.y+=2*scrollRate;
				}
				else if (npcs[i].dir==2)
					npcs[i].loc.y+=2*scrollRate;
				else if (npcs[i].dir==3)
				{
					npcs[i].loc.x+=2*scrollRate;
					npcs[i].loc.y+=2*scrollRate;
				}
				else if (npcs[i].dir==4)
					npcs[i].loc.x-=2*scrollRate;
				else if (npcs[i].dir==6)
					npcs[i].loc.x+=2*scrollRate;
				else if (npcs[i].dir==7)
				{
					npcs[i].loc.x-=2*scrollRate;
					npcs[i].loc.y-=2*scrollRate;
				}
				else if (npcs[i].dir==8)
					npcs[i].loc.y-=2*scrollRate;
				else if (npcs[i].dir==9)
				{
					npcs[i].loc.x+=2*scrollRate;
					npcs[i].loc.y-=2*scrollRate;
				}
			if(npcs[i].loc.y>=VRAM_H+3 || npcs[i].loc.y<=3 || npcs[i].loc.x>=VRAM_W-3 || npcs[i].loc.x<=3)
					npcs[i].type=null;
			}
		}
	}
}

void draw_health(pixel_buffer_t* screen, sprite* c)
{
	short red=mkColor(0xff,0,0);
	drawBox(screen,4,4 ,62,20,0,1);
	drawBox(screen,3,3 ,63,21,0xffff,0);
	drawBox(screen,8,6 ,58,12,red,0);
	drawBox(screen,8,6, 8+(c->health/2),12,red,1);
}

void drawMenuBg(pixel_buffer_t* screen, int* sz, int max)
{
	if(*sz<max)
			*sz=(*sz)+2;
		drawBox(screen, CENTER_X-*sz,CENTER_Y-*sz, CENTER_X+*sz,CENTER_Y+*sz, 0,1);
		drawBox(screen, CENTER_X-*sz,CENTER_Y-*sz, CENTER_X+*sz,CENTER_Y+*sz, 0xffff,0);
}

void drawMenu(pixel_buffer_t* screen, char_buffer_t* text, int* sz, int sel)
{
	int sel_line;
	switch(sel)
	{
	case 0:
		sel_line=TXT_CTR_Y-1;
		break;
	case 1:
	default:
		sel_line=TXT_CTR_Y+1;
		break;
	}
	drawMenuBg(screen,sz,50);
	if(*sz>40)
	{
		drawString(text, "->",TXT_CTR_X-((strlen(option1))/2)-3, sel_line);
		drawString(text, option1, TXT_CTR_X-(strlen(option1))/2, TXT_CTR_Y-1);
		drawString(text, option2, TXT_CTR_X-(strlen(option1))/2, TXT_CTR_Y+1);
	}
}
void npc_shoot(sprite* bullets, sprite* shooter)
{
	int i=0;
	while(i<MAX_NPC && bullets[i].type!=null)
		i++;
	if(i==MAX_NPC)
		return;
	bullets[i].type = bullet;
	bullets[i].health = 5;
	bullets[i].loc.x = shooter[i].loc.x;
	bullets[i].loc.y = shooter[i].loc.y;
}
void player_shoot(sprite* bullets, int locx, int locy, short dir)
{
	int i=0;
	while(i<MAX_NPC && bullets[i].type!=null)
		i++;
	if(i==MAX_NPC)
		return;
	bullets[i].type = bullet;
	bullets[i].loc.x = locx;
	bullets[i].loc.y = locy-8;
	bullets[i].dir = dir;
}

void printGameOver(char_buffer_t* text,char* player_name)
{
	drawString(text, "GAME OVER", TXT_CTR_X-4,TXT_CTR_Y-1);
	drawString(text, "Enter Your Name", TXT_CTR_X-7,TXT_CTR_Y);
	drawString(text, player_name, TXT_CTR_X-5,TXT_CTR_Y+1);
}
