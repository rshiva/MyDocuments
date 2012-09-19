<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php

        print_r(gettimeofday());
        // Array ( [sec] => 1284867556 [usec] => 656251 [minuteswest] => -600 [dsttime] => 0 )
        /*
         * dsttime:
         * The daylight saving time algorithm used, which varies according to geographic location.
         *
         * minuteswest:
         * The number of minutes west of Greenwich Mean Time (GMT).
         *
         * sec:
         * The number of seconds since the Unix epoch.
         *
         * usec:
         * The number of microseconds should the time fractionally supercede a whole second value.
         *
         */
        ?>
    </body>
</html>
