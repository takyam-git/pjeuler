#!/usr/bin/env perl
use strict;
use warnings;

my ($ans, $fib, $fib1, $fib2) = (0, 1, 0, 0);
while($fib < 4000000){
    $fib2 = $fib1;
    $fib1 = $fib;
    $fib = $fib1 + $fib2;
    $ans += $fib if $fib %2 == 0;
}
print $ans."\n";

1;
