section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

; int	(int c)
;            |
;            v
;           rdi

_ft_isalnum:
	call	_ft_isalpha
	cmp		rax, 1
	je		end
	call	_ft_isdigit

end:
	ret