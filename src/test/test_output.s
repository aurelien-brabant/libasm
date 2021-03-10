global test_output
extern puts

section .data
	msg_pass	db "<TEST: OK>", 0
	msg_fail	db "<TEST: KO>", 0

section .text

; rdi: the function responsible for the comparison
; rsi: argument passed in rdi to the comparison function
; rdx: argument passed in rsi to the comparison function
; rcx: argument passed in rdx to the comparison function

test_output:
	push r12
	mov r12, rdi
	mov rdi, rsi
	mov rsi, rdx
	mov rdx, rcx
	call r12 ; call the comparison function with the correct arguments
	cmp al, 0 ; zero = pass, else = fail
	jne fail

pass:
	mov rdi, msg_pass
	jmp output

fail:
	mov rdi, msg_fail

output:
	call puts
	pop r12
	ret
