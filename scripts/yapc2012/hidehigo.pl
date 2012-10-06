#/usr/bin/perl
use strict;
use List::Util qw(first sum);
use Time::HiRes;
#my $start = Time::HiRes::time;  

## 30以下の素数
my @primes = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29);
my $sum = sum @primes;
my $loop_cnt = 0;
my $loop_cnt2 = 0;
my $loop_cnt3 = 0;

## 素数の候補を返す。30(2*3*5)で割った余りが以下のものが素数の候補
my @rests = (1, 7, 11, 13, 17, 19, 23, 29);

sub is_prime {
  my $n = shift;
  my $sqrtn = int(sqrt($n));
  foreach my $p (@primes) {
    $loop_cnt ++;
    return 1 if $p > $sqrtn;
    return 0 unless $n % $p;
  }
  return 0;
}

my $i = 0;
my $ele = @primes;
while ($ele < 10000) {
  #$loop_cnt3 ++;
  $i += 30;
  foreach my $rest (@rests) {
    my $n = $i + $rest;
    my $sqrtn = int(sqrt($n));
    
    # prime判定を埋め込み
    foreach my $p (@primes) {
      #$loop_cnt ++;
      if ( $p > $sqrtn ) { # prime
        push(@primes, $n);
        $sum += $n;
        $ele++;
        last;
      }
      last if $n % $p == 0; # not prime
    }
  }
  #print "next:".$n."\n";
}

print $sum."\n";
#print "loop_cnt: $loop_cnt\n";
#printf("%0.3f",Time::HiRes::time - $start); 
#print "loop_cnt: $loop_cnt2\n";
#print "loop_cnt: $loop_cnt3\n";
