/*
	Let me present you Grace
*/

#include <stdio.h>

#define X 1
#define Y 2
#define FT(x)int main(){\
	FILE *fp = fopen("Grace_kid.c", "w");\
	if (!fp) { return 0; }\
	char *s = "/*%1$c%2$cLet me present you Grace%1$c*/%1$c%1$c#include <stdio.h>%1$c%1$c#define X 1%1$c#define Y 2%1$c#define FT(x)int main(){%3$c%1$c%2$cFILE *fp = fopen(%4$cGrace_kid.c%4$c, %4$cw%4$c);%3$c%1$c%2$cif (!fp) { return 0; }%3$c%1$c%2$cchar *s = %4$c%5$s%4$c;%3$c%1$c%2$cfprintf(fp, s, 10, 9, 92, 34, s);%3$c%1$c%2$cfclose(fp);%3$c%1$c}%1$c%1$cFT()%1$c";\
	fprintf(fp, s, 10, 9, 92, 34, s);\
	fclose(fp);\
}

FT()
