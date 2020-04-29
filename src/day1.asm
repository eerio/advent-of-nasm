; Advent of code 2019, day 1
%include "system.mac"

%define TO_READ 1024

	global _start
	section .text
_start:
	open filename, O_RDONLY
	test rax, rax
	js cant_open

	mmap 0, TO_READ, PROT_READ, MAP_SHARED, rax, 0
	;mov r8, rax
	;mov rax, SYS_MMAP
	;mov rdi, 0
	;mov rsi, 1024
	;mov rdx, PROT_READ
	;mov r10, MAP_SHARED
	;mov r9, 0
	;syscall

	test rax, rax
	js cant_mmap

	mov rsi, rax
	mov rax, SYS_WRITE
	mov rdi, STDOUT_FILENO
	mov rdx, 16
	syscall

	puts "fine!"
	exit EXIT_OK

cant_open:
	puts "Cant open"
	exit 1
cant_mmap:
	puts "Cant mmap"
	exit 1
cant_munmap:
	puts "Cant munmap"
	exit 1

	section .data
filename: db "o.in"
