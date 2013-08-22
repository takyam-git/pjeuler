use strict;
use warnings;
L: for my $i (123456 .. 999999) {
    my $mul = $i;
    for my $j (2, 3, 4, 5, 6) {
        $mul += $i;
        for my $check (split //, $i) {
            next L unless $mul =~ /$check/;
        }
    }
    print $i;
    last;
}
