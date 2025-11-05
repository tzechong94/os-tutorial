1. assembler -> converts assembly language to machine language
2. Bios -> basic io system. does basic stuff before handing over to bootloader

how they work tgt
1. bios runs when computer starts
2. loads bootloader from disk to memory
3. bootloader usually written in assembly assembled with nasm
4. bootloader can:
- print messages, switch cpu to protected mode, load a larger OS kernel
5. os kernel can take over, eventually written in C or other languages, but it initially relies on low level foundation wrote in assembly

when computer boots, bios doesn't know how to load the os. delegates to boot sector. therefore it has to be placed in a known standard location. 
- first sector of the disk (cylinder 0, head 0, sector 0) and it takes 512 bytes

to make sure disk is bootable, bios checks bytes 511 and 512 of the alleged boot sector are bytes 0xAA55. 

note: little endian
