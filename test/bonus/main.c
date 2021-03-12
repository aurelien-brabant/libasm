/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/12 00:08:33 by abrabant          #+#    #+#             */
/*   Updated: 2021/03/12 21:14:38 by abrabant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdio.h>
#include <limits.h>

#include "libasm_bonus.h"
#include "tester.h"

static void	ft_atoi_base_test(void)
{
	static char			*test_args[][2] = {{"-1111", "01"},
	{"343", "0123456789"}, {"    123", "0123456789"},
	{"    --++++++++11110", "01"}, {" ---+--F", "0123456789ABCDEF"},
	{"0", "poneyvif"}, {"p", "poneyvivace"},
	{"   +7fffffff", "0123456789abcdef" }, {" +---+2147483648", "0123456789"},
	{"a01234", "01234"}, {"  12", "1223"}, {" 1", "1"}, {"11", "01+"},
	{"11", "0-1"}, {NULL, NULL}};
	static const int	test_expect[] = {-15, 343, 123, 30, -15, 0, 0,
		INT_MAX, INT_MIN, 0, 0, 0, 0, 0};
	size_t				i;
	int					ft_ret;

	ft_ret = -1; 
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
	puts("\n====== TESTING \033[1;33mft_atoi_base \033[0m=====\n");
	ft_atoi_base_test();
}
