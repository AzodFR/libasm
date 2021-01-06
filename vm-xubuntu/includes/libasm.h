/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thjacque <thjacque@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/12/28 00:10:18 by thjacque          #+#    #+#             */
/*   Updated: 2020/12/28 12:35:33 by thjacque         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H
# include <stdlib.h>
# include <unistd.h>

size_t		ft_strlen(const char *s);
int			ft_strcmp(const char *s1, const char *s2);
char		*ft_strcpy(char *dest, const char *src);
char		*ft_strdup(const char *src);
ssize_t		ft_read(int fd, void *buf, size_t count);
ssize_t		ft_write(int fd, const void *buf, size_t count);
#endif
