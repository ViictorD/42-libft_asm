section .text
	global _ft_isascii

; int	(int c)
;            |
;            v
;           rdi

_ft_isascii:
	cmp		rdi, 0		; c >= 0'
	jge		ascii_last
	jmp		is_false

ascii_last:
	cmp		rdi, 127	; c <= 127
	jle		is_true
	jmp		is_false

is_true:
	mov		rax, 1		; return (1)
	ret

is_false:
	mov		rax, 0		; return (0)
	ret
