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
	test rax, rax
	js cant_mmap

	puts rax, 16

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
