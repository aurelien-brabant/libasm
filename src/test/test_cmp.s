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
global	test_strcmp_cmp
global	test_strcpy_cmp
global	test_strdup_cmp

extern	strcmp

; rdi => strlen's len
; rsi => ft_strlen's len
test_strlen_cmp:
	mov	rax, rdi
	sub	rax, rsi	; rax will be set to zero if lens are equal
	ret

; STRCMP_CMP ;

; rdi => strcmp's return value
; rsi => ft_strcmp's return value
test_strcmp_cmp:
	cmp	rdi, 0
	jg	test_strcmp_gt
	jl	test_strcmp_lt
	cmp rsi, 0
	je	ret_zero
	jmp	ret_non_zero

test_strcmp_gt:
	cmp rsi, 0
	jg ret_zero
	jmp ret_non_zero

test_strcmp_lt:
	cmp rsi, 0
	jl ret_zero
	jmp ret_non_zero

; STRCMP_CMP ;

; STRDUP_CMP ;

; rdi => strdup's return value
test_strdup_cmp:
	cmp		rdi, rsi	; ensure returned addresses are different
	je		ret_non_zero
	call	strcmp		; ensure generated strings are identical
	ret

; STRDUP_CMP ;

test_strcpy_cmp:
	call	strcmp	; a simple call to strcmp using rdi and rsi will set rax to zero if the strings are equal.
	ret

ret_zero:
	mov	rax, 0
	ret

ret_non_zero:
	mov	rax, 1
	ret
