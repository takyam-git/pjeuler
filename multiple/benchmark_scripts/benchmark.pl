#!/usr/bin/env perl
# use strict;
use warnings;
use Time::HiRes qw/time gettimeofday tv_interval/;
use IO::Scalar;

my $program = "";
if (open(IN,  $ARGV[0] || "../../scripts/yapc2012/mary.pl")) {
    $program .= $_ for <IN>;
} else {
  print "999.999\nERROR SCRIPT NOT FOUND\n";
  exit;
}
close(IN);

my $capture;
my $start;
my $end;
{
    my $fh = new IO::Scalar(\$capture);
    local *STDOUT = $fh;
    eval(
        '$start = [gettimeofday];'
        .$program
        .'$end = [gettimeofday];'
    );
}
printf "%.6f\n", tv_interval($start, $end);
print $capture, "\n";
