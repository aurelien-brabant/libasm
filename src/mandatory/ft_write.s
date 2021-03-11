; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    write.s                                            :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: abrabant <abrabant@student.42.fr>          +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/01 19:21:10 by abrabant          ;+;    ;+;              ;
;    Updated: 2021/03/01 19:21:10 by abrabant         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

global ft_write
extern __errno_location

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl set_error
	ret

set_error:
	mov		ecx, eax
	neg		ecx					; make the value positive
	call	__errno_location	; put errno's address in rax
	mov		dword [rax], ecx	; set errno to the correct value
	mov		rax, -1				; make ft_write ret value -1
	ret
