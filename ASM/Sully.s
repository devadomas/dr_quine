section .text

extern _printf, _fprintf, _fopen, _fclose, _sprintf, _system
global _main

_main:
push rbp
mov rbp, rsp

mov r12, 0x5
cmp r12, 0
jl exit

mov rdi, [rsp]
mov rsi, filefmt
mov rdx, r12
call _sprintf

mov rdi, [rsp]
mov	rsi, mode
call _fopen
mov r11, rax
cmp r11, 0
je exit

mov rdi, rax
mov	rsi, string
mov	rdx, 0xa
mov rcx, r12
sub rcx, 1
mov	r8, 0x22
mov r9, string
call _fprintf

mov rdi, r11
call _fclose

mov rdi, [rsp]
mov rsi, command
mov rdx, r12
mov rcx, 0x3b
call _sprintf

mov rdi, [rsp]
call _system

exit:
leave
ret

section .data

string db "section .text%1$c%1$cextern _printf, _fprintf, _fopen, _fclose, _sprintf, _system%1$cglobal _main%1$c%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$c%1$cmov r12, 0x%2$x%1$ccmp r12, 0%1$cjl exit%1$c%1$cmov rdi, [rsp]%1$cmov rsi, filefmt%1$cmov rdx, r12%1$ccall _sprintf%1$c%1$cmov rdi, [rsp]%1$cmov	rsi, mode%1$ccall _fopen%1$cmov r11, rax%1$ccmp r11, 0%1$cje exit%1$c%1$cmov rdi, rax%1$cmov	rsi, string%1$cmov	rdx, 0xa%1$cmov	rcx, r12%1$csub rcx, 1%1$cmov r8, 0x22%1$cmov r9, string%1$ccall _fprintf%1$c%1$cmov rdi, r11%1$ccall _fclose%1$c%1$cmov rdi, [rsp]%1$cmov rsi, command%1$cmov rdx, r12%1$cmov rcx, 0x3b%1$ccall _sprintf%1$c%1$cmov rdi, [rsp]%1$ccall _system%1$c%1$cexit:%1$cleave%1$cret%1$c%1$csection .data%1$cstring db %3$c%4$s%3$c, 0%1$c%1$cfilefmt db %3$cSully_%%d.s%3$c, 0%1$cmode db %3$cw%3$c, 0%1$ccommand db %3$cclang -Wall -Wextra -Werror Sully_%%1$d -o Sully_%%1$d %%2$c ./Sully_%%1$d%3$c, 0%1$c", 0
filefmt db "Sully_%d.s", 0
mode db "w", 0
command db "nasm -f macho64 Sully_%1$d.s -o Sully_%1$d.o %2$c ld -lSystem -macosx_version_min 12.10 -o Sully_%1$d Sully_%1$d.o %2$c ./Sully_%1$d", 0
