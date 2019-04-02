/*
	Let me present you Colleen
*/

#include <stdio.h>

void uselessFunc(){}

int main()
{
	/*
		Someone asked for a comment ?
	*/
	uselessFunc();
	char *s = "/*%1$c%2$cLet me present you Colleen%1$c*/%1$c%1$c#include <stdio.h>%1$c%1$cvoid uselessFunc(){}%1$c%1$cint main()%1$c{%1$c%2$c/*%1$c%2$c%2$cSomeone asked for a comment ?%1$c%2$c*/%1$c%2$cuselessFunc();%1$c%2$cchar *s = %3$c%4$s%3$c;%1$c%2$cprintf(s, 10, 9, 34, s);%1$c}%1$c";
	printf(s, 10, 9, 34, s);
}
