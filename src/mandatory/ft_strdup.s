; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: abrabant <abrabant@student.42.fr>          +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/08 11:51:19 by abrabant          ;+;    ;+;              ;
;    Updated: 2021/03/08 11:51:19 by abrabant         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

global	ft_strdup

extern	malloc

extern	ft_strlen
extern	ft_strcpy

; ft_strdup(const char *s)

ft_strdup:
	push r12
	mov r12, rdi ; keep *s* in r12
	call ft_strlen
	mov rdi, rax ; set length of string as malloc first arg
	inc rdi ; increment first arg to include null termination
	call malloc ; call to malloc
	mov rdi, rax ; dst to copy into is the malloced string
	mov rsi, r12 ; the src for the copy is the string given to strdup
	call ft_strcpy
	pop r12
	ret
