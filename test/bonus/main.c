/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/12 00:08:33 by abrabant          #+#    #+#             */
/*   Updated: 2021/03/13 20:23:38 by abrabant         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

#include "tester.h"

int	main(void)
{
	puts("\n====== TESTING \033[1;33mft_atoi_base \033[0m=====\n");
	test_ft_atoi_base();
	puts("\n====== TESTING \033[1;33mft_list_push_front \033[0m=====\n");
	test_ft_list_push_front();
	puts("\n====== TESTING \033[1;33mft_list_size \033[0m=====\n");
	test_ft_list_size();
	puts("\n====== TESTING \033[1;33mft_list_remove_if \033[0m=====\n");
	test_ft_list_remove_if();
	test_ft_list_remove_if_2();
	puts("\n====== TESTING \033[1;33mft_list_sort \033[0m=====\n");
	test_ft_list_sort();
}
