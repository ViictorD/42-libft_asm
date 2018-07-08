%define CALL_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4
%define	BUFF_SIZE			4096

section .text
	global _ft_cat

; void	(long fd)
;             |
;             v
;            rdi

_ft_cat:
	test	rdi, rdi				; if (fd < 0)
	js		bad_fd

cat:
	push	rbp
	mov		rbp, rsp
	sub		rbp, BUFF_SIZE			; allocate buff size on the stack
	mov		rbx, rdi				; save fd
	jmp		read


read:
	mov		rax, CALL_SYSCALL(READ)	; Set the system call
	mov		rdi, rbx				; param 1
	mov		rsi, rbp				; param 2
	mov		rdx, BUFF_SIZE			; param 3
	syscall
	cmp		rax, -1					; if read fail
	je		end
	cmp		rax, 0					; if eot
	je		end
	jmp		write

write:
	mov		rdi, STDOUT				; param 1
	mov		rsi, rbp				; param 2
	mov		rdx, rax				; param 3
	mov		rax, CALL_SYSCALL(WRITE)
	syscall
	jmp		read

end:
	pop		rbp
	ret

bad_fd:
	ret