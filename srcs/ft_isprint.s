section .text
	global _ft_isprint

; int	(int c)
;            |
;            v
;           rdi

_ft_isprint:
	cmp		rdi, 32		; c >= 32'
	jge		print_last
	jmp		is_false

print_last:
	cmp		rdi, 126	; c <= 127
	jle		is_true
	jmp		is_false

is_true:
	mov		rax, 1		; return (1)
	ret

is_false:
	mov		rax, 0		; return (0)
	ret
