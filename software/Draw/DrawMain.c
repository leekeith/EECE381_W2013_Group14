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
#include<stdbool.h>
#include<string.h>
#include<stdlib.h>

volatile char movchar;
volatile char keysval;
volatile char keyhit;
int scrollRate;

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
	int counter;

	keyhit=1;
	keysval=counter=0;
	while(!keysval&&(counter++)<10)
		keysval=GET_KEYS;
	//printf("%d",GET_KEYS);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(KEYS_BASE, 0);
}
int main(int argc, char** argv)
{
	sprite Character;
	sprite npcs[MAX_NPC];

//TODO Add Altera Avalon Timer
	alt_alarm* alarm;
	pixel_buffer_t* screen;
	char_buffer_t* text;

	int nticks,i,spawnCtr;
	int minSpawnRate=30;
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(KEYS_BASE, 0x7);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(KEYS_BASE, 0x0);
	alt_irq_register(KEYS_IRQ,NULL,(void*)key_hit);

	Character.type=player;
	Character.health=100;
	Character.loc.x=VRAM_W/2;
	Character.loc.y=VRAM_H/2;

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
	keyhit=0;
	keysval=0;
	if(alt_alarm_start(alarm,nticks/30,draw,(void*)screen)<0)printf("\nNo timer\n");

	int score = 0;
//	char scoreStr1[24] = "Score: 0";
//	char scoreStr2[24];
	char healthStr1[24] = "Health: ";
	char healthStr2[24];
	char healthStr3[24] = " / 100";
    sprintf(healthStr2, "%d", Character.health);
    strcat(healthStr1, healthStr2);
    strcat(healthStr1, healthStr3);

	clearChars(text);
	drawString(text, healthStr1, 2, 2);
//	drawString(text, scoreStr1, 2, 4);

	while(1)
	{

		if (Character.health == 0)
		{
			Character.health = 100;
			Character.loc.x=VRAM_W/2;
			Character.loc.y=VRAM_H/2;
			strcpy(healthStr1, "Health: 100 / 100");
			clearChars(text);
			drawString(text, healthStr1, 2, 2);
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
				Character.health = Character.health - 1;
				Character.loc.y = Character.loc.y + 1;

				strcpy(healthStr1, "Health: ");
			    sprintf(healthStr2, "%d", Character.health);
			    strcat(healthStr1, healthStr2);
			    strcat(healthStr1, healthStr3);
				clearChars(text);
				drawString(text, healthStr1, 2, 2);
			}
		}

		if(keyhit==1)
		{
			if(keysval&4)
				if(Character.loc.x>PLAYER_LB)
					Character.loc.x = Character.loc.x-2;
			if(keysval&2)
				if(Character.loc.x<PLAYER_RB)
					Character.loc.x = Character.loc.x+2;
			if(keysval&1)
				scrollRate=(scrollRate+1)%10;
			printf("%d\n%d\n",keysval,Character.loc.x);
			keyhit=0;
		}

		if(movchar==0)
		{
			spawnCtr++;
			//SET_LEDG(GET_KEYS);
			i=rand()%100;

			if(spawnCtr>minSpawnRate&&spawnCtr>i)
			{
				spawnCtr=0;
				makeNPC(npcs);
	//			score = score + 20;
	//			clearChars(text);
	//			strcpy(scoreStr1, "Score: ");
	//		    sprintf(scoreStr2, "%d", score);
	//		    strcat(scoreStr1, scoreStr2);
	//			drawString(text, scoreStr1, 2,4);
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
