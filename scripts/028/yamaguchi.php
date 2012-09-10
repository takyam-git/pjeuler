<?php
$limit = 1001;
$current_limit = 1;
$current_width = 1;
$num = 1;
$sum = 0;
$target_count = 0;
$target_limit = 1;
while (true) {
    if($current_limit < $num){
        $current_width+=2;
        if($current_width > $limit){
            break;
        }
        $current_limit = $current_width * $current_width;
        $target_count = 0;
        $target_limit = $current_width - 1;
    }

    $target_count++;

    if($target_count === $target_limit){
        $sum += $num;
        $target_count = 0;
    }

    $num++;
}
echo $sum;
