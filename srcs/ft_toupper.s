section .text
	global _ft_toupper

; int	(int c)
;            |
;            v
;           rdi

_ft_toupper:
	call	is_lower
	cmp		rax, 0
	je		end
	sub		rdi, 32
	jmp		end

is_lower:
	cmp		rdi, 'a'	; c >= 'a'
	jge		lower_last
	jmp		is_false

lower_last:
	cmp		rdi, 'z'	; c <= 'z'
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