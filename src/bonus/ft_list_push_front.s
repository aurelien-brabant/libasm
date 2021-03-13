; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_list_push_front.s                               :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/13 01:44:09 by abrabant          #+#    #+#              #
;    Updated: 2021/03/13 01:44:09 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section	.data
	LIST_NODE_SIZE equ 16 ; two pointers = two quadwords = 8 * 2

section	.text

global	ft_list_push_front

extern	malloc

; rdi: address of the beginning of the list
; rsi: address of data
ft_list_push_front:
	push	r12					; to store arg 1
	push	r13					; to store arg 2
	push	r14					; to store the pointer to the new struct
	sub		rsp, 8				; for alignment
	mov		r12, rdi
	mov		r13, rsi
	mov		rdi, LIST_NODE_SIZE
	call	malloc
	; if malloc failed, stop there
	cmp		rax, 0
	je		epilogue
	mov		r14, rax			; store the address of the new struct
	mov		qword [r14], r13	; set the data pointer 
	
	; check if there's already one member in the list
	cmp		qword [r12], 0
	je		push_as_first_node
	mov		rcx, qword [r12]		; moving the address of the next struct in rcx
	mov		qword [r14 + 8], rcx	; set the next pointer to the old first element
	mov		[r12], r14
	jmp		epilogue

push_as_first_node:
	mov		qword [r14 + 8], 0	; set the next pointer to NULL
	mov		qword [r12], r14	; set the address of the head of the list to the one of the new struct

epilogue:
	add	rsp, 8
	pop r14
	pop	r13
	pop	r12
	ret
