# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ghavenga <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/07/04 07:37:46 by ghavenga          #+#    #+#              #
#    Updated: 2016/08/23 10:19:42 by arnovan-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= asm

CC= gcc -o
CFLAGS= -Wall -Werror -Wextra
LIBFT= -L libft/ -lft
HEADER= -I ./includes/ -I ./libft/includes/

SP= ./srcs/
SRC= $(SP)main.c $(SP)manage_args.c $(SP)free_env.c 	\
	 $(SP)init_env.c $(SP)main.c $(SP)read_programs.c

all: $(NAME)

$(NAME):
	@clear
	@echo "\x1b[31m-----Compiling Libft\x1b[0m"
	@make -C libft fclean
	@make -C libft
	@echo "\x1b[34m+++++Done Compiling Libft\x1b[0m"
	@echo "\x1b[31m-----Compiling $(NAME)\x1b[0m"
	@$(CC) $(NAME) $(CFLAGS) $(SRC) $(LIBFT) $(HEADER)
	@echo "\x1b[34m+++++Done Compiling $(NAME)\x1b[0m"
	@echo "\x1b[32m+++++Completed All Compiling\x1b[0m"

quick:
	@clear
	@echo "\x1b[31m-----Compiling $(NAME)\x1b[0m"
	@$(CC) $(NAME) $(CFLAGS) $(SRC) $(LIBFT) $(HEADER)
	@echo "\x1b[32m+++++Done Compiling $(NAME)\x1b[0m"

clean:
	@rm $(NAME)
	@echo "\x1b[32m\t+++++Completed Clean\x1b[0m"

fclean: clean
	@make -C libft fclean
	@echo "\x1b[32m\t+++++Completed Full Clean\x1b[0m"

re: fclean all

me:
	@echo ${LOGNAME} > author

norm:
	@clear
	@echo "Starting Norminette, good luck!"
	@norminette $(SRC)