<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>name of month</title>
</head>

<body>
    <form action="">
        <label for="num">Enter month in number</label>
        <input id="num" type="number" name="num">
        <?php
        $num = @$_GET['num'];
        $months = array(
            1 => "January",
            2 => "February",
            3 => "March",
            4 => "April",
            5 => "May",
            6 => "June",
            7 => "July",
            8 => "August",
            9 => "September",
            10 => "October",
            11 => "November",
            12 => "December");
 
        print("<br><p>");
        if ($num == "") {
            die();
        }
        if (($num >= 1 && $num <= 12)) {
            $month = $months[$num];
            echo "Month is $month </p>";
        } else {
            
            print("Enter Valid month </p>");
        } 
        ?>
    </form>
</body>

</html>