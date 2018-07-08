section .text
	global _ft_putnbr
	extern _ft_putchar

; void	(long nb)
;             |
;             v
;            rdi

_ft_putnbr:					; r8 = nb, r9 = nb len, r10 = power
	call	check_neg

	mov		r8, rdi			; save nb
	mov		r12, rdi		; cpy nb
	mov		rcx, 0			; set index to 0
	call	len_nb			; get len of nb

	mov		r9, rcx			; save nb len
	mov		r10, 1
	call	power
	
	call	loop_nb			; print
	ret

check_neg:
	test	rdi, rdi
	js		is_neg
	ret

is_neg:
	neg		rdi				; change neg to positive

	mov		r8, rdi
	mov		rdi, 45
	call	_ft_putchar
	mov		rdi, r8
	ret

len_nb:
	cmp		r12, 10
	jl		end

	mov		rdx, 0			; ret
	mov		rax, r12		; nb to div
	mov		rbx, 10			; diviser
	div		rbx
	
	mov		r12, rax
	inc		rcx
	jmp		len_nb

loop_nb:
	cmp		r9, 0			; r9 = i, r10 = j
	jl		end
	call	write
	dec		r9


	mov		rdx, 0			; ret modulo
	mov		rax, r8			; nb to div
	mov		rbx, r10		; diviser
	div		rbx

	mov		r8, rdx			; modulo
	

	mov		rdx, 0			; ret
	mov		rax, r10		; nb to div
	mov		rbx, 10			; diviser
	div		rbx

	mov		r10, rax

	jmp		loop_nb

power:
	cmp		rcx, 0			; while (rcx != 0)
	je		end
	dec		rcx

	mov		rax, r10
	mov		rdx, 10
	mul		rdx				; r10 * 10

	mov		r10, rax

	jmp		power

write:
	mov		r11, r8

	mov		rdx, 0			; ret
	mov		rax, r11		; nb to div
	mov		rbx, r10		; diviser
	div		rbx

	mov		r11, rax
	add		r11, 48
	mov		rdi, r11
	call	_ft_putchar

end:
	ret
