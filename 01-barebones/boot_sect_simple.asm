; Infinite loop (e9 fd ff)
loop:
    jmp loop

; fill with 510 zeroes minus size of previous code. db is define byte (1 byte)
times 510-($-$$) db 0
; magic number; dw is definte word (2 bytes)
dw 0xaa55
