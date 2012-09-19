<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            $fh = fopen("socsecurity.txt", "r");

            // Parse each SSN in accordance with integer-integer-integer format
            while ($user = fscanf($fh, "%d-%d-%d")) {
                // Assign each SSN part to an appropriate variable
                list ($part1,$part2,$part3) = $user;
                printf("Part 1: %d Part 2: %d Part 3: %d <br />", $part1, $part2, $part3);
             }
             fclose($fh);

             // Part 1: 123 Part 2: 45 Part 3: 6789
             // Part 1: 234 Part 2: 56 Part 3: 7890
             // Part 1: 345 Part 2: 67 Part 3: 8901
        ?>
    </body>
</html>
