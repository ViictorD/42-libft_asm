%define CALL_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .text
	global _ft_putchar

; int	(char c)
;              |
;              v
;             rdi

_ft_putchar:
	push	rbp
	mov		rbp, rsp
	sub		rbp, 1					; alloc on stack 1

	mov		rax, rdi
	mov		rdi, rbp
	stosb							; cpy c into buff

	mov		rsi, rbp				; param 2 of write
	mov		rdi, STDOUT				; param 1 of write
	mov		rdx, 1					; param 3 of write
	mov		rax, CALL_SYSCALL(WRITE)
	syscall
	pop		rbp
	ret
