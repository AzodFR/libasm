section .text
global _ft_strdup
extern _malloc
extern _ft_strlen
extern _ft_strcpy

_ft_strdup:
	push	rdi
	call	_ft_strlen
	inc		rax
	mov		rdi, rax
	call	_malloc
	or		rax, rax
	je		_error
	pop		rsi
	mov		rdi, rax
	call	_ft_strcpy
	ret

_error:
	pop rdi
	ret
