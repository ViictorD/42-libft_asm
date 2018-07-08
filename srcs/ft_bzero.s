section .text
	global _ft_bzero

; void (void *mem, size_t len)
;              |            |
;              v            v
;             rdi          rsi

_ft_bzero:
	cmp		rsi,	0		; while (len != 0)
	je		end
	mov		BYTE [rdi], 0	; *mem = 0
	inc		rdi				; ++mem
	dec		rsi				; --len
	jmp		_ft_bzero		; jump to _ft_bzero

end:
	ret
