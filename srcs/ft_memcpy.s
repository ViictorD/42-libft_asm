section .text
	global _ft_memcpy

; void	*(void *dst, void *src, size_t n)
;                |          |          |
;                v          v          v
;               rdi        rsi        rdx

_ft_memcpy:
	mov		rax, rdi	; set return pointer
	mov		rcx, rdx	; init counter from len
	inc		rcx
	cld
	rep		movsb		; while (len != 0) { *ptr = c }
	
	ret
