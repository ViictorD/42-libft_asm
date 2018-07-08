section .text
	global _ft_strlen

; size_t	(char *str)
;                   |
;                   v
;                  rdi

_ft_strlen:
	mov		al, 0
	cld
	mov		rcx, -1			; i = -1
	repne	scasb			; rcx != 0
	mov		rax, -2
	sub		rax, rcx
	ret
