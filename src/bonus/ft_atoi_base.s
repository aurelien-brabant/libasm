; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_atoi_base.s                                     :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/12 11:39:06 by abrabant          #+#    #+#              #
;    Updated: 2021/03/12 11:39:06 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section	.data
	space_charset	db	`\t\v\r\f\n \0`

section	.text

global	ft_atoi_base

extern	ft_str_is_uniq
extern	ft_strchri
extern	ft_strlen

; skip all the spaces in space_charset
skipSpace:
	inc		r13
	mov		rdi, space_charset
	mov		esi, [r13]
	call	ft_strchri
	cmp		eax, -1
	jne 	skipSpace
	ret

; find the appropriated sign
findSign:
	inc		r13
	cmp		byte [r13], 0x2D
	je		negSign
	cmp		byte [r13], 0x2B
	je		findSign
	ret

negSign:
	neg	cl
	jmp	findSign


; ensure that the base is correct (i.e has no duplicate)

ft_atoi_base:
	push	r12
	push	r13
	push	r14
	mov		r13, rdi	; first argument
	mov		r14, rsi	; second argument
	xor		r12, r12	; iterator
	mov		rdi, r14

	; check if base length is greater than 1
	mov		rdi, r14
	call	ft_strlen
	cmp		rax, 2
	jl		ret_error
	; check if base has no duplicate
	mov		rdi, r14
	call	ft_str_is_uniq
	cmp		rax, 0
	je		ret_error
	; base is sane

	; skip all kind of whitespaces
	dec		r13
	call	skipSpace

	; get sign
	mov		cl, 1	; set to positive by default
	dec		r13
	call	findSign

	xor		rax, rax
	mov		al, byte [r13]

	jmp		epilogue

ret_error
	mov	rax, 0

epilogue:
	pop	r14
	pop	r13
	pop	r12
	ret
