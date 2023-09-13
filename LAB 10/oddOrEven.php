<?php

$num = @$_GET['num'];
// echo $num;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Odd Or Even</title>
</head>
<body>
    <form action="">
        <label for="num">Enter Number</label>
        <input id="num" type="number" name="num">
        <?php 
        if ($num != "") {
            print("<br><p>");
            $oddoreven = $num % 2;
            if ($num % 2 == 0) {
                print("Number is even </p>");
            } else {
                print("Number is odd </p>");

            }
        } ?>
    </form>
</body>
</html>
