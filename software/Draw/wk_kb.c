/*
 * wk_kb.c
 *
 *  Created on: 2013-10-02
 *      Author: Keith
 */
#include"stdlib.h"
#include"wk_kb.h"
#include"stdio.h"

kb_t* initKb(void* ISR)
{
	int i;
	kb_t* the_kb;
	the_kb=(kb_t*)malloc(sizeof(kb_t));
	the_kb->top=0;
	the_kb->bottom=0;
	for(i=0;i<8;i++)
	{
		the_kb->buffer[i].type=(KB_CODE_TYPE*)malloc(sizeof(KB_CODE_TYPE));
		the_kb->buffer[i].val=(char*)malloc(sizeof(char));
		the_kb->buffer[i].buf=(alt_u8*)malloc(sizeof(alt_u8));
		*the_kb->buffer[i].type=KB_INVALID_CODE;
		*the_kb->buffer[i].val=0;
		*the_kb->buffer[i].buf=0;
	}
	the_kb->dev=alt_up_ps2_open_dev(PS2_NAME);
	do{

	alt_up_ps2_init(the_kb->dev);
	reset_keyboard(the_kb->dev);
	alt_up_ps2_clear_fifo(the_kb->dev);
	}while(0);	//while(the_kb->dev->device_type==PS2_UNKNOWN);
	if(the_kb->dev->device_type==PS2_MOUSE)
	{
		printf("Mouse found; terminating initialization.\n");
		free(the_kb);
		return 0;
	}
	else
		printf("Keyboard Connected\n");
		if(the_kb->dev->device_type==PS2_UNKNOWN)
		{
			printf("HACK: Recognized as PS2_UNKNOWN: Forcing KB operation.\n");
		}
	alt_up_ps2_enable_read_interrupt((the_kb->dev));
	set_keyboard_rate((the_kb->dev),10);
	alt_irq_register(the_kb->dev->irq_id,NULL,ISR);

	return the_kb;
}

void getchKb(kb_t* kb, key_s* retVal)
{
	kb->top=(kb->top+1)%8;
	*retVal->type=*kb->buffer[kb->top].type;
	*retVal->val=*kb->buffer[kb->top].val;
	*retVal->buf=*kb->buffer[kb->top].buf;

}

void readFromKb(kb_t* kb)
{
	if(*kb->buffer[kb->bottom].type!=KB_BREAK_CODE&&*kb->buffer[kb->bottom].type!=KB_LONG_BREAK_CODE&&*kb->buffer[kb->bottom].type!=KB_INVALID_CODE)
		kb->bottom=(kb->bottom+1)%8;
	decode_scancode(kb->dev,kb->buffer[kb->bottom].type, kb->buffer[kb->bottom].buf, kb->buffer[kb->bottom].val);

}
