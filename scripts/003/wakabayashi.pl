#!/usr/bin/env perl
# use v5.12;
# Project Euler - Problem 3
# 13195 の素因数は 5、7、13、29 である。
# 600851475143 の素因数のうち最大のものを求めよ。

# use Time::HiRes qw(gettimeofday tv_interval);
# my $begin = [gettimeofday];

my $target = 600851475143;
my $n = 1;
while ($target != 1) {
  $n += 2;
  next if $target % $n;
  $target /= $n;
}

print $n;
__END__
print "\n";
print tv_interval($begin);
print "\n";
