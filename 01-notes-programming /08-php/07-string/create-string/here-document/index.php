<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
          $website = "http://www.romatermini.it";

// here document start with <<< follow by delimiter
echo <<<EXCERPT
            <p>Rome's central train station, known as <a href = "$website">Roma Termini</a>,
            was built in 1867. Because it had fallen into severe disrepair in the late 20th
            century, the government knew that considerable resources were required to
            rehabilitate the station prior to the 50-year <i>Giubileo</i>.</p>
EXCERPT;
// delimiter must start at very beginning of the line
        ?>
    </body>
</html>
