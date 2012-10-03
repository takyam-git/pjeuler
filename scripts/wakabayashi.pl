#!/usr/bin/env perl
use utf8;
#use v5.12;

my $max = 1000000;

my $sum = 0;

for my $num (1 .. $max) {
  next unless kaibun_checker($num);
  my $bin_str = sprintf "%b", $num;
  next unless kaibun_checker($bin_str);
  $sum += $num;
}

print $sum;

sub kaibun_checker {
  my ($num) = @_;
  my @str = split //, $num;
  return unless $str[0];
  my $len = @str;
  my $try = int($len / 2);
  my $dec_flag = 0;
  for my $i (0 .. $try) {
    last unless $str[$i] == $str[-1-$i];
    ++$dec_flag;
  }
  return $dec_flag > $try;
}

