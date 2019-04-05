; Who said ASM was easy ?
%define X 0x00
%define Y 0x00
%macro MAIN 0
	_main:
		push rbp
		mov rbp, rsp

		.open_file:
			mov rdi, filename
			mov	rsi, mode
			call _fopen
			mov r11, rax
			cmp rax, 0
			je .exit

		.write_file:
		mov rdi, rax
		mov	rsi, string
		mov	rdx, 0xa
		mov rcx, 0x3b
		mov r8, 0x22
		mov r9, string
		cmp rdi, 0
		je .exit
		call _fprintf

		.close_file:
		mov rdi, r11
		call _fclose

		.exit:
		leave
		ret
%endmacro

section .data
	filename:	db "Grace_kid.s", 0
	string:		db "%2$c Who said ASM was easy ?%1$c%%define X 0x00%1$c%%define Y 0x00%1$c%%macro MAIN 0%1$c	_main:%1$c		push rbp%1$c		mov rbp, rsp%1$c%1$c		.open_file:%1$c			mov rdi, filename%1$c			mov	rsi, mode%1$c			call _fopen%1$c			mov r11, rax%1$c			cmp rax, 0%1$c			je .exit%1$c%1$c		.write_file:%1$c		mov rdi, rax%1$c		mov	rsi, string%1$c		mov	rdx, 0xa%1$c		mov rcx, 0x3b%1$c		mov r8, 0x22%1$c		mov r9, string%1$c		cmp rdi, 0%1$c		je .exit%1$c		call _fprintf%1$c%1$c		.close_file:%1$c		mov rdi, r11%1$c		call _fclose%1$c%1$c		.exit:%1$c		leave%1$c		ret%1$c%%endmacro%1$c%1$csection .data%1$c	filename:	db %3$cGrace_kid.s%3$c, 0%1$c	string:		db %3$c%4$s%3$c, 0%1$c	mode:		db %3$cw%3$c, 0%1$c%1$csection .text%1$c	global _main%1$c	extern _fprintf, _fopen, _fclose%1$c%1$cMAIN%1$c", 0
	mode:		db "w", 0

section .text
	global _main
	extern _fprintf, _fopen, _fclose

MAIN
