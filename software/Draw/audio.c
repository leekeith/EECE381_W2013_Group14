/*
 * audio.c
 *
 *  Created on: 2013-10-08
 *      Author: Owner
 */

#include <stdio.h>
#include "sys/alt_irq.h"
#include "altera_up_avalon_audio_and_video_config.h"
#include "altera_up_avalon_audio.h"
#include "wk_io.h"
#include "sdcard.h"
#include "audio.h"
#include "stdlib.h"




//setup audio
void av_config_setup() {
alt_up_av_config_dev * av_config =
alt_up_av_config_open_dev(AV_CONFIG_NAME);
while (!alt_up_av_config_read_ready(av_config)) {
}
}



//play audio buf
void play_sound(unsigned int buf[],alt_up_audio_dev*audio){

alt_up_audio_write_fifo(audio, buf, 70, ALT_UP_AUDIO_LEFT);
alt_up_audio_write_fifo(audio, buf, 70, ALT_UP_AUDIO_RIGHT);

}

//audio interrupt
void audio_isr(void *context, unsigned int irq_id){
	Audio* x = *(Audio**)context;
	if((x->arr_index) < (x->size_of_bufarr/2)){
		play_sound(x->buf_arr+x->arr_index,x->audio);
		(x->arr_index)+=70;}
	else{
		x->arr_index = 0;
		alt_up_audio_disable_write_interrupt(x->audio);
	}
}





//read audio file, create a pointer to an int array and return attributes of the file.
Audio* read_audio_file(char* file_name, alt_up_audio_dev*audio ){

Audio* the_audio;
the_audio = (Audio*)malloc(sizeof(Audio));

the_audio-> audio = audio;
the_audio-> arr_index = 0;
the_audio-> file_name = file_name;

short int file_handle = sdcard_fopen(file_name,false);
the_audio->size_of_bufarr = sdcard_audiosize(file_handle);

int offset = 44;

the_audio -> buf_arr = (unsigned int*)malloc(((the_audio ->size_of_bufarr/2))*sizeof(int));

char read_data[the_audio->size_of_bufarr];
int b_ar = 0;
int i = 0;
unsigned char firstB;
unsigned char secondB;
int completeB;

while(i < 44)
	{
		sdcard_readbyte(file_handle);
		i++;
	}

	for(i = 0; i < (the_audio->size_of_bufarr); i++)
		read_data[i]= sdcard_readbyte(file_handle);

	i = 0;
	while(i < (the_audio->size_of_bufarr)){
		  firstB = read_data[i];
	  	    i++;
	      secondB = read_data[i];
	        i++;
	     completeB = (secondB << 8) | firstB;
	     the_audio->buf_arr[b_ar] = completeB;
	     	 b_ar++;
		  }
	  int b_ar_count = 0;





	sdcard_fclose(file_handle);

	return the_audio;

}


