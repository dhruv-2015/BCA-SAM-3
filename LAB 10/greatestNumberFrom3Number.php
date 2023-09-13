<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>greatest number from 3 number</title>
</head>

<body>
    <form action="">
        <label for="num">Enter Number</label>
        <input id="num" type="number" name="num"> <br>
        <label for="num2">Enter Number 2</label>
        <input id="num2" type="number" name="num2"> <br>
        <label for="num3">Enter Number 3</label>
        <input id="num3" type="number" name="num3"> <br>
        <input type="submit" value="Sumbit">
    </form>
    <?php
    $num = @$_GET['num'];
    $num1 = $num;
    $num2 = @$_GET['num2'];
    $num3 = @$_GET['num3'];

    if ($num == "" || $num2 == "" || $num3 == "") {
        die();
    }
    if ($num == $num2 && $num == $num3) {
        echo "num1 $num = num2 $num2 = num3 $num3";
    } else if ($num == $num2) {
        echo "num1 $num = num2 $num2";
    } else if ($num == $num3) {
        echo "num1 $num = num3 $num3";
    } else if ($num2 == $num3) {
        echo "num2 $num2 = num3 $num3";
    } else if ($num > $num2 && $num > $num3) {
        echo "num1 $num is greatest";
    } else if ($num2 > $num1 && $num2 > $num3) {
        echo "num2 $num2 is greatest";
    } else if ($num3 > $num1 && $num3 > $num2) {
        echo "num3 $num3 is greatest";
    } else {
        echo "idk and idc";
    }
    ?>
</body>

</html>