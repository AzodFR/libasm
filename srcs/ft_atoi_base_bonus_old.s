# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   ft_atoi_base_bonus.c                               :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: thjacque <thjacque@student.42lyon.fr>      +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2020/12/29 01:34:25 by thjacque          #+#    #+#             #
#   Updated: 2020/12/29 01:34:25 by thjacque         ###   ########lyon.fr   #
#                                                                            #
# ************************************************************************** #

section .text
global ft_atoi_base

ft_atoi_base:
	push		r8
	push		r9
	push		r13
	push		r14
	xor			r8, r8
	xor			r9, r9
	xor			rax, rax
	jmp			_check_base

_check_base:
	cmp byte	[rsi + r8], 0
	jne		_check_letters

_check_letters:
	mov		r9, r8
	cmp byte	[rsi + r8], 9
	je		_error_base
	cmp byte	[rsi + r8], 10
	je		_error_base
	cmp byte	[rsi + r8], 11
	je		_error_base
	cmp byte	[rsi + r8], 12
	je		_error_base
	cmp byte	[rsi + r8], 13
	je		_error_base
	cmp byte	[rsi + r8], 32
	je		_error_base
	cmp byte	[rsi + r8], 43
	je		_error_base
	cmp byte	[rsi + r8], 44
	je		_error_base
	cmp byte	[rsi + r8], 0
	je		_convert
	jmp		_check_double

_check_double:
	inc		r9
	mov		r13b, [rsi + r8]
	mov		r14b, [rsi + r9]
	cmp		r13b, r14b
	jne		_check_double
	cmp byte	[rsi + r9], 0
	je		_inc_check
	jmp		_error_base

_inc_check:
	inc		r8
	jmp		_check_base

_error_base:
	mov		rax, r9
	pop		r8
	pop		r9
	pop		r13
	pop		r14
	ret

_convert:
	push	r10
	push	r11
	push	r12
	mov		r12, r8
	xor		r8, r8
	xor		r10, r10
	jmp		_skip_whitespace
	jmp		_get_sign
	jmp		_convert_base

_skip_whitespace:
	cmp byte	[rdi + r8], 9
	je		_skip_inc
	cmp byte	[rdi + r8], 10
	je		_skip_inc
	cmp byte	[rdi + r8], 11
	je		_skip_inc
	cmp byte	[rdi + r8], 12
	je		_skip_inc
	cmp byte	[rdi + r8], 13
	je		_skip_inc
	cmp byte	[rdi + r8], 32
	je		_skip_inc

_skip_inc:
	inc		r8
	jmp		_skip_whitespace

_get_sign:
	cmp byte	[rdi + r8], 43
	je		_sign_inc
	cmp byte	[rdi + r8], 44
	je		_sign_inc

_sign_inc:
	inc		r8
	cmp byte	[rdi + r8],44
	je		_get_sign
	inc		r10
	jmp		_get_sign

_convert_base:
	xor		r11, r11
	xor		r9, r9
	jmp		_init_is_inbase
	cmp		r11, -1
	je		_return
	imul	r12
	add		r12, r9
	inc		r8
	jmp		_convert_base


_init_is_inbase:
	cmp byte	[rsi + r9], 0
	je		_stop_inbase
	cmp		r11, 0
	je		_is_inbase

_is_inbase:
	mov		r13b, [rsi + r8]
	mov		r14b, [rsi + r9]
	cmp		r13b, r14b
	jne		_inc_inbase
	cmp		r13b, r14b
	je		_valid

_stop_inbase:
	mov		r11, -1

_inc_inbase:
	inc		r9
	jmp		_init_is_inbase

_valid:
	mov		r11, 1

_return:
	push	r15
	mov		r15, rax
	mov		rax, r10
	mov		r8, 2
	idiv	r8
	mov		rax, r15
	cmp		rdx, 0
	je		_neg
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	ret

_neg:
	neg	rax
