; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_strcmp.s                                        :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/10 19:04:38 by abrabant          #+#    #+#              #
;    Updated: 2021/03/10 19:04:38 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

global	ft_strcmp

ft_strcmp:
	xor rax, rax
	xor	ecx, ecx

loopCmp:
	mov al, byte [rdi]
	cmp al, 0
	je strcmp_ret
	cmp al, byte [rsi]
	jne strcmp_ret
	inc rdi
	inc rsi
	jmp loopCmp 

strcmp_ret:
	mov cl, byte [rsi]
	sub eax, ecx
	ret
