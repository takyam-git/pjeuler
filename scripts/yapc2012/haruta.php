<?php
$i = 12;
$sosu_cnt = 2;
$sosu_list = array(5, 7);
while(1) {
    $inc_cnt = 0;
    $k = -1;
    $p = $i; 
    while($k < 2) {
        $p = $i + $k;
        $j = 0;
        while($j < $sosu_cnt) {
            $sosu = $sosu_list[$j];
            if (!($p % $sosu)) {
                break;
            }
            if ($p < $sosu*$sosu) {
                $sosu_list[] = $p;
                ++$sosu_cnt;
                if ($sosu_cnt > 9997) {
                    break 3; 
                }
                break;
            }       
            ++$j;
        }       
        $k += 2;
    }   
    $i += 6;
}           
echo array_sum($sosu_list) + 2 + 3;

