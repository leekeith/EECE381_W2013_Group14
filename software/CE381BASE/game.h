/*
 * game.h
 *
 *  Created on: 2013-09-28
 *      Author: Keith
 */

#ifndef GAME_H_
#define GAME_H_

#define PLAYER_LB (VRAM_W/3)
#define PLAYER_RB ((2*VRAM_W)/3)
#define PLAYER_UB (6)
#define PLAYER_LB (VRAM_H-6)

typedef struct coord_s{int x,y;}coord_s;
typedef enum spriteType{null,player,enemy1}spriteType;
typedef struct sprite	{	spriteType 	type;
							coord_s 	loc;
							short		health;
						}sprite;

#endif /* GAME_H_ */
