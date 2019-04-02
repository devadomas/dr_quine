.PHONY: 		all clean fclean re

NAME_COLLEEN	= 		Colleen
NAME_GRACE		= 		Grace
NAME_SULLY		=		Sully

LD				=		ld
LDFLAGS			= 		-lSystem -macosx_version_min 12.10

SRC_DIR			= 		./

SRC_COLLEEN		=		Colleen.s
SRC_GRACE		=		Grace.s
SRC_SULLY		=		Sully.s

SRCS_COLLEEN	= 		$(addprefix $(SRC_DIR), $(SRC_COLLEEN))
SRCS_GRACE		= 		$(addprefix $(SRC_DIR), $(SRC_GRACE))
SRCS_SULLY		=		$(addprefix $(SRC_DIR), $(SRC_SULLY))

OBJ_DIR			=		./obj/
OBJ_COLLEEN		= 		$(SRC_COLLEEN:.s=.o)
OBJ_GRACE		= 		$(SRC_GRACE:.s=.o)
OBJ_SULLY		= 		$(SRC_SULLY:.s=.o)
OBJS_COLLEEN	= 		$(addprefix $(OBJ_DIR), $(OBJ_COLLEEN))
OBJS_GRACE		= 		$(addprefix $(OBJ_DIR), $(OBJ_GRACE))
OBJS_SULLY		= 		$(addprefix $(OBJ_DIR), $(OBJ_SULLY))

all: 			Colleen # Grace Sully

Colleen:		$(OBJ_DIR) $(OBJS_COLLEEN)
				@$(LD) $(LDFLAGS) -o $(NAME_COLLEEN) $(OBJS_COLLEEN)

# Grace:	 		$(OBJ_DIR) $(OBJS_GRACE)
# 				@$(LD) $(LDFLAGS) -o $(NAME_GRACE) $(OBJS_GRACE)

# Sully: 			$(OBJ_DIR) $(OBJS_SULLY)
# 				@$(LD) $(LDFLAGS) -o $(NAME_SULLY) $(OBJS_SULLY)

$(OBJ_DIR)%.o: 	$(SRC_DIR)%.s
				nasm -f macho64 $< -o $@

$(OBJ_DIR):
				@mkdir -p $(OBJ_DIR)

clean:
				@rm -rf $(OBJ_DIR)

fclean: 		clean
				@rm -f $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

re: 			fclean all

