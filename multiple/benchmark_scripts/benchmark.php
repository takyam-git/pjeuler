<?php
$start = microtime(true);
if(!isset($argv[1]) || empty($argv[1])){
    echo '999.999' . PHP_EOL . 'ERROR:SCRIPT NOT FOUND';
    die;
}
ob_start();
$result = @include($argv[1]);
$output = ob_get_clean();
echo microtime(true) - $start;
echo PHP_EOL;
echo $output;