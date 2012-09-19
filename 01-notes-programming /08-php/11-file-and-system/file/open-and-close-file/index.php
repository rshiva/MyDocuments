<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            // open file
            $handle = fopen('somefile.txt', 'r');
            // $handle = fopen("/usr/local/apache/data/users.txt","rt");
            // $handle = fopen("summary.html","w", 1);

            // close file
            fclose($handle);

            /*
             *
             * open file paramater
            r
            Read-only. The file pointer is placed at the beginning of the file.

            r+
            Read and write. The file pointer is placed at the beginning of the file.

            w
            Write only. Before writing, delete the file contents and return the file pointer to the beginning of the file. If the file does not exist, attempt to create it.

            w+
            Read and write. Before reading or writing, delete the file contents and return the file pointer to the beginning of the file. If the file does not exist, attempt to create it.

            a
            Write only. The file pointer is placed at the end of the file. If the file does not exist, attempt to create it. This mode is better known as Append.

            a+
            Read and write. The file pointer is placed at the end of the file. If the file does not exist, attempt to create it. This process is known as appending to the file.

            b
            Open the file in binary mode.

            t
            Open the file in text mode.
             */
        ?>
    </body>
</html>
