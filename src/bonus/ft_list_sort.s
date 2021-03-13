; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_list_sort.s                                     :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/13 18:37:21 by abrabant          #+#    #+#              #
;    Updated: 2021/03/13 18:37:21 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section	.text

global	ft_list_sort

ft_list_sort:
	push	r12	; r12 stores arg 1
	push	r13 ; r13 stores arg 2
	push	r14	; r14 stores the head of the list
	push	rbx	; current node

	mov		r12, rdi
	mov		r13, rsi
	mov		rbx, [r12]
	mov		r14, rbx

	; if first argument is NULL, stop
	cmp		rbx, 0
	je		epilogue

loop_list:
	cmp	qword [rbx + 8], 0			; if there's no more node available
	je	epilogue					; .... exit, as the list has been sorted entirely
	
	mov		rdi, qword [rbx]		; pass the data of the current node
	mov		r10, qword [rbx + 8]
	mov		rsi, qword [r10]		; pass the data of the next node
	call	r13						; call the comp function
	cmp		eax, 0
	jg		swap
	mov		rbx, [rbx + 8]			; if there's no need to swap, go to the next node
	jmp		loop_list				; ... and continue to loop

swap:
	mov	r10, qword [rbx + 8]		; save the next node's address
	mov	r11, qword [rbx]			; save rbx data's address
	mov	r9, [r10]					; save the address of the next node's data
	mov	qword [r10], r11			; replace the address of the data of the the next node by the one of the current node (saved before)
	mov	qword [rbx], r9				; replace the address of the current node by the one of the next node (saved before)
	mov	rbx, r14					; reset rbx to the head of the list
	jmp	loop_list					; ... and continue to loop

epilogue:
	pop	rbx
	pop	r14
	pop	r13
	pop	r12
	ret
