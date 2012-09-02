#!/usr/bin/env perl
use strict;
use warnings;
# 10未満の自然数のうち、3 もしくは 5 の倍数になっているものは 3,  5,  6,  9 の4つがあり、 これらの合計は 23 になる。
# 同じようにして、1, 000 未満の 3 か 5 の倍数になっている数字の合計を求めよ。
# use Time::HiRes qw/gettimeofday tv_interval/;
# my $start = [gettimeofday];
sub sum  {
    my $max = $_[0];
    my $num1 = $_[1];
    my $num2 = $_[2];
    my $sum = 0;
    for (1..($max - 1)) {
        if ($_ % $num1 == 0 or $_ % $num2 == 0) {
            $sum += $_;
        }
    }
    $sum;
}
print sum(1000, 3, 5), "\n";
# my $end = [gettimeofday];
# printf "time = %.3f", tv_interval($start, $end);
