#!/usr/bin/php
<?php
/*
	Let me present you Grace
*/

define('STR', '#!/usr/bin/php%1$s<?php%1$s/*%1$s%2$cLet me present you Grace%1$s*/%1$s%1$sdefine(%3$cSTR%3$c, %3$c%4$s%3$c);%1$sdefine(%3$cFILENAME%3$c, %3$cGrace_kid.php%3$c);%1$sdefine(%3$cPERMISSIONS%3$c, %3$cw%3$c);%1$s%1$sfunction Z()%1$s{%1$s%2$c$file = fopen(FILENAME, PERMISSIONS);%1$s%2$cif ($file)%1$s%2$c{%1$s%2$c%2$cfprintf($file, STR, PHP_EOL, 9, 39, STR);%1$s%2$c%2$cfclose($file);%1$s%2$c}%1$s}%1$s%1$sZ();%1$s?>%1$s');
define('FILENAME', 'Grace_kid.php');
define('PERMISSIONS', 'w');

function Z()
{
	$file = fopen(FILENAME, PERMISSIONS);
	if ($file)
	{
		fprintf($file, STR, PHP_EOL, 9, 39, STR);
		fclose($file);
	}
}

Z();
?>
