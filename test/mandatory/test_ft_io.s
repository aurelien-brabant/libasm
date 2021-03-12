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

section	.data
	iomsg_interactive	db	`Interactive mode. Input line is read by ft_read, outputed by ft_write, (10000 bytes/line is a maximum)\nType "quit" to exit interactive mode.\n\0`,
	ioquit_interactive	db	`quit\n\0`
	iowrite_error		db	`Test write with invalid fd\nwrite    => %d (errno = %d)\nft_write => %d (errno = %d)\n\0`
	ioread_error		db	`Test read with invalid fd\nread    => %d (errno = %d)\nft_read => %d (errno = %d)\n\0`

section	.text
global	test_ft_io

; glibc
extern	write
extern	read
extern	puts
extern	printf
extern	strcmp
extern	__errno_location

; libasm
extern	ft_read
extern	ft_write

; test
extern	test_output
extern	test_cmp_int

test_ft_io:
	; prologue
	push	r12
	push	r13
	push	r14
	push	r15
	mov		rdi, iomsg_interactive
	call	puts

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
	mov 	byte [line + r12 + 1], 0
	xor		r12, r12	; reset iterator to zero
	mov		rdi, line
	mov		rsi, ioquit_interactive 
	call	strcmp
	je		test_write_error

writeLine:
	cmp		byte [line + r12], 0
	je		initRead
	mov		rdi, 1
	lea		rsi, [line + r12]
	mov		rdx, 1
	call	ft_write
	inc		r12
	jmp		writeLine

; Error testing - ensure that the return value and errno are properly set

test_write_error:
	; get errno
	call	__errno_location	; get errno address
	mov		r12, rax			; set r12d to errno

	; call to glibc's write
	mov		rdi, 42
	xor		rsi, rsi
	xor		rdx, rdx
	call	write
	mov		r13d, eax			; move write's return value in r13d
	mov		r14d, [r12]			; move errno value in r14d
	mov 	dword [r12], 0;		; reset errno

	mov		rdi, 42
	xor		rsi, rsi
	xor		rdx, rdx
	call	ft_write
	mov		r15d, eax			; move ft_write's return value in r15d
	
	mov		rdi, iowrite_error
	mov		esi, r13d
	mov		edx, r14d
	mov		ecx, r15d
	mov		r8, [r12]
	call	printf

	; add return value and errno to make an efficient comparison
	add		r14d, r13d
	add		r15d, [r12]
	mov		rdi, test_cmp_int
	mov		esi, r14d
	mov		edx, r15d
	call	test_output

	mov		dword [r12], 0;		; reset errno

test_read_error:
	; call to glibc's read
	mov		rdi, 42
	xor		rsi, rsi
	xor		rdx, rdx
	call	read
	mov		r13d, eax			; move read's return value in r13d
	mov		r14d, [r12]			; move errno value in r14d

	mov		dword [r12], 0;		; reset errno

	mov		rdi, 42
	xor		rsi, rsi
	xor		rdx, rdx
	call	ft_read
	mov		r15d, eax			; move ft_read's return value in r15d
	
	mov		rdi, ioread_error
	mov		esi, r13d
	mov		edx, r14d
	mov		ecx, r15d
	mov		r8, [r12]
	call	printf

	; add return value and errno to make an efficient comparison
	add		r14d, r13d
	add		r15d, [r12]
	mov		rdi, test_cmp_int
	mov		esi, r14d
	mov		edx, r15d
	call	test_output

exit_test:
	; epilogue
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	ret
