/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_list_push_front.c                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/13 11:50:13 by abrabant          #+#    #+#             */
/*   Updated: 2021/03/13 18:26:27 by abrabant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "tester.h"
#include "libasm_bonus.h"

static void	check(t_list *list, const char **strs, size_t strarr_len)
{
	size_t	i;
	int		test_ok;

	test_ok = 1;
	puts("After push, content of the list:");
	i = 0;
	while (list != NULL)
	{
		printf("NODE %ld\nValue = \"%s\"\nExpected: \"%s\"\n---\n",
				i, (char *)list->data, strs[strarr_len - i - 1]);
		test_ok = (strcmp(list->data, strs[strarr_len - i - 1]) == 0);
		list = list->next;
		++i;
	}
	test_expect(test_ok);
}

void	test_ft_list_push_front(void)
{
	static const char	*strs[] = {"str1", "str2", "str3", "str4", NULL};
	size_t				i;
	size_t				strarr_len;
	t_list				*list;
	t_list				*tmp;

	i = 0;
	list = NULL;
	while (strs[i] != NULL)
	{
		printf("Push front => \"%s\"\n", strs[i]);
		ft_list_push_front(&list, (void *) strs[i++]);
	}
	strarr_len = i;
	check(list, strs, strarr_len);
	while (list != NULL)
	{
		tmp = list;
		list = list->next;
		free(tmp);
	}
}
