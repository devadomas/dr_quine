%define COUNT 5
DEFAULT REL

section .data
string:		db "%%define COUNT %4$d%1$cDEFAULT REL%1$c%1$csection .data%1$cstring:		db %2$c%3$s%2$c, 0%1$cfmt:		db %2$cSully_%%d.s%2$c, 0%1$cmode_w:		db %2$cw+%2$c, 0%1$cmode_r:		db %2$cr%2$c, 0%1$ccomb:		db %2$c~/.brew/bin/nasm -f macho64 Sully_%%1$d.s -o ../Sully_%%1$d.o && ld -lSystem -macosx_version_min 12.10 ../Sully_%%1$d.o -o ./Sully_%%1$d && ./Sully_%%1$d%2$c, 0%1$c%1$csection .bss%1$cfile:		resb 16%1$cfile_check: resb 16%1$citer:		resb 4%1$ccomp:		resb 16%1$cfd:			resb 1%1$c%1$csection .text%1$c	global _main%1$c	extern _sprintf%1$c	extern _fprintf%1$c	extern _fopen%1$c	extern _fclose%1$c	extern _system%1$c%1$c_main:%1$c	push rbp%1$c	mov rbp, rsp%1$c%1$c.initialize_iter:%1$c	mov byte [iter], COUNT%1$c	cmp byte [iter], 0%1$c	jle .exit%1$c%1$c.decrement_iter:%1$c	lea rdi, [file_check]%1$c	lea rsi, [fmt]%1$c	mov rdx, [iter]%1$c	call _sprintf%1$c	lea rdi, [file_check]%1$c	lea rsi, [mode_r]%1$c	mov rax, 0%1$c	call _fopen%1$c	cmp rax, 0%1$c	je .write_to_file%1$c	dec byte [iter]%1$c	mov rdi, rax%1$c	call _fclose%1$c%1$c.write_to_file:%1$c	lea rdi, [file]%1$c	lea rsi, [fmt]%1$c	mov rdx, [iter]%1$c	call _sprintf%1$c%1$c	lea rdi, [file]%1$c	lea rsi, [mode_w]%1$c	mov rax, 0%1$c	call _fopen%1$c	cmp rax, 0%1$c	je .exit%1$c%1$c	mov [fd], rax%1$c	mov rdi, rax%1$c	lea rsi, [string]%1$c	mov rdx, 0xa%1$c	mov rcx, 0x22%1$c	lea r8, [string]%1$c	mov r9, [iter]%1$c	mov rax, 0%1$c	call _fprintf%1$c%1$c	mov rdi, [fd]%1$c	mov rax, 0%1$c	call _fclose%1$c%1$c.run_command:%1$c	lea rdi, [comp]%1$c	lea rsi, [comb]%1$c	mov rdx, [iter]%1$c	call _sprintf%1$c%1$c	lea rdi, [comp]%1$c	mov rax, 0%1$c	call _system%1$c%1$c.exit:%1$c	leave%1$c	ret%1$c", 0
fmt:		db "Sully_%d.s", 0
mode_w:		db "w+", 0
mode_r:		db "r", 0
comb:		db "~/.brew/bin/nasm -f macho64 Sully_%1$d.s -o ../Sully_%1$d.o && ld -lSystem -macosx_version_min 12.10 ../Sully_%1$d.o -o ./Sully_%1$d && ./Sully_%1$d", 0

section .bss
file:		resb 16
file_check: resb 16
iter:		resb 4
comp:		resb 16
fd:			resb 1

section .text
	global _main
	extern _sprintf
	extern _fprintf
	extern _fopen
	extern _fclose
	extern _system

_main:
	push rbp
	mov rbp, rsp

.initialize_iter:
	mov byte [iter], COUNT
	cmp byte [iter], 0
	jle .exit

.decrement_iter:
	lea rdi, [file_check]
	lea rsi, [fmt]
	mov rdx, [iter]
	call _sprintf
	lea rdi, [file_check]
	lea rsi, [mode_r]
	mov rax, 0
	call _fopen
	cmp rax, 0
	je .write_to_file
	dec byte [iter]
	mov rdi, rax
	call _fclose

.write_to_file:
	lea rdi, [file]
	lea rsi, [fmt]
	mov rdx, [iter]
	call _sprintf

	lea rdi, [file]
	lea rsi, [mode_w]
	mov rax, 0
	call _fopen
	cmp rax, 0
	je .exit

	mov [fd], rax
	mov rdi, rax
	lea rsi, [string]
	mov rdx, 0xa
	mov rcx, 0x22
	lea r8, [string]
	mov r9, [iter]
	mov rax, 0
	call _fprintf

	mov rdi, [fd]
	mov rax, 0
	call _fclose

.run_command:
	lea rdi, [comp]
	lea rsi, [comb]
	mov rdx, [iter]
	call _sprintf

	lea rdi, [comp]
	mov rax, 0
	call _system

.exit:
	leave
	ret
