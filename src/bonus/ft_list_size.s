; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_list_size.s                                     :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/13 01:44:22 by abrabant          #+#    #+#              #
;    Updated: 2021/03/13 01:44:22 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

global	ft_list_size

; rdi: pointer to the first node of the list 
ft_list_size:
	xor	rax, rax	; init rax to zero, used as a counter
	cmp	qword rdi, 0
	je	epilogue

listLoop:
	inc	rax
	cmp	qword [rdi + 8], 0
	je	epilogue
	mov	rdi, qword [rdi + 8]
	jmp	listLoop

epilogue:
	ret
