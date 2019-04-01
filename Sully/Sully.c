#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int i = 5;
	char filename[20];
	sprintf(filename, "Sully_%d.c", i--);
	if (i < 0)
		return 0;
	FILE *fp = fopen(filename, "w");
	char *s = "#include <stdio.h>%c#include <stdlib.h>%c%cint main(void)%c{%c%cint i = %d;%c%cchar filename[20];%c%csprintf(filename, %cSully_%%d.c%c, i--);%c%cif (i < 0)%c%c%creturn 0;%c%cFILE *fp = fopen(filename, %cw%c);%c%cchar *s = %c%s%c;%c%cfprintf(fp, s, 10, 10, 10, 10, 10, 9, i, 10, 9, 10, 9, 34, 34, 10, 9, 10, 9, 9, 10, 9, 34, 34, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 10);%c%cfclose(fp);%c%cchar command[64];%c%csprintf(command, %cclang -Wall -Wextra -Werror %%s -o Sully ; ./Sully%c, filename);%c%csystem(command);%c}";
	fprintf(fp, s, 10, 10, 10, 10, 10, 9, i, 10, 9, 10, 9, 34, 34, 10, 9, 10, 9, 9, 10, 9, 34, 34, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 9, 10, 9, 34, 34, 10, 9, 10);
	fclose(fp);
	char command[64];
	sprintf(command, "clang -Wall -Wextra -Werror %s -o Sully ; ./Sully", filename);
	system(command);
}