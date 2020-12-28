# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thjacque <thjacque@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/28 00:11:18 by thjacque          #+#    #+#              #
#    Updated: 2020/12/28 00:18:36 by thjacque         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

section .text
global ft_strlen

ft_strlen:
	push	rbp
	xor		rax, rax
	jmp		_loop

_loop:
	cmp byte	[rdi], 0
	jne			_inc_loop
	pop			rbp
	ret

_inc_loop:
	inc		rax
	inc		rdi
	jmp		_loop
