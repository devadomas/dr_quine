#!/usr/bin/php
<?php

$x = 5;
$str = '#!/usr/bin/php%1$s<?php%1$s%1$s$x = %5$d;%1$s$str = %3$c%4$s%3$c;%1$sif ($x > 0)%1$s{%1$s%2$c$file = @fopen(%3$cSully_%3$c.($x).%3$c.php%3$c, %3$cr%3$c);%1$s%2$cif ($file)%1$s%2$c{%1$s%2$c%2$c$x--;%1$s%2$c%2$cfclose($file);%1$s%2$c}%1$s%2$c$file = fopen(%3$cSully_%3$c.($x).%3$c.php%3$c, %3$cw%3$c);%1$s%2$cif ($file)%1$s%2$c{%1$s%2$c%2$cfprintf($file, $str, PHP_EOL, 9, 39, $str, $x);%1$s%2$c%2$cfclose($file);%1$s%2$c%2$c$fakefile = fopen(%3$cFakeSully%3$c.($x).%3$c.php%3$c, %3$cw%3$c);%1$s%2$c%2$cif ($fakefile)%1$s%2$c%2$c{%1$s%2$c%2$c%2$cfprintf($fakefile, $str, PHP_EOL, 9, 39, $str, $x);%1$s%2$c%2$c%2$cfclose($fakefile);%1$s%2$c%2$c}%1$s%2$c%2$csystem(%3$cphp Sully_%3$c.($x).%3$c.php%3$c);%1$s%2$c}%1$s}%1$s?>%1$s';
if ($x > 0)
{
	$file = @fopen('Sully_'.($x).'.php', 'r');
	if ($file)
	{
		$x--;
		fclose($file);
	}
	$file = fopen('Sully_'.($x).'.php', 'w');
	if ($file)
	{
		fprintf($file, $str, PHP_EOL, 9, 39, $str, $x);
		fclose($file);
		$fakefile = fopen('FakeSully'.($x).'.php', 'w');
		if ($fakefile)
		{
			fprintf($fakefile, $str, PHP_EOL, 9, 39, $str, $x);
			fclose($fakefile);
		}
		system('php Sully_'.($x).'.php');
	}
}
?>
