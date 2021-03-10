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

;%include libasm.s
extern test_ft_strlen

; glibc imports
extern printf

section .text
global main

main:
	call test_ft_strlen
	ret
