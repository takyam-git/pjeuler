use strict;
use warnings;

my $start = 1;

END: while (1) {
    $start *= 10;

    LOOP1: for my $i ($start..$start * 10 / 6) {
        LOOP2: for my $j (2..6) {
            my $mul = $i * $j;
            for my $check (split //, $i) {
                next LOOP1 unless $mul =~ /$check/;
            }
        }
        print "$i\n";
        last END;
    }
}
