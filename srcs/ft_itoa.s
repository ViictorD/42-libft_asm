section .text
	global _ft_itoa
	extern _malloc

; char *(long nb)
;              |
;              v
;             rdi

_ft_itoa:
	; len du nombre
	mov		rax, rdi		; cpy nb
	mov		rbx, 0

	call	remove_neg
	mov		r10, 10
	call	len_nb

	mov		r9, rbx
	dec		r9
	mov		rax, 1
	call	init_div

	mov		r9, rax			; save div

	test	rdi, rdi
	js		is_neg

	push	rdi
	push	r9
	mov		rdi, rbx
	add		rdi, 1
	call	_malloc
	pop		r9
	pop		rdi
	mov		r8, rax
	mov		r11, rax		; save begining of pointer
	jmp		loop_convert

remove_neg:
	test	rax, rax
	js		remove_neg2
	ret

remove_neg2:
	neg		rax
	ret

len_nb:
	cmp		rax, 0
	je		end

	mov		rdx, 0
	div		r10

	inc		rbx
	jmp		len_nb

init_div:
	cmp		r9, 0
	je		end

	mul		r10

	dec		r9
	jmp		init_div

is_neg:
	neg		rdi

	push	rdi
	push	r9
	add		rbx, 2		; += 2
	mov		rdi, rbx
	call	_malloc
	pop		r9
	pop		rdi
	mov		BYTE [rax], '-'
	mov		r8, rax
	mov		r11, rax	; save begining of pointer
	inc		r8
	sub		rbx, 1

loop_convert:
	cmp		rdi, 0
	je		ret_value

	mov		rax, rdi
	mov		rdx, 0
	div		r9

	add		rax, 48

	mov		BYTE [r8], al
	inc		r8

	mov		rdi, rdx			; modulo

	mov		rax, r9
	mov		rdx, 0
	div		r10

	mov		r9, rax

	jmp		loop_convert

ret_value:
	inc		r8
	mov		BYTE [r8], 0
	mov		rax, r11
	ret

end:
	ret
