/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_list_size.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/13 12:17:10 by abrabant          #+#    #+#             */
/*   Updated: 2021/03/13 18:25:15 by abrabant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>

#include "tester.h"
#include "libasm_bonus.h"

void	test_ft_list_size(void)
{
	static const char	*strs[] = {"str1", "str2", "str3", "str4", NULL};
	t_list				*list;
	t_list				*tmp;
	size_t				i;
	int					strarr_len;

	i = 0;
	list = NULL;
	while (strs[i] != NULL)
	{
		printf("Push front => \"%s\"\n", strs[i]);
		ft_list_push_front(&list, (void *) strs[i++]);
	}
	strarr_len = i;
	printf("Testing length of the list:\nft_list_size(list)"
			" => %d\nExpected: %d\n", ft_list_size(list), strarr_len);
	test_expect(ft_list_size(list) == strarr_len);
	while (list != NULL)
	{
		tmp = list;
		list = list->next;
		free(tmp);
	}
}
