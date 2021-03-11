# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/01 19:18:47 by abrabant          #+#    #+#              #
#    Updated: 2021/03/11 22:36:54 by abrabant         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#----------[ CC / LD ]----------#

COMPILER		= nasm
COMP_FLAGS		= -f elf64 -g -Iinclude
LD				= gcc
LD_FLAGS		= -no-pie -g -L. -lasm
RM				= rm -rf
TARGET			= libasm.a
TEST_TARGET		= test.out

#----------[ SRCS / OBJS ]----------#

VPATH			= ./src:./src/mandatory:./src/util:./src/test

SRCS			= ft_write.s ft_read.s ft_strlen.s ft_strcpy.s ft_strcmp.s	\
				ft_strdup.s

TEST_SRCS		= test_ft_strlen.s test_ft_strcmp.s test_ft_strcpy.s		\
				test_ft_strdup.s test_ft_io.s								\
				test_output.s main.s test_cmp.s

OBJ_DIR			= .obj
OBJS			= $(SRCS:%.s=$(OBJ_DIR)/%.o)
TEST_OBJS		= $(TEST_SRCS:%.s=$(OBJ_DIR)/%.o)

#----------[ RULES ]----------#

all: $(TARGET)

$(TARGET): $(OBJ_DIR) $(OBJS) $(TEST_OBJS)
	ar rcs $(TARGET) $(OBJS)
	$(LD) -o $(TEST_TARGET) $(TEST_OBJS) $(LD_FLAGS)

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(TARGET) $(TEST_TARGET)

re: fclean all

.PHONY: clean fclean all

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o:%.s
	$(COMPILER) $(COMP_FLAGS) $< -o $@
