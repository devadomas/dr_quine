#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int i = 5;
	char filename[20];
	char command[64];
	if (i < 0)
		return 0;
	sprintf(filename, "Sully_%d.c", i);
	FILE *fp = fopen(filename, "w");
	char *s = "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$cint main(void)%1$c{%1$c%2$cint i = %3$d;%1$c%2$cchar filename[20];%1$c%2$cchar command[64];%1$c%2$cif (i < 0)%1$c%2$c%2$creturn 0;%1$c%2$csprintf(filename, %4$cSully_%%d.c%4$c, i);%1$c%2$cFILE *fp = fopen(filename, %4$cw%4$c);%1$c%2$cchar *s = %4$c%5$s%4$c;%1$c%2$cfprintf(fp, s, 10, 9, i - 1, 34, s);%1$c%2$cfclose(fp);%1$c%2$csprintf(command, %4$cclang -Wall -Wextra -Werror %%s -o Sully_%%d ; ./Sully_%%d%4$c, filename, i, i);%1$c%2$csystem(command);%1$c}%1$c";
	fprintf(fp, s, 10, 9, i - 1, 34, s);
	fclose(fp);
	sprintf(command, "clang -Wall -Wextra -Werror %s -o Sully_%d ; ./Sully_%d", filename, i, i);
	system(command);
}
