#!/usr/bin/env perl
use v5.12;
# Project Euler - Problem 4
# 左右どちらから読んでも同じ値になる数を回文数という。
# 2桁の数の積で表される回文数のうち、
# 最大のものは 9009 = 91 × 99 である。
# では、3桁の数の積で表される回文数のうち最大のものはいくらになるか。

use Time::HiRes qw(gettimeofday tv_interval);
my $begin = [gettimeofday];

for (reverse 100 .. 999) {
  check($_ . reverse $_);
}

sub check {
  my ($num) = @_;
  my $stop = int(sqrt($num));
  for (reverse $stop .. 999) {
    next if $num % $_;
    next if length($num / $_) > 3;
    print $num;
    exit;
  }
}

print "\n";
print tv_interval($begin);
print "\n";
