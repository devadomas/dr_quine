/* Let me present you Grace */
#include <stdio.h>
#define X 1
#define Y 2
#define Z int main(){ FILE *fp = fopen("Grace_kid.c","w");char *s = "/* Let me present you Grace */%c#include <stdio.h>%c#define X 1%c#define Y 2%c#define Z int main(){ FILE *fp = fopen(%cGrace_kid.c%c,%cw%c);char *s = %c%s%c; fprintf(fp, s, 10, 10, 10, 10, 34, 34, 34, 34, 34, s, 34, 10); fclose(fp);}%cZ"; fprintf(fp, s, 10, 10, 10, 10, 34, 34, 34, 34, 34, s, 34, 10); fclose(fp);}
Z