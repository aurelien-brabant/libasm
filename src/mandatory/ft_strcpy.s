; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: abrabant <abrabant@student.42.fr>          +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/08 00:20:46 by abrabant          ;+;    ;+;              ;
;    Updated: 2021/03/08 00:20:46 by abrabant         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

global	ft_strcpy

; rdi => destination string, must be large enough
; rsi => source string, copied into destination
ft_strcpy:
	mov rax, rdi	; set the return value to the destination string

loopCopy:
	cmp byte [rsi], 0
	je ft_strcpy_ret
	mov bl, byte[rsi]
	mov byte [rdi], bl
	inc rdi
	inc rsi
	jmp loopCopy

ft_strcpy_ret:
	mov byte [rdi], 0	; set the final null byte in dest
	ret
