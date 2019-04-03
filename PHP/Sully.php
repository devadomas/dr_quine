#!/usr/bin/php
<?php

define('STR', '#!/usr/bin/php%1$s<?php%1$s%1$sdefine(%3$cSTR%3$c, %3$c%4$s%3$c);%1$s%1$s$x = %5$d;%1$s%1$sif ($x > 0)%1$s{%1$s%2$c$file = fopen(%3$cSully_%3$c.($x - 1).%3$c.php%3$c, %3$cw%3$c);%1$s%2$cif ($file)%1$s%2$c{%1$s%2$c%2$cfprintf($file, STR, PHP_EOL, 9, 39, STR, $x - 1);%1$s%2$c%2$csystem(%3$cphp Sully_%3$c.($x - 1).%3$c.php%3$c);%1$s%2$c}%1$s}%1$s?>%1$s');

$x = 5;

if ($x > 0)
{
	$file = fopen('Sully_'.($x - 1).'.php', 'w');
	if ($file)
	{
		fprintf($file, STR, PHP_EOL, 9, 39, STR, $x - 1);
		system('php Sully_'.($x - 1).'.php');
	}
}
?>
