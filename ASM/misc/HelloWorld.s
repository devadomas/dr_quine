; nasm -f macho -o Colleen.o Colleen.s; ld -lSystem -macosx_version_min 12.10 -o Colleen Colleen.o

section .text

global _main                ; make the main function externally visible

_main:

; 1 print "hello, world"

    ; 1a prepare the arguments for the system call to write
    push dword len          ; message length                           
    push dword msg          ; message to write
    push dword 1              ; file descriptor value

    ; 1b make the system call to write
    mov eax, 0x4              ; system call number for write
    sub esp, 4                ; OS X (and BSD) system calls needs "extra space" on stack
    int 0x80                  ; make the actual system call

    ; 1c clean up the stack
    add esp, 16               ; 3 args * 4 bytes/arg + 4 bytes extra space = 16 bytes
    
; 2 exit the program

    ; 2a prepare the argument for the sys call to exit
    push dword 0              ; exit status returned to the operating system

    ; 2b make the call to sys call to exit
    mov eax, 0x1              ; system call number for exit
    sub esp, 4                ; OS X (and BSD) system calls needs "extra space" on stack
    int 0x80                  ; make the system call

    ; 2c no need to clean up the stack because no code here would executed: already exited
    
section .data

  msg db "hello, world", 0xa  ; string with a carriage-return
  len equ $-mymsg             ; string length in bytes