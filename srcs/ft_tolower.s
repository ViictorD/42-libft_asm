section .text
	global _ft_tolower

; int	(int c)
;            |
;            v
;           rdi

_ft_tolower:
	call	is_maj
	cmp		rax, 0
	je		end
	add		rdi, 32
	jmp		end

is_maj:
	cmp		rdi, 'A'	; c >= 'A'
	jge		maj_last
	jmp		is_false

maj_last:
	cmp		rdi, 'Z'	; c <= 'Z'
	jle		is_true
	jmp		is_false

is_true:
	mov		rax, 1		; return (1)
	ret

is_false:
	mov		rax, 0		; return (0)
	ret

end:
	mov		rax, rdi
	ret