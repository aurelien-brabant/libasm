; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    test_output.s                                      :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/10 19:00:17 by abrabant          #+#    #+#              #
;    Updated: 2021/03/10 19:00:17 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section .data
	msg_pass	db `\033[0;34m<\033[0m\033[0;32mOK\033[0;34m>\033[0;m`, 0
	msg_fail	db `\033[0;34m<\033[0m\033[0;31mKO\033[0;34m>\033[0;m`, 0

global	test_output
extern	puts

; rdi: the function responsible for the comparison
; rsi: argument passed in rdi to the comparison function
; rdx: argument passed in rsi to the comparison function
; rcx: argument passed in rdx to the comparison function

test_output:
	push	r12			; r12 needs to be preserved
	mov		r12, rdi
	mov		rdi, rsi
	mov		rsi, rdx
	mov		rdx, rcx
	call	r12			; call the comparison function with the correct arguments
	cmp		al, 0		; zero = pass, else = fail
	jne		fail

pass:
	mov	rdi, msg_pass
	jmp	output

fail:
	mov	rdi, msg_fail

output:
	call	puts
	pop		r12
	ret
