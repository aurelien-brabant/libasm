; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_str_contains_set.s                              :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/13 22:56:26 by abrabant          #+#    #+#              #
;    Updated: 2021/03/13 22:56:26 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section	.text

global	ft_str_contains_set

extern ft_strchri

ft_str_contains_set:
	push	r12		; to hold arg 1
	push	r13		; to hold arg 2

	mov		r12, rdi
	mov		r13, rsi
	xor		rax, rax
	cmp		byte [r12], 0
	je		epilogue

loop_search:
	cmp		byte [r12], 0
	je		epilogue
	mov		rdi, r13
	mov		sil, byte [r12]
	call	ft_strchri
	cmp		eax, -1
	jne		found
	inc		r12
	xor		rax, rax
	jmp		loop_search

found:
	mov	eax, 1

epilogue:
	pop	r13
	pop	r12
	ret
