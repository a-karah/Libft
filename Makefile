_END		=	\e[0m
_BOLD		=	\e[1m
_UNDER		=	\e[4m
_REV		=	\e[7m
_GREY		=	\e[30m
_RED		=	\e[31m
_GREEN		=	\e[32m
_YELLOW		=	\e[33m
_BLUE		=	\e[34m
_PURPLE		=	\e[35m
_CYAN		=	\e[36m
_WHITE		=	\e[37m
_IGREY		=	\e[40m
_IRED		=	\e[41m
_IGREEN		=	\e[42m
_IYELLOW	=	\e[43m
_IBLUE		=	\e[44m
_IPURPLE	=	\e[45m
_ICYAN		=	\e[46m
_IWHITE		=	\e[47m
_CLR_LINE	=	\e[K\r

NAME = libft.a
SRCS = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
		ft_strlen.c ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
		ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c ft_strchr.c \
		ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c \
		ft_atoi.c ft_calloc.c ft_strdup.c \
		ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c \
		ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c
SRCS_BONUS = ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
			ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c
OBJS = $(SRCS:.c=.o)
OBJS_BONUS = $(SRCS_BONUS:.c=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror
ARFLAGS = -rcs
RM = rm -rf

all: $(NAME)

debug: CFLAGS += -g
debug: $(NAME)

address: CFLAGS += -fsanitize=address -g
address: re

$(NAME): $(OBJS)
	@printf "$(_CLR_LINE)$(_GREEN) Executable '$(NAME)' created. $(_END)✅\n"
	@ar $(ARFLAGS) $(NAME) $(OBJS)

%.o: %.c
	@printf "$(_CLR_LINE)$(_YELLOW) Compiling $< $(_END)⌛"
	@$(CC) $(CFLAGS) -c $< -o $@

bonus: $(OBJS) $(OBJS_BONUS)
	@printf "$(_CLR_LINE)$(_GREEN) Executable '$(NAME)' created. $(_END)✅\n"
	@ar $(ARFLAGS) $(NAME) $(OBJS) $(OBJS_BONUS)

clean:
	@printf "$(_CLR_LINE)$(_RED) Object files has been deleted. $(_END)🗑️\n"
	@$(RM) $(OBJS) $(OBJS_BONUS)

fclean: clean
	@printf "$(_CLR_LINE)$(_RED) '"$(NAME)"' has been deleted. $(_END)🗑️\n"
	@$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus debug address
