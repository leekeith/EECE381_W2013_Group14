/*
 * audio.h
 *
 *  Created on: 2013-10-08
 *      Author: Owner
 */

#ifndef AUDIO_H_
#define AUDIO_H_
#include <stdio.h>
#include "altera_up_avalon_audio_and_video_config.h"
#include "altera_up_avalon_audio.h"


typedef struct
{
	short int file_handle;
	int size_of_bufarr;
	char *file_name;
	alt_up_audio_dev * audio ;
	int arr_index;
	unsigned int* buf_arr;

} Audio;

void av_config_setup();
void play_sound(unsigned int buf[],alt_up_audio_dev*audio);
void audio_isr(void *context, unsigned int irq_id);
Audio* read_audio_file(char* file_name, alt_up_audio_dev *audio );

#endif /* AUDIO_H_ */


/*#include <stdio.h>
#include "sys/alt_irq.h"
#include "altera_up_avalon_audio_and_video_config.h"
#include "altera_up_avalon_audio.h"
#include "wk_io.h"
#include "sdcard.h"
#include "audio.h"




int main()
{
  av_config_setup();
  printf("config ready\n");

  alt_up_audio_dev * audio = alt_up_audio_open_dev(AUDIO_NAME);
  sdcard_init();
  sdcard_FAT16();
  sdcard_present();
  Audio* boing;
  //Audio* dingdin;

  boing = read_audio_file("boing.wav", audio);


  alt_irq_register(AUDIO_IRQ, (void*)boing, audio_isr);
  alt_irq_enable(AUDIO_IRQ);
  alt_up_audio_enable_write_interrupt(audio);

  printf("done\n");
  return 0;
}

*/
