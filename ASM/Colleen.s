; Who said ASM was easy ?
section .text

extern _printf
global _main

_exit:
leave
ret

_main:
; This is BULLSHIT
push rbp
mov rbp, rsp
mov	rdi, string
mov	rsi, 0xa
mov rdx, 0x3b
mov rcx, 0x22
mov r8, string

call _printf
call _exit

section .data
string db "%2$c Who said ASM was easy ?%1$csection .text%1$c%1$cextern _printf%1$cglobal _main%1$c%1$c_exit:%1$cleave%1$cret%1$c%1$c_main:%1$c%2$c This is BULLSHIT%1$cpush rbp%1$cmov rbp, rsp%1$cmov	rdi, string%1$cmov	rsi, 0xa%1$cmov rdx, 0x3b%1$cmov rcx, 0x22%1$cmov r8, string%1$c%1$ccall _printf%1$ccall _exit%1$c%1$csection .data%1$cstring db %3$c%4$s%3$c, 0%1$c", 0
