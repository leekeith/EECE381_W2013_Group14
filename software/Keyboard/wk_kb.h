/*
 * wk_kb.h
 *
 *  Created on: 2013-10-02
 *      Author: Keith
 */

#ifndef WK_KB_H_
#define WK_KB_H_

#include"altera_up_ps2_keyboard.h"

typedef struct key_s{	KB_CODE_TYPE* type;
						char* val;
						alt_u8* buf;
					}key_s;

typedef struct kb_t{	alt_up_ps2_dev* dev;
						key_s buffer[8];
						short top;
						short bottom;
					}kb_t;

kb_t* initKb(void* ISR);

key_s getchKb(kb_t* kb);

void readFromKb(kb_t* kb);

void resetKb(kb_t* kb);


#endif /* WK_KB_H_ */
