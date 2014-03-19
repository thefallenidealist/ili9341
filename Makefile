# da se iz vima moze :make
PROJECT=program
SOURCES=program.c
MMCU=atmega328
PART=m328p
PROGRAMMER=usbasp

CC=avr-gcc
CFLAGS=-Os -Wall -mmcu=$(MMCU) -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -std=c99 -fdata-sections 
OBJ2HEX=avr-objcopy

all: 
	$(CC) $(CFLAGS) -o $(PROJECT).elf $(PROJECT).c 
	$(OBJ2HEX) -O ihex $(PROJECT).elf $(PROJECT).hex
	avrdude -p $(PART) -c $(PROGRAMMER) -e -U flash:w:$(PROJECT).hex

elf : 
	$(CC) $(CFLAGS) -o $(PROJECT).elf $(PROJECT).c 

hex : 
	$(OBJ2HEX) -O ihex $(PROJECT).elf $(PROJECT).hex

program : 
	avrdude -p $(PART) -c $(PROGRAMMER) -e -U flash:w:$(PROJECT).hex

clean :
	rm -f $(PROJECT).elf  rm -f $(PROJECT).hex 

