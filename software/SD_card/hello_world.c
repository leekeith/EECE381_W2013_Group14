#include <stdio.h>
#include "sdcard.h"
#include <stdbool.h>

int main(void) {

	// initialize sdcard and variables
	sdcard_init();
	int connected = 0;
	int check = 0;


	// Original from exercise
	while(1) {
		if ((connected == 0) && (sdcard_present())) {
			printf("Card connected.\n");
			check = 1;
			if (sdcard_FAT16()) {
				printf("FAT16 file system detected.\n");

						//Initialize arrays for read and write file
						char write_data [] = {'B', 'M', 'W', '/'}; // '/' is to signify end of array
						char read_data [10] = {0};

						// Create new file struct and initialize its variables
						File example;
						example.file_name = "new_mig6.txt";
						example.file_handle = sdcard_fopen(example.file_name,true);

						//Print out file handle, file name and file attributes
						printf("File Handle: %i\n",example.file_handle);
						printf(example.file_name);
						printf("\n");
						example.attributes = sdcard_fattributes(example.file_handle);
						printf("Attributes: %i\n",example.attributes);

						//Write contents of char write_data[] in the file
						sdcard_writefile(write_data, example.file_handle);

						// close and reopens the file after write to reset pointer back to the beginning
						sdcard_fclose(example.file_handle);
						example.file_handle = sdcard_fopen(example.file_name,false);

						//Read the contents of the file into char read_data[]
						sdcard_readfile(read_data , example.file_handle);

						// Print out contents of the read_data[] array
						sdcard_printarray(read_data);

						// Close the file
						sdcard_fclose(example.file_handle);

						printf("Done \n");

			}

			else {
				printf("Unknown file system.\n");
			}

			connected = 1;
		}

		else if ((connected == 1) && (sdcard_present() == 0)) {
			printf("Card disconnected.\n\n");
			connected = 0;
		}

		if (check == 0)
		{
			printf("No SD card detected\n");
			check = 1;
		}
	}

return 0;
}
