# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   ft_strcpy.s                                        :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: thjacque <thjacque@student.42lyon.fr>      +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2020/12/28 10:26:06 by thjacque          #+#    #+#             #
#   Updated: 2020/12/28 10:26:14 by thjacque         ###   ########lyon.fr   #
#                                                                            #
# ************************************************************************** #



section .text
global ft_strcpy

ft_strcpy:
	push	rbp
	push	r8
	push	r9
	xor		r8, r8
	jmp		_loop

_loop:
	cmp byte	[rsi], 0
	jne			_cpy
	mov byte	[rdi + r8], 0
	mov qword	rax, rdi
	pop			r8
	pop			r9
	pop			rbp
	ret

_cpy:
	mov byte	r9b, [rsi]
	mov byte	[rdi + r8], r9b
	inc			rsi
	inc			r8
	jmp			_loop
