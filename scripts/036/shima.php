<?php

$total = 1;
for ( $i = 2; $i < 1000000; $i++ ) {
$temp1 = (string)decbin($i);
//$temp2 = ceil(strlen($temp1)/2);
//$temp3 = ceil(strlen($i)/2);
//echo "{$i} => {$temp1}<br />";
//echo " ".substr($temp1, 0, $temp2)."<br />";
//echo " ".substr($temp1, -$temp2)."<br />";
if ( is_batch_for_dec( $i ) && is_batch_for_bin( $i ) ) {
$total += $i;
$a = $i;
}
}

//var_dump($a);
echo number_format($total);

function is_batch_for_bin( $a ) {
$temp1 = (string)decbin($a);
$temp2 = ceil(strlen($temp1)/2);

$temp3 = substr($temp1, 0, $temp2);
$temp4 = substr($temp1, -$temp2);
$temp5 = "";
for ( $i = 1; $i <= strlen($temp4); $i++ ) {
$temp5 .= substr($temp4, -$i, 1);
}
//echo "{$a} => {$temp1} => {$temp3} == {$temp5}({$temp4})<br />\n";

return $temp3 == $temp5;
}

function is_batch_for_dec( $a ) {
$temp1 = (string)$a;
$temp2 = ceil(strlen($temp1)/2);

$temp3 = substr($temp1, 0, $temp2);
$temp4 = substr($temp1, -$temp2);
$temp5 = "";
for ( $i = 1; $i <= strlen($temp4); $i++ ) {
$temp5 .= substr($temp4, -$i, 1);
}
//echo "{$a} => {$temp1} => {$temp3} == {$temp5}({$temp4})<br />\n";

return $temp3 == $temp5;
}