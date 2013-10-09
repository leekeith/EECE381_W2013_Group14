/*
 * DrawMain.c
 *
 *  Created on: 2013-09-30
 *      Author: Keith
 */
#include"wkAll.h"
#include"game.h"
#include"system.h"
#include"nios2.h"
#include"sys/alt_irq.h"
#include<sys/alt_alarm.h>
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "sdcard.h"
#include<stdbool.h>
#include<string.h>
#include<stdlib.h>
#include <stdio.h>

volatile char movchar;

int scrollRate;
kb_t* kb;

void drawBg(pixel_buffer_t* screen);

void drawSprite(pixel_buffer_t* screen, sprite* the_sprite);

void makeNPC(sprite* npcs);


alt_u32 draw(void* screen)
{
	movchar=0;

	return 1;
}

void key_hit(void* context, alt_u32 id)
{

	readFromKb(kb);
	return;

}

void display_score(char_buffer_t* text)
{
	char read_data [30] = {0};
	char sc1 [4] = {0};
	char sc2 [4] = {0};
	char sc3 [4] = {0};
	char sc4 [4] = {0};
	char sc5 [4] = {0};
	char leaderboards[24] = "Leader Boards:";

	File score;
	score.file_name = "score.txt";
	score.file_handle = sdcard_fopen(score.file_name,false);
	sdcard_readfile(read_data , score.file_handle);

	sdcard_fclose(score.file_handle);


	sc1[0]=read_data[0];
	sc1[1]=read_data[1];
	sc1[2]=read_data[2];

	sc2[0]=read_data[4];
	sc2[1]=read_data[5];
	sc2[2]=read_data[6];

	sc3[0]=read_data[8];
	sc3[1]=read_data[9];
	sc3[2]=read_data[10];

	sc4[0]=read_data[12];
	sc4[1]=read_data[13];
	sc4[2]=read_data[14];

	sc4[0]=read_data[16];
	sc4[1]=read_data[17];
	sc4[2]=read_data[18];



//	text = charInit();


	drawString(text, leaderboards, 2, 10);
	drawString(text, sc1, 2, 12);
	drawString(text, sc2, 2, 14);
	drawString(text, sc3, 2, 16);
	drawString(text, sc4, 2, 18);
	drawString(text, sc5, 2, 20);

}


int main(int argc, char** argv)
{
	sdcard_init();
	sdcard_present();
	sdcard_FAT16();

	key_s* nextKey;

	sprite Character;
	sprite npcs[MAX_NPC];

//TODO Add Altera Avalon Timer
	alt_alarm* alarm;
	pixel_buffer_t* screen;
	char_buffer_t* text;

	int nticks,i,spawnCtr;
	int minSpawnRate=5;


	Character.type=player;
	Character.health=99;
	Character.loc.x=VRAM_W/2;
	Character.loc.y=VRAM_H/2;

	nextKey->type=(KB_CODE_TYPE*)malloc(sizeof(KB_CODE_TYPE));
	nextKey->val=(char*)malloc(sizeof(char));
	nextKey->buf=(alt_u8*)malloc(sizeof(alt_u8));

	for(i=0;i<MAX_NPC;i++)
	{
		npcs[i].type=null;
		npcs[i].health=100;
	}
	spawnCtr=0;
	scrollRate=1;
	srand(0x1234567);
	nticks=alt_ticks_per_second();
	printf("%d",nticks);
	screen=pixelInit();
	text=charInit();
	clearChars(text)
	movchar=0;



	kb=initKb((void*)key_hit);
	if(alt_alarm_start(alarm,nticks/30,draw,(void*)screen)<0)printf("\nNo timer\n");
	int score = 0;
	char scoreStr1[24] = "Score: 0";
	char scoreStr2[24];
	char healthStr1[24] = "Health: ";
	char healthStr2[24];
	char healthStr3[24] = " / 99";
    sprintf(healthStr2, "%d", Character.health);
    strcat(healthStr1, healthStr2);
    strcat(healthStr1, healthStr3);

	clearChars(text);
	drawString(text, healthStr1, 2, 2);
	drawString(text, scoreStr1, 2, 4);

	while(1)
	{

		if (Character.health <= 0 || Character.loc.y >= PLAYER_BB+3)
		{
			Character.health = 99;
			score=0;
			Character.loc.x=VRAM_W/2;
			Character.loc.y=VRAM_H/2;
			strcpy(healthStr1, "Health: 99 / 99");
			strcpy(scoreStr1, "Score: 0");
			clearChars(text);
			drawString(text, healthStr1, 2, 2);
			drawString(text, scoreStr1, 2, 4);
		}

		for(i=0;i<MAX_NPC;i++)
		{
		bool locx = false;
		bool locy = false;
		if (Character.loc.x <= (npcs[i].loc.x + 14) && Character.loc.x >=( npcs[i].loc.x - 14))
			locx = true;
		if (Character.loc.y <= (npcs[i].loc.y + 14) && Character.loc.y >= (npcs[i].loc.y - 14))
			locy = true;
		if (locx == true && locy == true)
			{
				Character.health = Character.health - scrollRate;
				Character.loc.y = Character.loc.y + scrollRate;

				strcpy(healthStr1, "Health: ");
			    sprintf(healthStr2, "%d", Character.health);
			    strcat(healthStr1, healthStr2);
			    strcat(healthStr1, healthStr3);
				//clearChars(text);
				drawString(text, healthStr1, 2, 2);
				drawString(text, scoreStr1, 2,4);
			}
		}


		if(kb->top!=kb->bottom)
		{
			getchKb(kb, nextKey);
			if(*nextKey->type==KB_ASCII_MAKE_CODE)
			{
				switch(*nextKey->val)
				{
				case 'W':
					if (Character.loc.y >= PLAYER_UB)
					Character.loc.y-=2;
					break;
				case'S':
					Character.loc.y+=2;
					break;
				case'A':
					if (Character.loc.x > PLAYER_LB)
					Character.loc.x-=2;
					break;
				case'D':
					if (Character.loc.x < PLAYER_RB)
					Character.loc.x+=2;
					break;
				case'X':
					display_score(text);
					break;
				case'L':
					scrollRate = (scrollRate+1)%10;
					break;
				default:
					break;
				}
			}
		}
		if(movchar==0)
		{
			spawnCtr++;
			//SET_LEDG(GET_KEYS);
			i=rand()%(200-scrollRate*20);

			if(spawnCtr>minSpawnRate&&spawnCtr>i)
			{
				spawnCtr=0;
				makeNPC(npcs);
				score = score + 20;
				//clearChars(text);
				strcpy(scoreStr1, "Score: ");
			    sprintf(scoreStr2, "%d", score);
			    strcat(scoreStr1, scoreStr2);
				drawString(text, healthStr1, 2, 2);
				drawString(text, scoreStr1, 2,4);
			}
			drawBg(screen);
			drawSprite(screen,&Character);
			drawNPCs(screen,npcs);
			movchar=1;
			swapBuffer(screen);
			movchar=1;
		}

	}
	return 0;
}
