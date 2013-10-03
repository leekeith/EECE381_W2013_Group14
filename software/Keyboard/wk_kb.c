/*
 * wk_kb.c
 *
 *  Created on: 2013-10-02
 *      Author: Keith
 */

#include"wk_kb.h"

kb_t* initKb(void* ISR)
{
	int i;
	kb_t* the_kb;
	the_kb=(kb_t*)malloc(sizeof(kb_t));
	the_kb->top=0;
	the_kb->bottom=0;
	for(i=0;i<8;i++)
	{
		the_kb->buffer[i].type=KB_INVALID_CODE;
		the_kb->buffer[i].val=0;
		the_kb->buffer[i].buf=0;
	}
	alt_up_ps2_init(&(the_kb->dev));
	if(the_kb->dev.device_type!=PS2_KEYBOARD)
	{
		printf("No Keyboard Found\n");
		free(the_kb);
		return 0;
	}
	alt_up_ps2_enable_read_interrupt(&(the_kb->dev));
	set_keyboard_rate(&(the_kb->dev),60);
	alt_irq_register(the_kb->dev.irq_id,NULL,ISR);
	return the_kb;
}

key_t getchKb(kb_t* kb)
{
	key_t retVal;
	retVal.type=KB_INVALID_CODE;
	if(kb->top!=kb->bottom)
	{
		retVal.type=kb->buffer[kb->top].type;
		retVal.val=kb->buffer[kb->top].val;
		retVal.buf=kb->buffer[kb->top].buf;
		kb->top=(kb->top+1)%8;
		if(kb->top==kb->bottom)
			kb->bottom=(kb->bottom+1)%8;
	}
	return retVal;
}

void readFromKb(kb_t* kb)
{
	if((kb->bottom+1)%8!=kb->top)
	{
		kb->bottom=(kb->bottom+1)%8;
		decode_scancode(&(kb->dev),&(kb->buffer[kb->bottom].type),&(kb->buffer[kb->bottom].buf),&(kb->buffer[kb->bottom].val));
	}
}
