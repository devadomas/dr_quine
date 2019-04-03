; Who said ASM was easy ?
%define X 0x00
%define Y 0x00
%macro MAIN 0
_main:
push rbp
mov rbp, rsp

mov rdi, filename
mov	rsi, mode
call _fopen
mov r11, rax

mov rdi, rax
mov	rsi, string
mov	rdx, 0xa
mov rcx, 0x3b
mov r8, 0x22
mov r9, string
call _fprintf

mov rdi, r11
call _fclose

leave
ret
%endmacro

section .text

extern _fprintf, _fopen, _fclose
global _main

MAIN

section .data
string db "%2$c Who said ASM was easy ?%1$c%%define X 0x00%1$c%%define Y 0x00%1$c%%macro MAIN 0%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$c%1$cmov rdi, filename%1$cmov	rsi, mode%1$ccall _fopen%1$cmov r11, rax%1$c%1$cmov rdi, rax%1$cmov	rsi, string%1$cmov	rdx, 0xa%1$cmov rcx, 0x3b%1$cmov r8, 0x22%1$cmov r9, string%1$ccall _fprintf%1$c%1$cmov rdi, r11%1$ccall _fclose%1$c%1$cleave%1$cret%1$c%%endmacro%1$c%1$csection .text%1$c%1$cextern _fprintf, _fopen, _fclose%1$cglobal _main%1$c%1$cMAIN%1$c%1$csection .data%1$cstring db %3$c%4$s%3$c, 0%1$cfilename db %3$cGrace_kid.s%3$c, 0%1$cmode db %3$cw%3$c, 0%1$c%1$c", 0
filename db "Grace_kid.s", 0
mode db "w", 0

