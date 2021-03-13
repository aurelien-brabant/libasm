/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/12 00:08:33 by abrabant          #+#    #+#             */
/*   Updated: 2021/03/13 12:32:48 by abrabant         ###   ########.fr       */
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
}
