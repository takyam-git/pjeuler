#!/usr/bin/env perl
my $sum = 0;

for my $n (1 .. 999) {
  my $r = reverse $n;
  $sum += check_bin($n . $r);
  $sum += check_bin($n . substr $r, 1);
}

print $sum;

sub check_bin {
  my ($dec) = @_;
  my $bin = sprintf "%b", $dec;
  return $dec if $bin eq reverse $bin;
}
