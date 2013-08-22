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

my $capture99999='';
my $start99999;
my $end99999;
{
    my $fh = new IO::Scalar(\$capture99999);
    local *STDOUT = $fh;
    eval(
        '$start99999 = [gettimeofday];'
        .$program
        .'$end99999 = [gettimeofday];'
    );
}
printf "%.6f\n", tv_interval($start99999, $end99999);
print $capture99999, "\n";
