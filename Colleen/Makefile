.PHONY: 		all clean fclean re

NAME	=	Colleen

CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror

SRC_DIR	=	./
SRC		=	Colleen.c

SRCS		=	$(addprefix $(SRC_DIR), $(SRC_ALL))

OBJ_DIR 	=	./obj/
OBJ		 	=	$(SRC:.c=.o)
OBJS		=	$(addprefix $(OBJ_DIR), $(OBJ))

all:		$(NAME)

$(NAME):		$(OBJ_DIR) $(OBJS)
				@$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

$(OBJ_DIR)%.o: 	$(SRC_DIR)%.c
				$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
				@mkdir -p $(OBJ_DIR)

clean:
				@rm -f $(OBJS)
				@rm -rf $(OBJ_DIR)

fclean: 		clean
				@rm -f $(NAME)

re: 			fclean all
