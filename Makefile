# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/01 19:18:47 by abrabant          #+#    #+#              #
#    Updated: 2021/03/13 23:40:24 by abrabant         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#----------[ CC / LD ]----------#

ASMCOMP			= nasm
CC				= clang -Iinclude
CFLAGS			= -Wall -Wextra -Werror
COMP_FLAGS		= -f elf64 -g -Iinclude
LD				= clang 
LD_FLAGS		= -g -L. -lasm
LD_BONUS_FLAGS	= -g -L. -lasm_bonus
RM				= rm -rf
TARGET			= libasm.a
TARGET_BONUS	= libasm_bonus.a

#----------[ SRCS / OBJS ]----------#

# Mandatory part

SRCS			= $(addprefix ./src/mandatory/, ft_write.s ft_read.s ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s)
TEST_SRCS		= $(addprefix ./test/mandatory/, test_ft_strlen.s test_ft_strcmp.s test_ft_strcpy.s test_ft_strdup.s test_ft_io.s test_output.s test_cmp.s main.s)

BONUS_SRCS		= $(addprefix ./src/bonus/, ft_str_is_uniq.s ft_strchri.s ft_str_contains_set.s ft_atoi_base.s ft_list_push_front.s ft_list_size.s ft_list_remove_if.s ft_list_sort.s)
BONUS_TEST_SRCS	= $(addprefix ./test/bonus/, main.c test_ft_atoi_base.c test_ft_list_push_front.c assert_test.c test_ft_list_size.c test_ft_list_remove_if.c test_ft_list_remove_if_2.c test_ft_list_sort.c)

OBJS			= $(SRCS:%.s=%.o)
TEST_OBJS		= $(TEST_SRCS:%.s=%.o)
BONUS_OBJS		= $(BONUS_SRCS:%.s=%.o)
BONUS_TEST_OBJS	= $(BONUS_TEST_SRCS:%.c=%.o)


#----------[ RULES ]----------#

all: $(TARGET)

$(TARGET): $(OBJS) $(TEST_OBJS)
	ar rcs $(TARGET) $(OBJS)
	$(LD) -o test.out $(TEST_OBJS) $(LD_FLAGS)

bonus: $(TARGET_BONUS)

$(TARGET_BONUS): $(OBJS) $(BONUS_OBJS) $(BONUS_TEST_OBJS)
	ar rcs $(TARGET_BONUS) $(OBJS) $(BONUS_OBJS)
	$(LD) -o bonus_test.out $(BONUS_TEST_OBJS) $(LD_BONUS_FLAGS) 

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(TARGET) $(TEST_TARGET)

re: fclean all

cleanbonus:
	$(RM) $(BONUS_OBJS)
	$(RM) $(BONUS_TEST_OBJS) 

fcleanbonus: cleanbonus
	$(RM) bonus_test.out

rebonus: fcleanbonus bonus

.PHONY: clean fclean all

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

%.o:%.s
	$(ASMCOMP) $(COMP_FLAGS) $< -o $@

%.o:%.c
	$(CC) $(CFLAGS) $< -c -o $@
