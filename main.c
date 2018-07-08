#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

void	ft_bzero(void *mem, size_t len);
char	*ft_strcat(char *dest, const char *src);
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_puts(const char *s);
size_t	ft_strlen(const char *s);
void	*ft_memset(void *b, int c, size_t len);
void	*ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
char	*ft_strdup(const char *s1);
void	ft_cat(long fd);
void	ft_putchar(int c);
void	ft_putnbr(long nb);
void	*ft_memalloc(size_t size);
long	ft_atoi(char *str);
char	*ft_itoa(long nb);

int	main(void)
{
	char	*str;
	char	*str2;
	
	// ft_bzero

	str = strdup("12");

	printf("FT_BZERO:\n");
	printf("0: %d, 1: %d\n", str[0], str[1]);
	ft_bzero((void*)str, 3);
	printf("0: %d, 1: %d\n", str[0], str[1]);
	free(str);

	// ft_strcat

	printf("\nFT_STRCAT:\n");
	str = (char*)malloc(5);
	str[0] = '1';
	str[1] = '\0';
	printf("AVANT: %s\n", str);
	str2 = ft_strcat(str, "23");
	printf("APRES: %s\n", str2);
	free(str);

	// ft_isalpha

	printf("\nFT_ISALPHA:\n");
	if (ft_isalpha('r'))
		printf("YES: r is an alpha\n");
	else
		printf("NO: r is not an alpha\n");
	if (ft_isalpha('<'))
		printf("YES: < is an alpha\n");
	else
		printf("NO: < is not an alpha\n");

	// ft_isdigit

	printf("\nFT_ISDIGIT:\n");
	if (ft_isdigit('d'))
		printf("YES: d is digit\n");
	else
		printf("NO: d is not digit\n");
	if (ft_isdigit('8'))
		printf("YES: 8 is digit\n");
	else
		printf("NO: 8 is not digit\n");

	// ft_isalnum

	printf("\nFT_ISALNUM:\n");
	if (ft_isalnum('!'))
		printf("YES: ! is an alpha or numeric\n");
	else
		printf("NO: ! is not an alpha or numeric\n");
	if (ft_isalnum('8'))
		printf("YES: 8 is an alpha or numeric\n");
	else
		printf("NO: 8 is not an alpha or numeric\n");
	if (ft_isalnum('R'))
		printf("YES: R is an alpha or numeric\n");
	else
		printf("NO: R is not an alpha or numeric\n");

	//	ft_isascii

	printf("\nFT_ISASCII:\n");
	if (ft_isascii('~'))
		printf("YES: ~ is an ascii\n");
	else
		printf("NO: ~ is not an ascii\n");
	if (ft_isascii(187))
		printf("YES: '187' is an ascii\n");
	else
		printf("NO: '187' is not an ascii\n");

	//	ft_isprint

	printf("\nFT_ISPRINT:\n");
	if (ft_isprint('7'))
		printf("YES: 7 is print\n");
	else
		printf("NO: 7 is not print\n");
	if (ft_isprint(12))
		printf("YES: '12' is print\n");
	else
		printf("NO: '12' is not print\n");

	//	ft_toupper

	printf("\nFT_TOUPPER:\n");
	printf("Upper char c: %c\n", ft_toupper('c'));
	printf("Upper char 8: %c\n", ft_toupper('8'));

	// ft_tolower

	printf("\nFT_TOLOWER:\n");
	printf("Lower char D: %c\n", ft_tolower('D'));
	printf("Lower char ~: %c\n", ft_tolower('~'));

	// ft_puts

	printf("\nFT_PUTS\n");
	ft_puts("writed with ft_put !");

	// ft_strlen

	printf("\nFT_STRLEN\n");
	printf("ft_strlen of \"1234\": %zu\n", ft_strlen("1234"));

	// ft_memset

	printf("\nFT_MEMSET\n");
	str = strdup("1234");
	printf("AVANT: %s\n", str);
	str2 = ft_memset(str, 'T', 4);
	printf("APRES: %s\n", str2);
	free(str);
	
	// ft_memcpy

	printf("\nFT_MEMCPY\n");
	str = strdup("1234");
	printf("AVANT: %s\n", str);
	str2 = ft_memcpy(str, "ABCD", 3);
	printf("APRES: %s\n", str2);
	free(str);

	// ft_strdup

	printf("\nFT_STRDUP\n");
	str = ft_strdup("ft_strdup string !");
	printf("%s\n", str);
	free(str);

	// ft_cat

	printf("\nFT_CAT\n");
	// ft_cat(0);

	// ft_putchar
	printf("\nFT_PUTCHAR\n");
	ft_putchar('A');

	// ft_putnbr
	printf("\n\nFT_PUTNBR\n");
	ft_putnbr(999);

	// ft_memalloc

	printf("\n\nFT_MEMALLOC\n");
	str = (char*)ft_memalloc(5);
	printf("char 1 + 48: %c, char 2 + 49: %c\n", str[0] + 48, str[1] + 49);
	free(str);

	// ft_atoi

	printf("\n\nFT_ATOI\n");
	printf("ft_atoi nb : %ld\n", ft_atoi("102345"));

	// ft_itoa

	printf("\n\nFT_ITOA\n");
	str = ft_itoa(-123);
	printf("ft_itoa nb : %s\n", str);
	free(str);

	return (0);
}