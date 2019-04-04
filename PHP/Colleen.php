#!/usr/bin/php
<?php
/*
	Let me present you Colleen
*/

function uselessFunc() {}

function main()
{
	/*
		Someone asked for a comment ?
	*/
	$str = '#!/usr/bin/php%1$s<?php%1$s/*%1$s%2$cLet me present you Colleen%1$s*/%1$s%1$sfunction uselessFunc() {}%1$s%1$sfunction main()%1$s{%1$s%2$c/*%1$s%2$c%2$cSomeone asked for a comment ?%1$s%2$c*/%1$s%2$c$str = %3$c%4$s%3$c;%1$s%2$cprint sprintf($str, PHP_EOL, 9, 39, $str);%1$s}%1$s%1$smain();%1$s?>%1$s';
	print sprintf($str, PHP_EOL, 9, 39, $str);
}

main();
?>
