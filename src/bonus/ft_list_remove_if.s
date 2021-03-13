; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_list_remove_if.s                                :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2021/03/13 14:17:23 by abrabant          #+#    #+#              #
;    Updated: 2021/03/13 14:17:23 by abrabant         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section	.text

global	ft_list_remove_if

extern	free

; rdi: the address of the pointer to the beginning of the list
; rsi: the reference data
; rdx: function used to compare reference data with stored data
; rcx: function used to free the data element before freeing the node
ft_list_remove_if:
	; prologue
	push	r12					; first arg
	push	r13					; second arg
	push	r14 				; third arg
	push	r15					; fourth arg
	push	rbx					; current_node
	sub		rsp, 8				; keep track of the previous node through a local variable

	mov		qword [rsp], 0
	mov		r12, rdi
	mov		r13, rsi
	mov		r14, rdx
	mov		r15, rcx
	mov		rbx, qword [r12]	; get the address of the first node, pointed by r12

loop_list:
	cmp		rbx, 0					; check if node's address is not NULL
	je		epilogue
	mov		rdi, qword [rbx]		; pass the data of the current node to the cmp function
	mov		rsi, r13				; pass ref data
	call	r14						; compare
	cmp		rax, 0					; if comparision returned zero, remove element
	je		remove_element			; remove the element
	mov		qword [rsp], rbx		; set the previous node to the current one
	mov		rbx, qword [rbx + 8]	; set the current node to the next one
	jmp		loop_list

remove_element:
	call	free_data

	cmp		rbx, qword [r12]		; check if removed element is the head of the list
	je		remove_element_as_first	; if that's the case, special treatement is done

	mov		r10, qword [rsp]		; get the address of the previous node
	mov		r11, qword [rbx + 8]	; get the address of the next node
	mov		qword [r10 + 8], r11	; set the next pointer of the previous node
									; to point to the next one
	jmp		free_element
	
remove_element_as_first:
	mov		r10, qword [rbx + 8]
	mov		qword [r12], r10		; set the head of the list to the address of the next node

free_element:
	mov		r10, rbx				; store node to be freed in a temporary register
	mov		rbx, qword [rbx + 8]	; set current node to next node
	mov		rdi, r10
	call	free
	jmp		loop_list				; continue to loop

; free node's data

free_data:
	cmp	r15, 0
	jne call_free_data
	ret

call_free_data:
	mov		rdi, qword [rbx]
	call	r15						; free element's data
	ret

epilogue:
	add	rsp, 8
	pop	rbx
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	ret
