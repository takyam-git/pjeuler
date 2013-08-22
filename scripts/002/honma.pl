use constant MAX => 400_0000;
($a, $b, $sum) = (1, 2, 2);
while ((my $r = 3 * $b + 2 * $a) <= MAX) {
  $sum += $r; $a = 2 * $b + $a; $b = $r;
}
print $sum
