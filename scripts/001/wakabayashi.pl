#!/usr/bin/env perl
# 10未満の自然数のうち、3 もしくは 5 の倍数になっているものは 3,  5,  6,  9 の4つがあり、 これらの合計は 23 になる。
# 同じようにして、1, 000 未満の 3 か 5 の倍数になっている数字の合計を求めよ。

use Time::HiRes qw(gettimeofday tv_interval);
my $begin = [gettimeofday];


my $sum = 0;
for (1 .. 999) {
  if ($_ % 3 == 0 or $_ % 5 == 0) {
    $sum += $_;
  }
}

print $sum;

print "\n";
print tv_interval($begin);
print "\n";
