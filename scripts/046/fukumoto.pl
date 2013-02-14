use strict;
use warnings;

my @primes = (2);
my $n = 2;

while (1) {
    if (! is_prime($n) && $n % 2 == 1) {
        last unless goldbach($n);
    }
    $n++;
}

print $n;

sub goldbach {
    my $n = shift;

    my $goldbach;
    for my $prime (@primes) {
        for my $square (1..$n) {
            $goldbach = $prime + 2 * $square ** 2;
            last if $goldbach > $n;
            return 1 if $goldbach == $n;
        }
    }
    return 0;
}

sub is_prime {
    my $n = shift;

    for my $prime (@primes) {
        return 0 if $n % $prime == 0;
    }
    push @primes, $n;
    return 1;
}

