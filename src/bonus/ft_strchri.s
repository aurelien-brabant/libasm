; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_strchri.s                                       :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/12 14:29:14 by abrabant          #+#    #+#              #
;    Updated: 2021/03/12 14:29:14 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

global	ft_strchri

ft_strchri:
	mov	eax, -1

loopCheck:
	inc	eax
	cmp	sil, byte [rdi + rax]
	je	ret_strchri
	cmp	byte [rdi + rax], 0
	jne	loopCheck
	mov	eax, -1		; char not found

ret_strchri:
	ret
