/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_list_remove_if_2.c                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/13 17:50:58 by abrabant          #+#    #+#             */
/*   Updated: 2021/03/13 18:18:03 by abrabant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "tester.h"
#include "libasm_bonus.h"

static void	print_str_list(t_list *curr)
{
	while (curr != NULL)
	{
		printf("\"%s\",", (char *) curr->data);
		curr = curr->next;
	}
	putchar('\n');
}

void	test_ft_list_remove_if_2(void)
{
	t_list				*list;
	t_list				*curr;
	size_t				i;
	char				*ref;

	list = NULL;
	ref = "string";
	i = 0;
	while (i < 3)
	{
		ft_list_push_front(&list, strdup(ref));
		++i;
	}
	curr = list;
	puts("3 identical strings stored in a list:");
	print_str_list(curr);
	puts("Will attempt to remove \"string\" using ft_list_remove_if"
			" (comparing is done with strcmp, free with free)");
	ft_list_remove_if(&list, ref, &strcmp, &free);
	curr = list;
	test_expect(curr == NULL);
}
