<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Palindrome Number</title>
</head>

<body>
    <form action="">
        <label for="num">Enter Number</label>
        <input id="num" type="number" name="num">
        <?php
        $num = @$_GET['num'];
        if ($num == "") {
            die();
        }
        if (is_numeric($num)) {
            // echo "<br>";
            // if (strrev($num) == $num) {
            //     echo "<p>$num is palindrome</p>";
            // } else {
            //     echo "<p>$num is not palindrome </p>";
            // }

            
            // or


            $temp = $num;
            $newnum = 0;
            echo "<br>";
            while ($temp != 0) {
                $newnum = $newnum * 10;
                $newnum = $newnum + ($temp % 10);
                $temp = floor($temp / 10);
            }
            if ($newnum == $num) {
                echo "<p>$num is palindrome</p>";
            } else {
                echo "<p>$num is not palindrome </p>";
            }
        }
        ?>
    </form>
</body>

</html>