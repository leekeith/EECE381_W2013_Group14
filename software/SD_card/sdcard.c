#include <stdio.h>
#include <system.h>
#include <altera_up_sd_card_avalon_interface.h>

int main(void) {
	alt_up_sd_card_dev *device_reference = NULL;
	int connected = 0;
	device_reference = alt_up_sd_card_open_dev(SD_CARD_NAME);


	printf("Program is Running\n");

	char * file_name = NULL;
	char * directory = ".";
	int check = 0;
	if (device_reference != NULL) {

	while(1) {
		if ((connected == 0) && (alt_up_sd_card_is_Present())) {
			printf("Card connected.\n");
			check = 1;
			if (alt_up_sd_card_is_FAT16()) {
				printf("FAT16 file system detected.\n");

				if (alt_up_sd_card_find_first(directory, file_name) == 0)
				{
					printf(file_name);
					printf("\n");

					while (alt_up_sd_card_find_next(file_name) == 0)
					{
						printf(file_name);
						printf("\n");
					}
				}
			}

			else {
				printf("Unknown file system.\n");
			}

			connected = 1;
		}

		else if ((connected == 1) && (alt_up_sd_card_is_Present() == false)) {
			printf("Card disconnected.\n\n");
			connected = 0;
		}

		if (check == 0)
		{
			printf("No SD card detected\n");
			check = 1;
		}
	}
}
return 0;
}
