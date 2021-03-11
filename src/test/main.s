; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    main.s                                             :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: abrabant <abrabant@student.42.fr>          +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/01 21:08:40 by abrabant          ;+;    ;+;              ;
;    Updated: 2021/03/01 21:08:40 by abrabant         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .data
	testname_strlen	db	"ft_strlen", 0
	testname_strcmp	db	"ft_strcmp", 0
	testname_strdup	db	"ft_strdup", 0
	testname_strcpy db	"ft_strcpy", 0
	testname_io     db	"input / output (ft_read, ft_write)", 0
	testname		dq	testname_strlen, testname_strcmp, testname_strdup, testname_strcpy, testname_io, 0
	testfunc		dq	test_ft_strlen, test_ft_strcmp, test_ft_strdup, test_ft_strcpy, test_ft_io, 0

	testfmt			db	`\n===== TESTING \033[1;33m%s\033[0m =====\n\n`, 0

section .text
global main

; glibc
extern printf

; test
extern test_ft_io
extern test_ft_strlen
extern test_ft_strcmp
extern test_ft_strcpy
extern test_ft_strdup

main:
	push	r12
	xor		r12, r12	; set iterator to 0

loopTest:
	cmp		qword [testfunc + r12 * 8], 0
	je		exit_test_prog
	; align before calling printf
	mov		rdi, testfmt
	mov		rsi, [testname + r12 * 8]
	call	printf
	; align and call the test function 
	sub		rsp, 8
	call	[testfunc + r12 * 8]
	add		rsp, 8
	; process the next test
	inc 	r12
	jmp		loopTest

exit_test_prog:
	pop	r12
	xor	rax, rax	; exit 0
	ret
