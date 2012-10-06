<?php
$primes = array(2,3);
$cnt = 2;
$number = 5;

while ($cnt != 10000) {
  $i = 1;
  while ($number % ($tmp=$primes[$i])) {
    if ($number < $tmp*$tmp) {
      // $primes_sum += $number;
      $primes[$cnt++]=$number;
      break;
    }    
    $i++;
  }

  $number += 2;
}

echo array_sum($primes);

