#!/usr/bin/env perl
use v5.12;
# Project Euler - Problem 2
# フィボナッチ数列の項は前の2つの項の和である。 最初の2項を 1, 2 とすれば、
# 最初の10項は以下の通りである。
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# 数列の項の値が400万を超えない範囲で、偶数値の項の総和を求めよ。

use Time::HiRes qw(gettimeofday tv_interval);
my $begin = [gettimeofday];

my @fib = (1, 2);
my $sum = 2;
while (my $fib = $fib[-1] + $fib[-2]) {
  last if $fib > 4000000;
  $sum += $fib unless $fib & 1;
  push @fib, $fib;
}

print $sum;

print "\n";
print tv_interval($begin);
print "\n";
