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
#include"bitmap.h"
#include<stdbool.h>
#include<string.h>
#include<stdlib.h>
#include <stdio.h>
#define BITMAPS
//#define BMP_BKGND
#define E_TYPE_CNT 2

volatile char movchar;

int scrollRate;
kb_t* kb;

void drawBg(pixel_buffer_t* screen);

void drawSprite(pixel_buffer_t* screen, sprite* the_sprite);

void makeNPC(sprite* npcs);
void drawNPCs(pixel_buffer_t* screen, sprite* npcs);
void draw_health(pixel_buffer_t* screen, sprite* c);
void drawMenu(pixel_buffer_t* screen, char_buffer_t* text, int* sz, int sel);
void drawMenuBg(pixel_buffer_t* screen, int* sz, int max);
void bitmap_drawNPCs(bitmap_t** enemy_bmps, pixel_buffer_t* screen, sprite* npcs, int eTypeCnt);
void printGameOver(char_buffer_t* text, char* player_name);


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

void save_score(char player_name[10], char final_score[5])
{
	char read_data [100] = {0};

	File score;
	score.file_name = "score.txt";
	score.file_handle = sdcard_fopen(score.file_name,false);

	sdcard_readfile(read_data , score.file_handle);

	sprintf(read_data, player_name);
	strcat(read_data, " ");
	strcat(read_data, final_score);
	strcat(read_data, ";");
	//strcat(read_data, player_name);

	sdcard_writefile(read_data, score.file_handle);
	sdcard_fclose(score.file_handle);

}

void display_score(char_buffer_t* text)
{
	char read_data [100] = {0};
	char leaderboards[24] = "Leader Board:";

	File score;
	score.file_name = "score.txt";
	score.file_handle = sdcard_fopen(score.file_name,false);
	sdcard_readfile(read_data , score.file_handle);

	sdcard_fclose(score.file_handle);

	int pos_y = 15;
	drawString(text, leaderboards, 20, pos_y);
	pos_y = pos_y + 4;

	int start;
	start = 0;
	while(read_data[start] != 0)
	{
		int j;
		j = start;
		int i;
		i = 0;
		char buffer [15] = {0};
		while(read_data[j] != ';')
		{
			buffer[i] = read_data[j];
			i++;
			j++;

		}
		drawString(text, buffer, 20, pos_y);
		pos_y = pos_y + 2;
		start = j+1;
	}

}


int main(int argc, char** argv)
{
	int i,j;
	game_state_t state;
	int *menu_sz,menu_sel;
	sdcard_init();
	sdcard_present();
	sdcard_FAT16();

	key_s* nextKey;
	char final_score[5] = {0};

	sprite Character;
	sprite npcs[MAX_NPC];

#ifdef BITMAPS
	bitmap_t* player_bmp;
	bitmap_t** enemy_bmps;
	player_bmp=bitmap_getBmp("Ship1.bmp");
	enemy_bmps=(bitmap_t**)malloc(E_TYPE_CNT*sizeof(bitmap_t*));
	enemy_bmps[0]=bitmap_getBmp("Enemy1.bmp");
	enemy_bmps[1]=bitmap_getBmp("Obst1.bmp");

	bitmap_to16bit(player_bmp);
	for(i=0;i<E_TYPE_CNT;i++)
		bitmap_to16bit(enemy_bmps[i]);

#endif
#ifdef BMP_BKGND
	bitmap_t* temp;
	scrolling_bmp_t* bg_bmp;
	temp=bitmap_getBmp("Bkgnd.bmp");
	bitmap_to16bit(temp);
	bg_bmp=bitmap_makeScrolling(temp);
#endif

//TODO Add Altera Avalon Timer
	alt_alarm* alarm;
	pixel_buffer_t* screen;
	char_buffer_t* text;

	int nticks,spawnCtr,*index;
	int minSpawnRate=5;
	char player_name[10] = "Player";


	index=(int*)malloc(sizeof(int));
	Character.type=player;
	Character.health=100;
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
	alarm=(alt_alarm*)malloc(sizeof(alt_alarm));
	spawnCtr=0;
	scrollRate=1;
	srand(0x1234567);
	nticks=alt_ticks_per_second();
	printf("%d",nticks);
	screen=pixelInit();
	text=charInit();
	clearChars(text)
	movchar=0;
	state=ingame;
	kb=initKb((void*)key_hit);


	if(alt_alarm_start(alarm,nticks/30,draw,(void*)screen)<0)printf("\nNo timer\n");

	int score = 0;
	char scoreStr1[24] = "Score: 0";
	char scoreStr2[24];
	//char healthStr1[24] = "Health: ";
	//char healthStr2[24];
	//char healthStr3[24] = " / 100";
    //sprintf(healthStr2, "%d", Character.health);
    //strcat(healthStr1, healthStr2);
    //strcat(healthStr1, healthStr3);

    menu_sz=(int*)malloc(sizeof(int));
	//clearChars(text);
	//drawString(text, healthStr1, 2, 2);
	drawString(text, scoreStr1, 2, 4);

	while(1)
	{
		if(kb->top!=kb->bottom)
		{
			getchKb(kb, nextKey);
			if(state==leader && *menu_sz>40)
			{
				clearChars(text);
				state=menu;
				*menu_sz=0;
				menu_sel=0;
			}


			if(state==death && (*index)<10)
			{
				if(*index==9)
				{
					player_name[*index]=0;
					*index=10;
				}
				else if(*nextKey->type==KB_ASCII_MAKE_CODE)
				{
					player_name[*index]=*nextKey->val;

					(*index)++;

				}
				else if(*nextKey->type==KB_BINARY_MAKE_CODE)
				{
					switch(*nextKey->buf)
					{
					case 102: //BKSP
						if(*index>0)
						{
							(*index)--;

						}
						break;
					case 118: //ESC
						sprintf(player_name,"Player");
						*index=10;
						break;
					case 90: //ENTER
						if(*index>0)
							player_name[*index]=0;
						*index=10;
						break;
					default:
						break;
					}
				}
				for(j=*index;j<9;j++)
					player_name[j]=' ';
				player_name[j]=0;
			}
			else if(*nextKey->type==KB_ASCII_MAKE_CODE)
			{


				switch(*nextKey->val)
				{
				case 'W':
					if(state==ingame)
					{
						if (Character.loc.y >= PLAYER_UB)
							Character.loc.y-=2;
					}
					else if(state==menu)
					{
						if(menu_sel>0)
							menu_sel--;
						clearChars(text);
					}
					break;
				case'S':
					if(state==ingame && Character.loc.y<PLAYER_BB)
						Character.loc.y+=2;
					else if(state==menu)
					{
						menu_sel++;
						clearChars(text);
					}
					break;
				case'A':
					if (state==ingame && Character.loc.x > PLAYER_LB)
					Character.loc.x-=2;
					break;
				case'D':
					if (state==ingame && Character.loc.x < PLAYER_RB)
					Character.loc.x+=2;
					break;
				case'X':
					//display_score(text);
					break;
				case'L':
					scrollRate = (scrollRate+1)%10;
					break;
				default:
					break;
				}
			}
			else if(*nextKey->type==KB_BINARY_MAKE_CODE)
			{
				switch(*nextKey->buf)
				{
				case 118:
					if(state==ingame)
					{
						clearChars(text);
						state=menu;
						*menu_sz=0;
						menu_sel=0;
					}
					break;
				case 90:
					if(state==menu && *menu_sz==50)
					{
						if(menu_sel==0)
						{
							clearChars(text);
							state=leader;
							*menu_sz=0;
						}
						else
						{
							clearChars(text);
							state=ingame;
							*menu_sz=0;
							drawString(text, scoreStr1, 2,4);
						}
					}
				default:
					break;
				}
			}
		}
		if(state==ingame)
		{
			if (Character.health <= 0 || Character.loc.y >= PLAYER_BB+3)
			{
				clearChars(text);
				*index=0;
				*menu_sz=0;
				state=death;
			}
			/*
			if (Character.health <= 0 || Character.loc.y >= PLAYER_BB+3)
			{
				Character.health = 100;
				char final_score[5] = {0};
				sprintf(final_score, "%d", score);
				score=0;
				Character.loc.x=VRAM_W/2;
				Character.loc.y=VRAM_H/2;
				//strcpy(healthStr1, "Health: 100 / 100   ");
				strcpy(scoreStr1, "Score: 0");
				clearChars(text);
				//drawString(text, healthStr1, 2, 2);
				drawString(text, scoreStr1, 2, 4);
				save_score(player_name,final_score); //Replace player_name with actual name entered at start
			}
			*/
			for(i=0;i<MAX_NPC;i++)
			{
			bool locx = false;
			bool locy = false;
			if(npcs[i].type!=null)
			{
				if (Character.loc.x <= (npcs[i].loc.x + 14) && Character.loc.x >=( npcs[i].loc.x - 14))
					locx = true;
				if (Character.loc.y <= (npcs[i].loc.y + 14) && Character.loc.y >= (npcs[i].loc.y - 14))
					locy = true;
				if (locx == true && locy == true)
					{
						Character.health = Character.health - scrollRate;
						Character.loc.y = Character.loc.y + scrollRate;

						//strcpy(healthStr1, "Health: ");
						//sprintf(healthStr2, "%d", Character.health);
						//strcat(healthStr1, healthStr2);
						//strcat(healthStr1, healthStr3);
						//strcat(healthStr1, "    ");
						//clearChars(text);
						//drawString(text, healthStr1, 2, 2);
						//drawString(text, scoreStr1, 2,4);
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
					//drawString(text, healthStr1, 2, 2);
					drawString(text, scoreStr1, 2,4);
				}
	#ifdef BMP_BKGND
				scrolling_bgDrawToScr(bg_bmp,scrollRate,screen);
	#else
				drawBg(screen);
	#endif
	#ifdef BITMAPS
				bitmap_drawNPCs(enemy_bmps,screen,npcs,E_TYPE_CNT);
				bitmap_drawToScr(player_bmp,screen,Character.loc.x,Character.loc.y);
	#else
				drawNPCs(screen,npcs);
				drawSprite(screen,&Character);
	#endif

				draw_health(screen,&Character);
				swapBuffer(screen);
				movchar=1;
			}
		}
		else if(state==menu)
		{
			if(movchar==0)
			{
				if(*menu_sz==0)
				{
					drawBg(screen);
					bitmap_drawToScr(player_bmp,screen,Character.loc.x,Character.loc.y);
					draw_health(screen,&Character);
					swapBuffer(screen);
					drawBg(screen);
					bitmap_drawToScr(player_bmp,screen,Character.loc.x,Character.loc.y);
					draw_health(screen,&Character);
				}
				drawMenu(screen,text,menu_sz,menu_sel);
				swapBuffer(screen);
				movchar=1;
			}
		}
		else if(state==leader)
		{
			if(movchar==0)
			{
				if(*menu_sz==0)
				{
					drawBg(screen);
					bitmap_drawToScr(player_bmp,screen,Character.loc.x,Character.loc.y);
					draw_health(screen,&Character);
					swapBuffer(screen);
					drawBg(screen);
					bitmap_drawToScr(player_bmp,screen,Character.loc.x,Character.loc.y);
					draw_health(screen,&Character);
				}

				if(*menu_sz>80)	display_score(text);
				drawMenuBg(screen,menu_sz,90);
				swapBuffer(screen);
				movchar=1;
			}
		}
		else if(state==death)
		{
			if(movchar==0)
			{

				if(*menu_sz==0)
				{
					drawBg(screen);
					bitmap_drawToScr(player_bmp,screen,Character.loc.x,Character.loc.y);
					draw_health(screen,&Character);
					swapBuffer(screen);
					drawBg(screen);
					bitmap_drawToScr(player_bmp,screen,Character.loc.x,Character.loc.y);
					draw_health(screen,&Character);
				}
				drawMenuBg(screen,menu_sz,40);
				swapBuffer(screen);
			}
			if(*menu_sz>35  && *index<10) printGameOver(text,player_name);
			if(*index==10)
			{
				Character.health = 100;
				sprintf(final_score, "%d", score);
				score=0;
				Character.loc.x=VRAM_W/2;
				Character.loc.y=VRAM_H/2;
				strcpy(scoreStr1, "Score: 0       ");
				clearChars(text);
				drawString(text, scoreStr1, 2, 4);
				save_score(player_name,final_score); //Replace player_name with actual name entered at start
				state=leader;
			}
		}

	}
	return 0;
}
