/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_list_remove_if.c                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/13 15:45:01 by abrabant          #+#    #+#             */
/*   Updated: 2021/03/13 18:24:45 by abrabant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

#include "tester.h"
#include "libasm_bonus.h"

static int	gt(void *data, void *ref)
{
	return (*(int *)data <= *(int *)ref);
}

static void	print_int_list(t_list *curr)
{
	while (curr != NULL)
	{
		printf("%d,", *(int *)curr->data);
		curr = curr->next;
	}
	putchar('\n');
}

static void	cleanup(t_list *head)
{
	t_list	*tmp;

	while (head != NULL)
	{
		tmp = head;
		head = head->next;
		free(tmp);
	}
}

static void	check(t_list *head, const int *expect)
{
	size_t	i;
	int		test_ok;

	i = 0;
	test_ok = 1;
	while (expect[i] != -1)
	{
		test_ok = *(int *)head->data == expect[i++];
		head = head->next;
	}
	test_expect(test_ok);
}

void	test_ft_list_remove_if(void)
{
	static const int	tab[] = {1, 2, 100, 4, 5, 6, 7, 8, 9, -1};
	static const int	expect[] = {5, 4, 2, 1, -1};
	t_list				*list;
	t_list				*curr;
	size_t				i;
	int					ref;

	list = NULL;
	ref = 5;
	i = 0;
	while (tab[i] != -1)
		ft_list_push_front(&list, (void *)&tab[i++]);
	curr = list;
	puts("Numbers stored in a list, in that order:");
	print_int_list(curr);
	puts("Will attempt to remove number > 5 using ft_list_remove_if");
	ft_list_remove_if(&list, &ref, &gt, NULL);
	curr = list;
	print_int_list(curr);
	check(curr, expect);
	cleanup(curr);
}
