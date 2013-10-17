/*
 * sdcard.h
 *
 *  Created on: Sep 26, 2013
 *      Author: Mehdi Raza
 */

#ifndef SDCARD_H_
#define SDCARD_H_
#include <stdbool.h>

void sdcard_init(void);
int sdcard_present(void);
int sdcard_FAT16(void);
short int sdcard_get_first_file(char *directory, char *file_name);
short int sdcard_get_next_file(char *file_name);
short int sdcard_readbyte(short int file_handle);
void sdcard_readfile(char read_data [], short int file_handle);
void sdcard_writefile(char write_data [], short int file_handle);
int sdcard_filesize(short int file_handle);
void sdcard_list(char *directory);
void sdcard_printarray(char a[]);
int sdcard_audiosize(short int file_handle);

short int sdcard_fopen(char *name, bool create);
void sdcard_fclose(short int file_handle);
short int sdcard_fattributes(short int file_handle);

typedef struct
{
	char *file_name;
	char *directory;
	short int attributes;
	short int file_handle;
	int file_size;

} File;

#endif /* SDCARD_H_ */
