#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main(void)
{
	int i = 5;
	int fd;
	char f1[20];
	char f2[20];
	char command[64];
	FILE *fp;
	if (i <= 0)
		return 0;
	sprintf(f1, "Sully_%d.c", i);
	if ((fd = open(f1, O_RDONLY)) > -1)
	{
		i--;
		close(fd);
	}
	sprintf(f2, "Sully_%d.c", i);
	if (!(fp = fopen(f2, "w")))
		return 0;
	char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$cint main(void)%1$c{%1$c%2$cint i = %4$d;%1$c%2$cint fd;%1$c%2$cchar f1[20];%1$c%2$cchar f2[20];%1$c%2$cchar command[64];%1$c%2$cFILE *fp;%1$c%2$cif (i <= 0)%1$c%2$c%2$creturn 0;%1$c%2$csprintf(f1, %3$cSully_%%d.c%3$c, i);%1$c%2$cif ((fd = open(f1, O_RDONLY)) > -1)%1$c%2$c{%1$c%2$c%2$ci--;%1$c%2$c%2$cclose(fd);%1$c%2$c}%1$c%2$csprintf(f2, %3$cSully_%%d.c%3$c, i);%1$c%2$cif (!(fp = fopen(f2, %3$cw%3$c)))%1$c%2$c%2$creturn 0;%1$c%2$cchar *s = %3$c%5$s%3$c;%1$c%2$cfprintf(fp, s, 10, 9, 34, i, s);%1$c%2$cfclose(fp);%1$c%2$csprintf(command, %3$cclang -Wall -Wextra -Werror Sully_%%1$d.c -o Sully_%%1$d ; ./Sully_%%1$d%3$c, i);%1$c%2$csystem(command);%1$c}%1$c";
	fprintf(fp, s, 10, 9, 34, i, s);
	fclose(fp);
	sprintf(command, "clang -Wall -Wextra -Werror Sully_%1$d.c -o Sully_%1$d ; ./Sully_%1$d", i);
	system(command);
}
