/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thjacque <thjacque@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/12/28 00:14:48 by thjacque          #+#    #+#             */
/*   Updated: 2020/12/28 02:03:51 by thjacque         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>

int		main(void)
{
	printf("=============\n| FT_STRLEN |\n=============\n");
	printf("ft_strlen of 'salut a tous' [%ld]\n",ft_strlen("salut a tous"));
	printf("strlen of 'salut a tous' [%ld]\n",strlen("salut a tous"));

	printf("\n=============\n| FT_STRCPY |\n=============\n");
	char test[3];
	char test2[3];
	ft_strcpy(test, "yo");
	printf("ft_strcpy: %s\n",test);
	strcpy(test2, "yo");
	printf("strcpy: %s\n",test2);
	printf("\n=============\n| FT_STRCMP |\n=============\n");
	printf("ft_strcmp of 'salut' & 'salaud' [%d]\n",ft_strcmp("salut", "salaud"));
	printf("strcmp of 'salut' & 'salaud' [%d]\n",strcmp("salut", "salaud"));
	return (0);
}
