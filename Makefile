NAME = libft.a
CC = gcc
SRCS = $(wildcard src/*.c)
OBJS_DIR = obj

OBJS = $(patsubst src/%.c,$(OBJS_DIR)/%.o,$(SRCS))

FLAGS = -Wall -Wextra -Werror

RM = rm -f
MKDIR = mkdir -p

$(NAME): $(OBJS)
	@ar rc $(NAME) $(OBJS)

all: $(NAME)

$(OBJS_DIR)/%.o: src/%.c
	@$(MKDIR) $(OBJS_DIR)
	@$(CC) $(FLAGS) -c $< -o $@

clean:
	@$(RM) $(OBJS)

fclean: clean
	@$(RM) $(NAME)
	@$(RM) -r $(OBJS_DIR)

re: fclean all

.PHONY: all clean fclean re