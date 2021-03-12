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
	mov		sil, byte [r13]
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
	neg	dword [rsp + 8]	; change sign variable, add eight because a call instruction has been performed
	jmp	findSign


; ensure that the base is correct (i.e has no duplicate)

ft_atoi_base:
	push	r12
	push	r13
	push	r14
	push	r15
	sub		rsp, 4		; sign variable, 1 or -1 (4 bits) + alignement
	mov		r13, rdi	; first argument
	mov		r14, rsi	; second argument
	xor		r12, r12	; iterator
	mov		rdi, r14

	; check if base length is greater than 1
	mov		rdi, r14
	call	ft_strlen
	mov		r15, rax
	cmp		r15, 2
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
	mov		dword [rsp], 1 ; set to positive by default
	dec		r13
	call	findSign

buildNb:
	mov		rdi, r14
	mov		sil, byte [r13]
	call	ft_strchri
	mov		r10d, eax	; save the result temporary
	cmp		r10d, -1
	je		epilogue	; found a character not included in the base, stop there
	mov		eax, r12d
	mul		r15d
	add		eax, r10d	; add result of ft_strchri
	mov		r12d, eax
	inc		r13
	jmp		buildNb

ret_error
	mov	r12d, 0

epilogue:
	mov		eax, r12d;
	imul	dword [rsp]
	add		rsp, 4
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	ret
