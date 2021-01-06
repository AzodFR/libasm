# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   ft_strdup.s                                        :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: thjacque <thjacque@student.42lyon.fr>      +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2020/12/28 12:13:35 by thjacque          #+#    #+#             #
#   Updated: 2020/12/28 12:13:35 by thjacque         ###   ########lyon.fr   #
#                                                                            #
# ************************************************************************** #
# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   ft_strdup.s                                        :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: thjacque <thjacque@student.42lyon.fr>      +#+  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2020/12/28 12:13:35 by thjacque          #+#    #+#             #
#   Updated: 2020/12/28 12:13:35 by thjacque         ###   ########lyon.fr   #
#                                                                            #
# ************************************************************************** #

section .text
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy

ft_strdup:
	push	rdi
	call	ft_strlen
	mov		rdi, rax
	call	malloc
	or		rax, rax
	je		_error
	pop		rsi
	mov		rdi, rax
	call	ft_strcpy
	ret

_error:
	pop rdi
	ret
