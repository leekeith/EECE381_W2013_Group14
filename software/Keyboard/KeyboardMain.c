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

	//printf("%d\n%d\n",IORD_32DIRECT(PS2_BASE,0),IORD_32DIRECT(PS2_BASE,4));
	readFromKb(kb);
	return;
}
int main(int argc, char** argv)
{
	char* p;
	key_s* nextKey;
	nextKey->type=(KB_CODE_TYPE*)malloc(sizeof(KB_CODE_TYPE));
	nextKey->val=(char*)malloc(sizeof(char));
	nextKey->buf=(alt_u8*)malloc(sizeof(alt_u8));
	kb=initKb((void*)kb_ISR);
	if(kb==0)
	{
		printf("Fatal error: no keyboard attached");
		return 0;

	}
	while(1)
	{

		if(kb->top!=kb->bottom)
		{
			getchKb(kb, nextKey);
			if(*nextKey->type==KB_ASCII_MAKE_CODE)
				printf("%c",*nextKey->val);

			else if(*nextKey->type==KB_BINARY_MAKE_CODE)
			{
				translate_make_code(*nextKey->type,*nextKey->buf,p);
				printf("BINARY MAKE CODE: %s %d\n",p,*nextKey->buf);
			}
			else if(*nextKey->type==KB_LONG_BINARY_MAKE_CODE)
			{
				translate_make_code(*nextKey->type,*nextKey->buf,p);
				printf("LONG BINARY MAKE CODE: %s %d\n",p,*nextKey->buf);
			}
			else if(*nextKey->type==KB_BREAK_CODE || *nextKey->type==KB_LONG_BREAK_CODE)
				printf("BREAK : %x\n",*nextKey->buf);
			else if(*nextKey->type==KB_INVALID_CODE)
				printf("\nINVALID CODE\n");

		}

	}

	return 0;
}
