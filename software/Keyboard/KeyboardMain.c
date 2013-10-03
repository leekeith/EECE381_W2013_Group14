/*
 * KeyboardMain.c
 *
 *  Created on: 2013-10-02
 *      Author: Keith
 */

#include"wkAll.h"
#include"altera_up_ps2_keyboard.h"
#include"io.h"
#include"nios2.h"
#include"alt_types.h"
kb_t* kb;

void kb_ISR(void* context, alt_u32 id)
{
	readFromKb(kb);
}
int main(int argc, char** argv)
{
	key_t nextKey;
	kb=initKb((void*)kb_ISR);
	if(kb==0)
	{
		printf("Fatal error: no keyboard attached");
		return 0;

	}
	while(1)
	{
		while(kb->top!=kb->bottom)
		{
			nextKey=getchKb(kb);
			if(nextKey.type==KB_ASCII_MAKE_CODE)
				printf("%c",nextKey.val);
		}
	}

	return 0;
}
