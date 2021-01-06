section .text
global ft_atoi_base

ft_atoi_base:
	push	rbx
	push	r12
	xor		rax, rax
	xor		rbx, rbx
	xor		r12, r12
	jmp		_check_base

_check_base_inc:
	inc		r12

_check_base:
	cmp byte	[rsi + r12], 0
	jz		_check_base_end
	mov		r8, r12

_check_dup_inc:
	inc		r8

_check_dup_loop:
	cmp byte	[rsi + r8], 0
	jz		_check_correct_base
	mov		r9b, [rsi + r8]
	cmp byte	[rsi + r12], r9b
	je		_rax_setter
	jmp		_check_dup_inc

_check_correct_base:
	cmp byte	[rsi + r12], 32
	je		_rax_setter
	cmp byte	[rsi + r12], 43
	je		_rax_setter
	cmp byte	[rsi + r12], 45
	je		_rax_setter
	cmp byte	[rsi + r12], 9
	je		_rax_setter
	cmp byte	[rsi + r12], 10
	je		_rax_setter
	cmp byte	[rsi + r12], 13
	je		_rax_setter
	cmp byte	[rsi + r12], 11
	je		_rax_setter
	cmp byte	[rsi + r12], 12
	je		_rax_setter
	jmp		_check_base_inc

_check_base_end:
	cmp		r12, 1
	jle		_rax_setter
	xor		r8, r8
	jmp		_skip_wspaces

_skip_wspaces_inc:
	inc		r8

_skip_wspaces:
	cmp byte	[rdi + r8], 32
	je		_skip_wspaces_inc
	cmp byte	[rdi + r8], 9
	je		_skip_wspaces_inc
	cmp byte	[rdi + r8], 10
	je		_skip_wspaces_inc
	cmp byte	[rdi + r8], 13
	je		_skip_wspaces_inc
	cmp byte	[rdi + r8], 11
	je		_skip_wspaces_inc
	cmp byte	[rdi + r8], 12
	je		_skip_wspaces_inc
	jmp		_check_sign

_is_neg:
	xor		bl, 0x00000001

_is_pos:
	inc		r8

_check_sign:
	cmp byte	[rdi + r8], 45
	je		_is_neg
	cmp byte	[rdi + r8], 43
	je		_is_pos
	jmp		_atoi

_atoi_inc:
	inc		r8

_atoi:
	cmp byte	[rdi + r8], 0
	je		_rax_setter
	xor		r9, r9
	jmp		_atoi_idx

_atoi_idx_inc:
	inc		r9

_atoi_idx:
	mov		r10b, byte [rsi + r9]
	cmp		r10b, 0
	je		_rax_setter
	cmp byte	[rdi + r8], r10b
	jne		_atoi_idx_inc

_add_to_total:
	mul		r12
	add		rax, r9
	jmp		_atoi_inc

_rax_setter:
	mov		rax, rax
	cmp		rbx, 0
	jz		_return
	neg		rax

_return:
	pop		r12
	pop		rbx
	ret
