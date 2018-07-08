NAME = libfts.a

NASM = nasm

MACHO64 = -f macho64

AFLAGS = rcus

SRC_DIR = ./srcs/

DIR_OBJ = ./obj/

FILES = ft_bzero.s \
			ft_strcat.s \
			ft_isalpha.s \
			ft_isdigit.s \
			ft_isalnum.s \
			ft_isascii.s \
			ft_isprint.s \
			ft_toupper.s \
			ft_tolower.s \
			ft_puts.s \
			ft_strlen.s \
			ft_memset.s \
			ft_memcpy.s \
			ft_strdup.s \
			ft_cat.s \
			ft_putchar.s \
			ft_putnbr.s \
			ft_memalloc.s \
			ft_atoi.s \
			ft_itoa.s

OBJS = $(patsubst %.s, $(DIR_OBJ)%.o, $(FILES))

all: mkobjdir $(OBJS)
	@ echo "Assembling:"
	@ $(AR) $(AFLAGS) $(NAME) $(OBJS)
	@ echo "\033[32mAll done!\033[0m"

mkobjdir:
	@ mkdir -p $(DIR_OBJ)

$(DIR_OBJ)%.o:
	@ /bin/echo -n "	$(notdir $@)"
	@ $(NASM) $(MACHO64) $(SRC_DIR)$*.s -o $@
	@ echo " \033[32mOK\033[0m"

clean:
	@ /bin/echo -n "Removing object files:"
	@ rm -rf $(DIR_OBJ)
	@ echo " \033[32mdone\033[0m"

fclean: clean
	@ /bin/echo -n "Removing library:"
	@ rm -rf $(NAME)
	@ echo " \033[32mdone\033[0m"

main:
	@ gcc main.c -c -o obj/main.o
	@ gcc obj/main.o $(OBJS)

re: fclean all main

.PHONY : all clean fclean re
