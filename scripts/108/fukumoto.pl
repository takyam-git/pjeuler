use strict;
use warnings;

my @primes;
is_prime($_) for (2 .. 17);

my @answer = (@primes, @primes);
my $min_divisor = 2001;
my $max = mul(map {$_ ** 2} @primes);

search_factors(2, 2);
print sqrt(mul(@answer)) . "\n";

sub search_factors {
    my @factors = @_;

    my $divisor = divisor(@factors);
    if (mul(@factors) >= $max) {
        return;
    }
    if ($divisor >= $min_divisor && $divisor <= divisor(@answer)) {
        @answer = @factors;
        $max = mul(@factors);
        return;
    }

    my $next_prime = next_prime($factors[-1]);
    my $before_prime = before_prime($factors[-1]);

    search_factors(@factors, $next_prime, $next_prime) if $next_prime != 0;
    if ($factors[-1] == 2
        || $before_prime != 0
        && count(\@factors, $before_prime) > count(\@factors, $factors[-1])
    ) {
        my $bottom = $factors[-1];
        search_factors(@factors, $bottom, $bottom);
    }
}

sub is_prime {
    my $n = shift;
    for my $d (@primes){
        last if $d * $d > $n;
        return unless $n % $d;
    }
    push @primes, $n;
    return $n;
}

sub mul {
    my @factors = @_;

    my $mul = 1;
    $mul *= $_ for @factors;
    return $mul;
}

sub divisor {
    my @factors = @_;

    my $divisors = {};

    for my $factor (@factors) {
        $divisors->{$factor}++;
    }

    my $divisor = 1;
    $divisor *= $_ for map { $_ + 1 } values %{$divisors};

    return $divisor;
}


sub count {
    my ($factors, $num) = @_;

    my $count;
    for my $factor (@{$factors}) {
        $count++ if $factor == $num;
    }
    return $count;
}

sub before_prime {
    my $prime = shift;

    return 0 if $prime == 2;

    my $index = 0;
    for my $p (@primes) {
        return $primes[$index-1] if defined $primes[$index-1] && $prime == $p;
        $index++;
    }
    return 0;
}

sub next_prime {
    my $prime = shift;

    my $index = 0;
    for my $p (@primes) {
        return $primes[$index+1] if defined $primes[$index+1] && $prime == $p;
        $index++;
    }
    return 0;
}

