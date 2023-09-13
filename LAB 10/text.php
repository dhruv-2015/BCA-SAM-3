<?php
$num = @$_GET['num'];
if ($num == "") {
    die();
}
if (is_numeric($num)) {
    if (strrev($num) == $num) {
        echo "$num is palindrome";
    } else {
        echo "$num is not palindrome";
    }
}
?>