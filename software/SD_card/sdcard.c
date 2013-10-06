/*
 * sdcard.c
 *
 *  Created on: Sep 26, 2013
 *      Author: Mehdi Raza
 */

#include <stdio.h>
#include "sdcard.h"
#include <altera_up_sd_card_avalon_interface.h>
#include <stdbool.h>

/*
 * Initializes the SD Card IP Core HAL device driver.
 * NOTE:
 * You may have to replace ALTERA_UP_SD_CARD_AVALON_INTERFACE_0_NAME
 * with your own instance name. To find your instance name, go to your
 * bsp folder, then open system.h file and look for the #define statement
 * with "/dev/...."
 */
void sdcard_init(void)
{
	alt_up_sd_card_dev *device_reference = NULL;

	device_reference = alt_up_sd_card_open_dev(SD_CARD_NAME);
}


/*
 * Checks if an SD card is present in the SD card socket.
 * Returns true when an SD card is present in the SD card
 * socket, and false otherwise.
 */
int sdcard_present(void)
{
	int present = alt_up_sd_card_is_Present();
	return present;
}

/*
 * Checks if an SD card contains a FAT16 partition.
 * Returns true when an SD card contains FAT16 data,
 * and false otherwise
 */
int sdcard_FAT16(void)
{
	int format = alt_up_sd_card_is_FAT16();
	return format;
}

/*
 * Looks for the ﬁrst ﬁle in a given directory and stores the file name in the given pointer file_name.
 * Returns result of the operation. 0 means success, 1 means an invalid directory, 2
 * means no card is present or the card does not contain a FAT16 partition, and -1 mean
 * that the directory has been scanned and no ﬁles were found.
 */
short int sdcard_get_first_file(char *directory, char *file_name)
{
	short int status = alt_up_sd_card_find_first(directory, file_name);
	return status;
}

/*
 * Looks for the next ﬁle in a directory speciﬁed in the last call to the
 * sdcard_get_first_file subroutine and stores the filename in the given pointer file_name.
 * Returns result of the operation. 0 means success, 1 means an invalid directory,
 * 2 means no card is present or the card does not contain a FAT16 partition, 3 means that
 * ﬁnd_ﬁrst must be called ﬁrst, and -1 means that the directory has been scanned and
 * no ﬁles were found.
 */
short int sdcard_get_next_file(char *file_name)
{
	short int status = alt_up_sd_card_find_next(file_name);
	return status;
}

/*
 * Prints out a list of files in the given directory
 */
void sdcard_list(char *directory)
{
	char * file_name = NULL;

	if (sdcard_get_first_file(directory, file_name) == 0)
	{
		printf(file_name);
		printf("\n");

		while (sdcard_get_next_file(file_name) == 0)
		{
			printf(file_name);
			printf("\n");
		}
	}
}



/*
 * Opens a ﬁle for use in your application.
 * Inputs:
 *      name - a file name including a directory, relative to the root directory
 *      create - a flag set to true to create a file if it does not already exist
 * Output:
 *      An index to the file record assigned to the specified file. -1 is returned if the file could not be opened.
 *		Return -2 if the specified file has already been opened previously.
 */
short int sdcard_fopen(char *file_name, bool create)
{
	short int handle = alt_up_sd_card_fopen(file_name,create);
	return handle;
}


/*
 * Reads and returns a byte from a given file specified by the file_handle
 */
short int sdcard_readbyte(short int file_handle)
{

	short int byte = alt_up_sd_card_read(file_handle);
	return byte;
}

/*
 * Returns file size given its file handle
 */
int sdcard_filesize(short int file_handle)
{

	int count = 0;
	while(sdcard_readbyte(file_handle) >= 0)
	{
		count ++;
	}
	sdcard_fclose(file_handle);
	return count;
}


/*
 * Reads a file specified by the file handle into a given char array
 */
void sdcard_readfile(char read_data [], short int file_handle)
{
	short int i = 0;
	int count = 0;
	while(i >= 0)
	{
		i = sdcard_readbyte(file_handle);
		if ( i >= 0)
			read_data[count] = i;
		count ++;
	}
	read_data[count-1] = '/';
}



/*
 *	Prints the contents of the array to the console
 */
void sdcard_printarray(char a[])
{
	int h = 0;
	while(a[h] != '/')
	{
		printf("%c \n", a[h] );
		h++;
	}
}

/*
 *	Writes the given char array into the specified file given its handle
 *	Stops when end of file character '/' detected
 */
void sdcard_writefile(char write_data [], short int file_handle)
{
	int h = 0;
	while(write_data[h] != '/')
	{
		alt_up_sd_card_write(file_handle, write_data[h]);
		h++;
	}

}



/* Return file attributes, or -1 if the file_handle is invalid.
 * Attribute values lookup in hex: http://www.tavi.co.uk/phobos/fat.html#attribute_values
 * Attribute values lookup in decimal: http://msdn.microsoft.com/en-us/library/aa242866(v=vs.60).aspx
 */
short int sdcard_fattributes(short int file_handle)
{
	short int att = alt_up_sd_card_get_attributes(file_handle);
	return att;
}


/*
 * Closes a file given its file handle
 */
void sdcard_fclose(int short file_handle)
{
	alt_up_sd_card_fclose(file_handle);
}
