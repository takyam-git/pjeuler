use strict;
use warnings;

LOOP1: for my $i (123456 .. 999999) {
    for my $j (2, 3, 4, 5, 6) {
        my $mul = $i * $j;
        for my $check (split //, $i) {
            next LOOP1 unless $mul =~ /$check/;
        }
    }
    print $i."\n";
    last;
}
