global	test_ft_strlen

; libasm
extern	ft_strlen

; glibc
extern	printf
extern	strlen

; test
extern	test_strlen_cmp
extern test_output

section .data
	str1	db "Hello world, this is a string",0
	str2	db "This is another string", 0
	str3	db 0
	arr		dq str1, str2, str3, 0

	; for output
	fmt		db 'string: "%s"',10,"strlen    => %ld", 10, "ft_strlen => %ld", 10, 0

section .text

; TEST FT_STRLEN FUNCTION
;
; r12 used as an iterator.
; r13 used to hold strlen's return value.
; r14 used to hold ft_strlen's return value.
; r12-14 GPRs are used because they're callee saved which is convenient.

test_ft_strlen:
	xor 	r12, r12
	jmp 	loopTest

loopTest:
	cmp		qword [arr + r12 * 8], 0
	je		exit_test
	mov		rdi, [arr + r12 * 8]
	call	strlen
	mov		r13, rax
	call	ft_strlen
	mov		r14, rax
	call 	output
	inc		r12
	jmp		loopTest

exit_test:
	ret

; ROUTINE
; Output results in a comprehensive format to help the user figure out
; what has been tested and what are the results.

output:
	; prologue
	push	rdi

	; prepare printf call
	mov		rdi, fmt
	mov		rsi, [arr + r12 * 8]
	mov		rdx, r13
	mov		rcx, r14
	call	printf

	; call the test decision
	lea		rdi, test_strlen_cmp
	mov		rsi, r13
	mov		rdx, r14
	call	test_output
	
	; epilogue
	pop		rdi
	ret
