section .text
	global _ft_memalloc
	extern _malloc
	extern _ft_bzero

; void	*(size_t size)
;                  |
;                  v
;                 rdi

_ft_memalloc:
	call	_malloc
	mov		rsi, rdi
	mov		rdi, rax
	call	_ft_bzero
	ret