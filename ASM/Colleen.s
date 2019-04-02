; Who said ASM was easy ?
section .text

extern _printf
global _main

_exit:
leave
ret

_main:
; This is BULLSHIT
push ebp
mov rbp, rsp
mov	rdi, string
mov	rsi, 0xa
mov rdx, 0x3b
mov rcx, 0x22
mov r8, string

call _printf
call _exit



section .data
string db "%2$c Who said ASM was easy ?%1$csection .text%1$cglobal _main%1$c_function:%1$cpush dword 0%1$cmov eax, 0x1%1$csub esp, 4%1$cint 0x80%1$c_main:%1$c%2$c Even the main is bullshit%1$cpush dword len%1$cpush dword string%1$cpush dword 1%1$cmov eax, 0x4%1$csub esp, 4%1$cint 0x80%1$cadd esp, 16%1$ccall _function%1$csection .data%1$cstring db %3$c%4$s%3$c%1$clen equ $-string"
len equ $-string
