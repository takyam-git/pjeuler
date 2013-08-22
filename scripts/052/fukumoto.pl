use strict;
use warnings;

my $start = 1;

END: while (1) {
    $start *= 10;

    LOOP: for my $i ($start..$start * 10 / 6) {
        for (2..6) {
            next LOOP unless check($i, $i * $_);
        }
        print "$i\n";
        last END;
    }
}

sub check {
    my ($base, $target) = @_;

    my @base = split //, $base;

    for my $i (@base) {
        return 0 unless $target =~ /$i/;
    }

    return 1;
}
