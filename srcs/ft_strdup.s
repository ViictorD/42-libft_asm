section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_memcpy

; char	*(char *str)
;                |
;                v
;               rdi

_ft_strdup:
	cmp		rdi, 0			; if (str == NULL)
	je		ret_null

	mov		rbx, rdi		; save le pointer
	call	_ft_strlen		; string len
	mov		rdi, rax
	mov		r8, rax
	call	_malloc
	mov		rdx, r8			; len = rdi
	mov		rdi, rax		; dst = rax
	mov		rsi, rbx		; src = r8
	call	_ft_memcpy
	ret

ret_null:
	mov		rax, 0
	ret