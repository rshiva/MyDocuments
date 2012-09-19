<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            class Book
            {
                private $title;
                private $isbn;
                private $copies;
                
                // define constructor
                public function __construct($isbn){
                    $this->setIsbn($isbn);
                    $this->getTitle();
                    $this->getNumberCopies();
                }

                public function setIsbn($isbn){
                    $this->isbn = $isbn;
                }
                public function getTitle() {
                    $this->title = "Beginning Python";
                    print "Title: ".$this->title."<br />";
                }
                public function getNumberCopies() {
                    $this->copies = "5";
                    print "Number copies available: ".$this->copies."<br />";
                }
            }

            $book = new book("159059519X");
            //
            // 
        ?>
    </body>
</html>
