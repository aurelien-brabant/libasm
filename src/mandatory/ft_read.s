global ft_read

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
	mov rax, -1
	ret
