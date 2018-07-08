section .text
	global _ft_memset

; void	*(void *ptr, int c, size_t len)
;                |       |          |
;                v       v          v
;               rdi     rsi        rdx

_ft_memset:
	mov		r8, rdi		; save pointer

	cmp		rdx, 0		; if (len == 0)
	je		end

	mov		rcx, rdx	; init counter from len
	mov		rax, rsi
	cld
	rep		stosb		; while (len != 0) { *ptr = c }
	jmp		end

end:
	mov		rax, r8
	ret