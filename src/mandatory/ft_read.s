global ft_read

extern	__errno_location

ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jl set_error
	ret

; set the return value of ft_write to -1 as it must be explicitely set to it
; to indicate an error. errno is automatically set by linux syscalls so
; setting it manually is dangerous and pointless.


set_error:
	mov		rcx, rax
	neg		rcx
	call	__errno_location
	mov		[rax], rcx
	mov rax, -1
	ret
