; Who said ASM was easy ?
section .data
string: db "%2$c Who said ASM was easy ?%1$csection .data%1$cstring: db %3$c%4$s%3$c, 0%1$c%1$csection .text%1$c	global _main%1$c	extern _printf%1$c%1$c_exit:%1$c	leave%1$c	ret%1$c%1$c_main:%1$c	%2$c This is BULLSHIT%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c	mov	rdi, string%1$c	mov	rsi, 0xa%1$c	mov rdx, 0x3b%1$c	mov rcx, 0x22%1$c	mov r8, string%1$c%1$c	call _printf%1$c	call _exit%1$c", 0

section .text
	global _main
	extern _printf

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
