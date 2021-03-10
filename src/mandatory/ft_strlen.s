; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: abrabant <abrabant@student.42.fr>          +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/07 23:51:11 by abrabant          ;+;    ;+;              ;
;    Updated: 2021/03/07 23:51:11 by abrabant         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

; ft_strlen(const char *str)

global ft_strlen

ft_strlen:
	xor rcx, rcx	; rcx will be used as an iterator

loopUntilNull:
	inc	rcx
	cmp	byte [rdi + rcx - 1], 0
	jne	loopUntilNull
	dec	rcx
	ret
