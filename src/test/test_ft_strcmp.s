; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    test_ft_strcmp.s                                   :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/10 19:24:00 by abrabant          #+#    #+#              #
;    Updated: 2021/03/10 19:24:00 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section	.data
	strcmp1_str1	db "hello",0
	strcmp1_str2	db "hella",0

	strcmp2_str1	db "hey",0
	strcmp2_str2	db "hey",0

	strcmp3_str1	db 0
	strcmp3_str2	db "Hello, world",0

	strcmp4_str1	db "Hello, world",0
	strcmp4_str2	db 0

	strcmp5_str1	db "hella",0
	strcmp5_str2	db "hello",0

	strcmp6_str1	db "hellA",0
	strcmp6_str2	db "hella",0

	strcmp7_str1	db 0
	strcmp7_str2	db 0

	strcmp_arr		dq strcmp1_str1, strcmp1_str2, strcmp2_str1, strcmp2_str2,	\
					strcmp3_str1, strcmp3_str2, strcmp4_str1, strcmp4_str2,		\
					strcmp5_str1, strcmp5_str2, strcmp6_str1, strcmp6_str2,		\
					strcmp7_str1, strcmp7_str2, 0

	; for printf
	strcmp_fmt	db 's1="%s", s2="%s"',10,"strcmp          => %d",10,"ft_strcmp       => %d",10,0

section .text

global test_ft_strcmp

extern printf
extern strcmp
extern ft_strcmp
extern test_strcmp_cmp
extern test_output

; r12 used as iterator
; r13d used to hold strcmp's return value
; r14d used to hold ft_strcmp's return value

test_ft_strcmp:
	push	r12
	push	r13
	push	r14
	sub		rsp, 8
	xor		r12, r12

loopStrcmp:
	cmp qword [strcmp_arr + r12 * 8], 0
	je exit_test
	mov rdi, [strcmp_arr + r12 * 8]
	mov rsi, [strcmp_arr + r12 * 8 + 8]
	call strcmp
	mov r13d, eax
	call ft_strcmp
	mov r14d, eax
	; printf
	mov edi, strcmp_fmt
	mov esi, [strcmp_arr + r12 * 8]
	mov edx, [strcmp_arr + r12 * 8 + 8]
	mov ecx, r13d
	mov r8d, r14d
	call printf
	mov rdi, test_strcmp_cmp
	mov esi, r13d
	mov edx, r14d
	call test_output
	add r12, 2	; go to the next string duo
	jmp loopStrcmp

exit_test:
	add	rsp, 8
	pop	r14
	pop	r13
	pop	r12
	ret
