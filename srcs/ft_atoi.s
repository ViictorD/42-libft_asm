section .text
	global _ft_atoi
	extern _ft_strlen

; long	(char *nb)
;              |
;              v
;             rdi

_ft_atoi:
	call	loop_blank		; while blank char
	cmp		rdi, 0
	je		ret_null

	mov		rbx, 0
	mov		r11, [rdi]
	cmp		r11b, '-'		; *nb == '-'
	je		save_neg

	jmp		while_zero

loop_blank:
	mov		r11, [rdi]
	cmp		rdi, 0			; null
	je		ret_null
	cmp		r11b, 32			; space
	je		blank_continue
	cmp		r11b, 9			; '\t'
	je		blank_continue
	cmp		r11b, 10			; '\n'
	je		blank_continue
	cmp		r11b, 11			; '\v'
	je		blank_continue
	cmp		r11b, 12			; '\f'
	je		blank_continue
	cmp		r11b, 13			; '\r'
	je		blank_continue
	ret

blank_continue:
	inc		rdi
	jmp		loop_blank

save_neg:
	mov		rbx, 45
	inc		rdi
	cmp		rdi, 0
	je		ret_null
	jmp		while_zero

while_zero:
	cmp		rdi, 0
	je		ret_null
	mov		r11, [rdi]
	cmp		r11b, 48		; while (*nb == '0')
	jne		check_too_large
	inc		rdi
	jmp		while_zero

check_too_large:
	mov		r8, rdi
	call	_ft_strlen

	mov		rdi, r8
	cmp		rax, 18		; if (len > 18)
	jg		ret_null

	mov		r10, rdi	; save str
	mov		al, 0		; set ret value
	mov		rdi, 0
	jmp		loop_convert

loop_convert:
	cmp		r10, 0
	je		ret_value

	mov		r11, [r10]
	
	cmp		r11b, '0'
	jl		ret_value
	cmp		r11b, '9'
	jg		ret_value

	sub		r11, 48			; *str - '0'

	mov		rdx, 10			; set le mul by 10
	mul		rdx

	add		al, r11b		; out + *str

	inc		r10
	jmp		loop_convert

end:
	ret

ret_null:
	mov		rax, 0
	ret

ret_value:
	cmp		rbx, 0
	je		ret_no_neg
	neg		rax
	ret

ret_no_neg:
	ret
