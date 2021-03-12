section .data

strcpy1_src	db	"Some text to copy",0
strcpy2_src	db	"hi",0
strcpy3_src	db	0
strcpy4_src	db	"h",0
strcpy_arr	dq	strcpy1_src, strcpy2_src, strcpy3_src, strcpy4_src, 0

strcpy_fmt	db	`src="%s"\nstrcpy => "%s"\nft_strcpy => "%s"\n`,0

section	.bss
	strcpy_dst_ref	resb	1000	; destination buffer for strcmp
	strcpy_dst_ft	resb	1000	; destination buffer for ft_strcmp

section	.text

global test_ft_strcpy

; glibc
extern	strcpy
extern	printf

; libasm
extern	ft_strcpy

; test
extern	test_strcpy_cmp
extern	test_output

; r12 will be used as an iterator
; r13 will hold the address of strcmp's return value
; r14 will hold the address of ft_strcmp's return value

test_ft_strcpy:
	; prologue
	push r12
	push r13
	push r14
	sub rsp, 8
	xor r12, r12	; init r12 to zero

loopTest:
	cmp qword [strcpy_arr + r12 * 8], 0
	je exit_test
	mov rdi, strcpy_dst_ref
	mov rsi, [strcpy_arr + r12 * 8]
	call strcpy
	mov r13, rax
	mov rdi, strcpy_dst_ft
	mov rsi, [strcpy_arr + r12 * 8]
	call ft_strcpy
	mov r14, rax

	; printf
	mov rdi, strcpy_fmt,
	mov rsi, [strcpy_arr + r12 * 8]
	mov rdx, r13
	mov rcx, r14
	call printf

	; compare
	mov rdi, test_strcpy_cmp
	mov rsi, r13
	mov rdx, r14
	call test_output

	inc r12
	jmp loopTest

exit_test:
	; epilogue
	add rsp, 8
	pop r14
	pop r13
	pop r12
	ret
