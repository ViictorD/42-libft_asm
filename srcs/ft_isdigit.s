section .text
	global _ft_isdigit

; int	(int c)
;            |
;            v
;           rdi

_ft_isdigit:
	cmp		rdi, '0'		; c >= '0'
	jge		digit_last
	jmp		is_false

digit_last:
	cmp		rdi, '9'		; c <= '9'
	jle		is_true
	jmp		is_false

is_true:
	mov		rax, 1		; return (1)
	ret

is_false:
	mov		rax, 0		; return (0)
	ret
