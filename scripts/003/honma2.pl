$d=$a=600851475143;
$s=2;
while ($s<=$d){
    unless ($d%$s){
        $d/=$s;
         next;
    }
    $s++;
}
print$s;
