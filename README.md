# lesson 1

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

to compile:

```shell
nasm -f bin boot_sect_simple.asm -o boot_sect_simple.bin
```

to run in emulator

```shell
qemu boot_sect_simple.bin
```

# lesson 2

interrupt -> stop whatever you're doing. triggered by int instruction.

int 0x80 -> jump to kernel's syscall handler

cpu registers -> fastest memory a cpu has. hold current state

tty mode --> teletypewriter
- the abstract interface between the OS and anything acting like a terminal

line-oriented device that handles:
- input (keyboard)
- output(text)
- editing rules like backspace, ctrl keys
signals (ctrl-c, ctrl-z)
- echoing characters

tty mode is how terminal handles input. there are two modes.

1. canonical (cooked mode)
tty acts like a line editor
input is buffered until enter, backspace works, ctrl u deletes line, ctrl-c sends SIGINT, ctrl d sends EOF, arrow keys do things 

programme receives whole lines instead of characters immediately

2. raw mode (non-canonical)
tty stops helping you
- no line editing
- no echo 
- gets character immediately
ctrl c does not generate sigint. no buffering. arrow keys deliver raw escape sequences

tty mode determines how system delivers input to user programs. it is a device in linux. linux exposes tty devices as files. 
/dev/tty # controlling terminal
/dev/pts/0 # pseudo terminal
/dev/tty1 #virtual console
