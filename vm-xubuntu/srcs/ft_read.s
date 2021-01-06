# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   ft_read.s                                          :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: thjacque <thjacque@student.42lyon.fr>      +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2020/12/28 10:26:51 by thjacque          #+#    #+#             #
#   Updated: 2020/12/28 10:26:53 by thjacque         ###   ########lyon.fr   #
#                                                                            #
# ************************************************************************** #

section .text
global ft_read
extern __errno_location

ft_read:
	mov			eax, 0
	syscall
	or			rax, rax
	jl			_error
	ret

_error:
	push	r10
	neg		rax
	mov		r10, rax
	call	__errno_location
	mov		[rax], r10
	mov		rax, -1
	pop		r10
	ret
