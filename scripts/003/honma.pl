sub factorization {
    $num = shift;
    $max = 0;
    for$prime(2, 3, 5) {
        if ($num % $prime == 0 ){
            $max = $prime ;
            $num /= $prime;
        }
    }
    $n = 0;
    while (1) {
        $n += 1;
        $prime = 6 * $n + 1;
        last if $prime * $prime > $num;
        if ($num % $prime == 0 ){
            $max = $prime ;
            $num /= $prime;
        }
        $prime += 4;
        last if $prime * $prime > $num;
        if ($num % $prime == 0 ){
            $max = $prime ;
            $num /= $prime;
        }
    }
    $max = $num;
}
print factorization(600851475143);
