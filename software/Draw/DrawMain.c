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
volatile char movchar;
volatile char keysval;
volatile char keyhit;

void drawBg(pixel_buffer_t* screen);

void drawSprite(pixel_buffer_t* screen, sprite* the_sprite);

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

//TODO Add Altera Avalon Timer
	alt_alarm* alarm;
	pixel_buffer_t* screen;

	int nticks;

	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(KEYS_BASE, 0x6);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(KEYS_BASE, 0x0);
	alt_irq_register(KEYS_IRQ,NULL,(void*)key_hit);

	Character.type=player;
	Character.health=100;
	Character.loc.x=VRAM_W/2;
	Character.loc.y=VRAM_H/2;
	nticks=alt_ticks_per_second();
	printf("%d",nticks);
	screen=pixelInit();
	movchar=0;
	keyhit=0;
	keysval=0;
	if(alt_alarm_start(alarm,nticks/30,draw,(void*)screen)<0)printf("\nNo timer\n");

	while(1)
	{


		if(keyhit==1)
		{

			if(keysval&4)
				if(Character.loc.x>PLAYER_LB)
					Character.loc.x--;
			if(keysval&2)
				if(Character.loc.x<PLAYER_RB)
					Character.loc.x++;
			printf("%d\n%d\n",keysval,Character.loc.x);
			keyhit=0;
		}

		if(movchar==0)
		{
			//SET_LEDG(GET_KEYS);
			drawBg(screen);
			drawSprite(screen,&Character);
			movchar=1;
			if(Character.loc.y>PLAYER_UB)
				Character.loc.y--;
			else
				Character.loc.y=PLAYER_BB;
			swapBuffer(screen);
			movchar=1;
		}

	}
	return 0;
}

