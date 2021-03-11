section .data

strdup1_src	db	"Some text to copy",0
strdup2_src	db	"hi",0
strdup3_src	db	0
strdup4_src	db	"h",0
strdup5_src	db	"This is a kinda long string and this is awesome !",0
strdup_arr	dq	strdup1_src, strdup2_src, strdup3_src, strdup4_src, strdup5_src, 0

strdup_fmt	db	`string="%s"\nstrdup         => "%s"\nft_strdup      => "%s"\n`,0

section	.text

global test_ft_strdup

extern	printf
extern	free
extern	strdup

extern	ft_strdup

extern	test_strdup_cmp
extern	test_output

; r12 will be used as an iterator
; r13 will hold the address of strcmp's return value
; r14 will hold the address of ft_strcmp's return value

test_ft_strdup:
	; prologue
	push	r12
	push	r13
	push	r14
	sub		rsp, 8		; for alignment
	xor		r12, r12	; init r12 to zero

loopTest:
	cmp		qword [strdup_arr + r12 * 8], 0
	je		exit_test
	mov		rdi, [strdup_arr + r12 * 8]
	call	strdup
	mov		r13, rax
	mov		rdi, [strdup_arr + r12 * 8]
	call	ft_strdup
	mov		r14, rax

	; printf
	mov		rdi, strdup_fmt,
	mov		rsi, [strdup_arr + r12 * 8]
	mov		rdx, r13
	mov		rcx, r14
	call	printf

	; compare
	mov rdi, test_strdup_cmp
	mov rsi, r13
	mov rdx, r14
	call test_output

	mov		rdi, r13
	call	free
	mov		rdi, r14
	call	free

	inc		r12
	jmp		loopTest

exit_test:
	; epilogue
	add	rsp, 8	; for alignment
	pop	r14
	pop	r13
	pop	r12
	ret
