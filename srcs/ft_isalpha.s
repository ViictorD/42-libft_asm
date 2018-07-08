section .text
	global _ft_isalpha

; int	(int c)
;            |
;            v
;           rdi

_ft_isalpha:
	cmp		rdi, 97		; c >= 'a'
	jge		alpha_min_last
	cmp		rdi, 65		; c >= 'A'
	jge		alpha_maj_last
	jmp		is_false

alpha_min_last:
	cmp		rdi, 122	; c <= 'z'
	jle		is_true
	jmp		is_false

alpha_maj_last:
	cmp		rdi, 90		; c <= 'Z'
	jle		is_true
	jmp		is_false

is_true:
	mov		rax, 1		; return (1)
	ret

is_false:
	mov		rax, 0		; return (0)
	ret