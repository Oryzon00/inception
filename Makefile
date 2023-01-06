NAME		=	inception

SRCS		=			\


INCL		=		\


# CC			=	c++

# CPPFLAGS	=	-Wall -Werror -Wextra -std=c++98

RM			=	rm -f

OBJS		=	$(SRCS:.cpp=.o)

all			:	$(NAME) 

%.o : %.cpp
	$(CC) $(CPPFLAGS) -o $@ -c $< 

$(NAME)		:	$(OBJS)
				$(CC) $(CPPFLAGS) $(OBJS) -o $(NAME) 
		
clean		:	
				$(RM) $(OBJS)

fclean		:	clean
				$(RM) $(NAME)

re			:	fclean all

.PHONY		:	clean fclean re all
