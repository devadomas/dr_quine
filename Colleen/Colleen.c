/* Let me present you Colleen */

#include <stdio.h>

void print(){}

int main()
{
	/* Someone asked for a comment ? */
	print();
	char *s = "/* Let me present you Colleen */%c%c#include <stdio.h>%c%cvoid print(){}%c%cint main()%c{%c%c/* Someone asked for a comment ? */%c%cprint();%c%cchar *s = %c%s%c;%c%cprintf(s, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 34, s, 34, 10, 9, 10);%c}";
	printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 34, s, 34, 10, 9, 10);
}