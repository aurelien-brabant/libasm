; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    test_ft_strlen.s                                   :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/10 18:33:34 by abrabant          #+#    #+#              #
;    Updated: 2021/03/10 18:33:34 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section .data
	strlen1	db "Hello world, this is a string",0
	strlen2	db "This is another string", 0
	strlen3	db 0
	strlen4	db "h",0
	strlen5	db "he",0
	strlen6	db "hel",0
	strlen_arr		dq strlen1, strlen2, strlen3, strlen4, strlen5, strlen6, 0

	; for output
	fmt		db 'string: "%s"',10,"strlen          => %ld", 10, "ft_strlen       => %ld", 10, 0

global	test_ft_strlen

extern	ft_strlen
extern	printf
extern	strlen
extern	test_strlen_cmp
extern test_output

; TEST FT_STRLEN FUNCTION
;
; r12 used as an iterator.
; r13 used to hold strlen's return value.
; r14 used to hold ft_strlen's return value.
; r12-14 GPRs are used because they're callee saved which is convenient.

test_ft_strlen:
	xor 	r12, r12
	jmp 	loopTest

loopTest:
	cmp		qword [strlen_arr + r12 * 8], 0
	je		exit_test
	mov		rdi, [strlen_arr + r12 * 8]
	call	strlen
	mov		r13, rax
	call	ft_strlen
	mov		r14, rax

	; output
	mov		rdi, fmt
	mov		rsi, [strlen_arr + r12 * 8]
	mov		rdx, r13
	mov		rcx, r14
	call	printf

	lea		rdi, test_strlen_cmp
	mov		rsi, r13
	mov		rdx, r14
	call	test_output
	
	inc		r12
	jmp		loopTest

exit_test:
	ret
