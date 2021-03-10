; COMPARISON FUNCTIONS USED TO DECIDE IF THE TEST HAS PASSED OR NOT
; rax is set to zero if success, any other value means failure.

global	test_strlen_cmp

section .text

; rdi => strlen's len
; rsi => ft_strlen's len
test_strlen_cmp:
	mov rax, rdi
	sub rax, rsi	; rax will be set to zero if lens are equal
	ret
