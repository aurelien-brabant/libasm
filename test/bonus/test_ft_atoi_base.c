#include <stdio.h>
#include <limits.h>

#include "libasm_bonus.h"
#include "tester.h"

void	test_ft_atoi_base(void)
{
	static char			*test_args[][2] = {{"-1111", "01"},
	{"343", "0123456789"}, {"    123", "0123456789"},
	{"    --++++++++11110", "01"}, {" ---+--F", "0123456789ABCDEF"},
	{"0", "poneyvif"}, {"p", "poneyvivace"},
	{"   +7fffffff", "0123456789abcdef" }, {" +---+2147483648", "0123456789"},
	{"a01234", "01234"}, {"  12", "1223"}, {" 1", "1"}, {"11", "01+"},
	{"11", "0-1"}, {NULL, NULL}};
	static int			expect_ret[] = {-15, 343, 123, 30, -15, 0, 0,
		INT_MAX, INT_MIN, 0, 0, 0, 0, 0};
	size_t				i;
	int					ft_ret;

	i = 0;
	while (test_args[i][0] != NULL)
	{
		ft_ret = ft_atoi_base(test_args[i][0], test_args[i][1]);
		printf("ft_atoi_base(\"%s\", \"%s\") => %d\nExpected: %d\n",
				test_args[i][0], test_args[i][1], ft_ret, expect_ret[i]);
		test_expect(expect_ret[i] == ft_ret);
		++i;
	}
}
