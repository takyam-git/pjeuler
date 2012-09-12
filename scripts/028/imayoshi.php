// <?php
// $a = 1;
// $len = 1001;
// $step;
// $h = $len/2;     // ピラミットの段数
// $w = 3;             // ピラミットの底辺数
// $step = $w -1; // 飛ばす数
// $start = $w;
// for($i=1; $i<=$h; $i++) {
//     $max = $w * $w;
//     for($l = $start; $l<=$max; $l+=$step) {
//         $a += $l;
//     }
//     $w += 2;
//     $step = $w -1;
//     $start = $max + $step;
// }
// echo $a ;
// ?>
<?php
$len = 1001;
$a = 0;
$h = $len/2; // 段数
$max = $w = 1; // 底辺
for($i=1; $i<$h; $i++) {
    $w += 2;
    $min = $max+$w-1;
    $max = $w*$w; //面積
    $a += $min+$max;
}
echo $a*2+1;
?>
