#!/usr/bin/env perl
use strict;
use warnings;

sub sum_primes {
    my $MAX_PRIME_NUM = 104729; # 裏技
    my $sum_of_primes = 2 + 3;  # 最初だけ特別扱い
    my @table = ();
    my $n = 0;
    while ( 1 ) {
        # 5以上の素数は6n-1, 6n+1であらわすことができる
        $n += 6;
        for my $num ($n - 1, $n + 1) {
            next if $table[$num];
            return $sum_of_primes if $num > $MAX_PRIME_NUM;
            $sum_of_primes += $num;

            # ふるい用
            my $multi = $num * $num;
            while ( $multi <= $MAX_PRIME_NUM ) {
                $table[$multi]++;
                $multi += $num;
            }
        }
    }
}

print sum_primes();

