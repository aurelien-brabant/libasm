; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_str_is_uniq.s                                   :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/12 13:02:47 by abrabant          #+#    #+#              #
;    Updated: 2021/03/12 13:02:47 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section .text

global	ft_str_is_uniq

; arg1: rdi (string)
ft_str_is_uniq:
	xor	r10, r10	; i
	xor	r11, r11	; j

highLoop:
	cmp	byte [rdi + r10], 0
	je	ret_uniq
	mov	r11, r10

low_loop:
	inc	r11
	mov	al, [rdi + r10]
	cmp	byte [rdi + r11], al
	je	ret_non_uniq
	cmp	byte [rdi + r11], 0
	jne low_loop
	inc	r10
	jmp highLoop

ret_uniq:
	mov	rax, 1
	ret

ret_non_uniq:
	mov	rax, 0
	ret
