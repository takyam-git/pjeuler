<?php

$total = 1;
for ( $i = 2; $i < 1000000; $i++ ) {
if ( check( (string)$i ) && check( (string)decbin($i) ) ) {
$total += $i;
}
}
echo number_format($total);

function check( $a ) {
return $a == strrev($a);
}