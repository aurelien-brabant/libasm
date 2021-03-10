; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    test_cmp.s                                         :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/10 19:01:47 by abrabant          #+#    #+#              #
;    Updated: 2021/03/10 19:01:47 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

; COMPARISON FUNCTIONS USED TO DECIDE IF THE TEST HAS PASSED OR NOT
; rax is set to zero if success, any other value means failure.

global	test_strlen_cmp

; rdi => strlen's len
; rsi => ft_strlen's len
test_strlen_cmp:
	mov rax, rdi
	sub rax, rsi	; rax will be set to zero if lens are equal
	ret
