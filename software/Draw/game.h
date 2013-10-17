/*
 * game.h
 *
 *  Created on: 2013-09-28
 *      Author: Keith
 */

#ifndef GAME_H_
#define GAME_H_

#define PLAYER_LB (VRAM_W/4 + 6)
#define PLAYER_RB ((3*VRAM_W)/4 - 6)
#define PLAYER_UB (6)
#define PLAYER_BB (VRAM_H-6)

#define MAX_NPC 20

typedef struct coord_s{int x,y;}coord_s;
typedef enum spriteType{null,player,enemy1,enemy2}spriteType;
typedef struct sprite	{	spriteType 	type;
							coord_s 	loc;
							short		health;
						}sprite;

typedef enum game_state{menu, ingame, death, leader}game_state_t;

#endif /* GAME_H_ */
