<?php
$numbers = array();
foreach(array(3,5) as $num){
    for($i=0;$i<1000;$i+=$num){
        $numbers[] = $i;
    }
}
echo array_sum(array_unique($numbers));
?>