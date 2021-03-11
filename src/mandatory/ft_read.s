global ft_read

extern	__errno_location

ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jl set_error
	ret

set_error:
	mov		rcx, rax
	neg		rcx
	call	__errno_location
	mov		[rax], rcx
	mov rax, -1
	ret
