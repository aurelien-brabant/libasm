; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_strlen.s                                        :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/10 18:57:24 by abrabant          #+#    #+#              #
;    Updated: 2021/03/10 18:57:24 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

global ft_strlen

ft_strlen:
	xor rax, rax

loopUntilNull:
	inc	rax
	cmp	byte [rdi + rax - 1], 0
	jne	loopUntilNull
	dec	rax
	ret
