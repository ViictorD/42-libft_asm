section	.text
	global _ft_strcat

; char *(char *dest, const char *src)
;                |                |
;                v                v
;               rdi              rsi

_ft_strcat:
	mov		rax, rdi
	call	end_rdi
	call	cpy_data 

end_rdi:
	cmp		BYTE [rdi], 0	; *dest !=0
	je		end
	inc		rdi				; ++dest;
	jmp		end_rdi

cpy_data:
	cmp		BYTE [rsi],	0	; *src != 0
	je		end_cpy
	mov		bl, [rsi]		; bl = *src
	mov		BYTE [rdi],	bl	; *rdi = bl
	inc		rsi				; ++rsi
	inc		rdi				; ++rdi
	jmp		cpy_data

end:
	ret

end_cpy:
	mov		BYTE [rdi],	0	; *rdi = 0
	ret
