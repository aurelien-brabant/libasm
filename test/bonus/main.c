/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/12 00:08:33 by abrabant          #+#    #+#             */
/*   Updated: 2021/03/12 15:49:20 by abrabant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>

#include "libasm_bonus.h"
#include "tester.h"

static void	ft_atoi_base_test(void)
{
	static char			*test_args[][2] = {{"1111", "1"},{"343", "01234456789"},
	{"    ++++++++11110", "01"},{" ---+--F", "0123456789ABCDEF"},{NULL, NULL}};
	static const int	test_expect[] = {0, 0, 15, 30};
	size_t				i;
	int					ft_ret;

	i = 0;
	while (test_args[i][0] != NULL)
	{
		ft_ret = ft_atoi_base(test_args[i][0], test_args[i][1]);
		printf("ft_atoi_base(\"%s\", \"%s\") => %d\nExpected: %d\n",
				test_args[i][0], test_args[i][1], ft_ret, test_expect[i]);
		if (ft_ret != test_expect[i])
			puts("<\033[0;31mKO\033[0m>");
		else
			puts("<\033[0;32mOK\033[0m>");
		++i;
	}
}

int	main(void)
{
	ft_atoi_base_test();
}
