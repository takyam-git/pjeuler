#!/usr/lib/perl

my $res = 1;
for (my $a =3; $a <= 1001; $a += 2){
  my $b = $a**2;
  my $c = $b - ($a-1);
  my $d = $c - ($a-1);
  my $e = $d - ($a-1);

  my $f = $e+$d+$c+$b;
  $res += $f;
}
print $res;
