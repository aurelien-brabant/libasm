# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abrabant <abrabant@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/01 19:18:47 by abrabant          #+#    #+#              #
#    Updated: 2021/03/10 17:15:13 by abrabant         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC				= nasm
LD				= gcc -g
RM				= rm -rf
OUTPUT_FORMAT	= -f elf64 -g
TARGET			= libasm.a
TEST_TARGET		= test.out
VPATH			= ./src:./src/mandatory:./src/util:./src/test
SRCS			= ft_write.s ft_read.s ft_strlen.s ft_strcpy.s ft_strcmp.s	\
				ft_strdup.s
TEST_SRCS		= test_ft_strlen.s test_output.s main.s test_cmp.s

OBJ_DIR			= .obj
OBJS			= $(SRCS:%.s=$(OBJ_DIR)/%.o)
TEST_OBJS		= $(TEST_SRCS:%.s=$(OBJ_DIR)/%.o)

all: $(TARGET)

$(TEST_TARGET): $(TEST_OBJS)
	$(LD) -no-pie -o $(TEST_TARGET) $(TEST_OBJS) -L. -lasm

$(TARGET): $(OBJ_DIR) $(OBJS)
	ar rcs $(TARGET) $(OBJS)

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(TARGET)

re: fclean all

.PHONY: clean fclean all

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o:%.s
	$(CC) $(OUTPUT_FORMAT) $< -o $@
