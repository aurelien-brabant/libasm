; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    test_ft_io.s                                       :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/11 16:00:36 by abrabant          #+#    #+#              #
;    Updated: 2021/03/11 16:00:36 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section	.bss
	line	resb	10000	; to store each line read from user's input

section	.text
global	test_ft_io
extern	ft_read
extern	ft_write

test_ft_io:
	push	r12

initRead:
	xor		r12, r12	; iterator

readNextChar:
	mov 	rdi, 0					; fd for read, stdin
	lea 	rsi, [line + r12]		; store read character
	mov 	rdx, 1					; read only one character from stdin
	call	ft_read
	cmp		byte [line + r12], 10	; if newline is found, write
	je		initWriteLine
	inc		r12
	jmp		readNextChar

initWriteLine:
	mov byte [line + r12 + 1], 0
	xor	r12, r12	; reset iterator to zero

writeLine:
	cmp		byte [line + r12], 0
	je		initRead
	mov		rdi, 1
	lea		rsi, [line + r12]
	mov		rdx, 1
	call	ft_write
	inc		r12
	jmp		writeLine

exit_test:
	ret
