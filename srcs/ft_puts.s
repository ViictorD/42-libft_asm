%define CALL_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data
string:
	.endl 	db 10

section .text
	global _ft_puts

; int	(char *str)
;               |
;               v
;              rdi

_ft_puts:
	mov		rbx, rdi				; save rdi
	mov		rcx, 0					; index to 0
	call	strlen

	mov		rsi, rdi				; param 2 of write
	mov		rdi, STDOUT				; param 1 of write
	mov		rdx, rcx				; param 3 of write
	mov		rax, CALL_SYSCALL(WRITE)
	syscall
	cmp		rax, 0
	je		end

	mov		rdi, STDOUT				; param 1 of write
	lea		rsi, [rel string.endl]	; prarm 2 of write
	mov		rdx, 1					; param 3 of write
	mov		rax, CALL_SYSCALL(WRITE)
	syscall


strlen:
	cmp		BYTE [rbx], 0
	je		end
	inc		rcx
	inc		rbx
	jmp		strlen

end:
	ret