<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>positive, negative or Zero</title>
</head>

<body>
    <form action="">
        <label for="num">Enter Number</label>
        <input id="num" type="number" name="num">
        <?php
        $num = @$_GET['num'];

        if ($num != "") {
            print("<br><p>");
            if ($num == 0) {
                print("Number is zero </p>");
            } else if ($num < 0) {
                print("Number is negative </p>");
            } else {
                print("Number is positive </p>");
            }
        } ?>
    </form>
</body>

</html>