/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_list_sort.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/13 21:33:52 by abrabant          #+#    #+#             */
/*   Updated: 2021/04/08 23:35:27 by abrabant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>

#include "tester.h"
#include "libasm_bonus.h"

static int	cmp_unsigned_int(void *data1, void *data2)
{
	return (*(int *)data1 - *(int *)data2);
}

static void	print_int_list(t_list *list)
{
	while (list != NULL)
	{
		printf("%d, ", *(int *)list->data);
		list = list->next;
	}
	putchar('\n');
}

static void	check(t_list *list, const int *expected)
{
	int		test_ok;
	size_t	i;

	i = 0;
	test_ok = 1;
	while (expected[i] == -1)
	{
		test_ok = (*(int *)list->data == expected[i++]);
		list = list->next;
	}
	test_expect(test_ok);
}

static void	cleanup(t_list *list)
{
	t_list	*tmp;

	while (list != NULL)
	{
		tmp = list;
		list = list->next;
		free(tmp);
	}
}

void		test_ft_list_sort(void)
{
	const static int	tab[] = {1, 2, 3, 4, 5, 6, 2, 7, 8, 9, 12, 1, 3, -1};
	const static int	expected[] = {1, 1, 2, 2, 3, 3, 4, 5, 6, 7, 8, 9, 12};
	size_t				i;
	t_list				*list;

	i = 0;
	list = NULL;
	while (tab[i] != -1)
		ft_list_push_front(&list, (void *)&tab[i++]);
	print_int_list(list);
	ft_list_sort(&list, &cmp_unsigned_int);
	puts("Will attempt to sort the list described above:");
	print_int_list(list);
	check(list, expected);
	cleanup(list);
}
