#!/usr/bin/perl
#
#     -----------------------------------------------
#           Flash Chat script version whatever
#                   by Torray Wallace
#
#                torraywallace@yahoo.com
#          http://pluto.spaceportsw.com/~torray
#     -----------------------------------------------
#            No silly disclaimers here. Use it
#            modify it, sell it. Whatever you
#            want. Just drop me a line to let
#            me know how you like it.
#     -----------------------------------------------
#            Unless you are hacking the code, the
#            onlything that needs to be changed is
#            the $basedir variable. If you don't
#            know what it is for your server, email
#            your webmaster or server administrator
#            or anybody else who has a clue.
#
#            If is doesn't work for some reason, try
#            editing the first line so that it reads
#            '#!/usr/local/bin/perl'. Otherwise try
#            '#!/usr/bin/local/perl'. I can never
#            remember which. 
#

# Setup the Variables

$basedir="/home/torray/public_html/";
$messagefile="messages.dat";
$userfile="users.dat";
$emotefile="emote.dat";
print "Content-type: text/plain\n\n";

if (!$ARGV[0]) {
     if($ENV{'REQUEST_METHOD'} eq 'GET') {
          $ARGV[0] = $ENV{'QUERY_STRING'};
     } else {
          read(STDIN, $ARGV[0], $ENV{'CONTENT_LENGTH'});
     }
}
if ($ARGV[0]) {
     %FORM;
     &get_arg;
	
     if ($FORM{'todo'} eq 'get' ) {
          &get_messages;
     }
     if ($FORM{'todo'} eq 'post' ) {
          &post_message;
     }
     if ($FORM{'todo'} eq 'namesearch' ) {
          &name_search;
     }
} else {
     print "no parameters!\n";
}	

#### Initialize Arguments ##################################

sub get_arg {
     @pairs = split(/&/, $ARGV[0]);
     foreach $pair (@pairs) {
          ($name, $value) = split(/=/, $pair);
          $value =~ tr/+/ /;
          $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
          $value =~ s/<!--(.|\n)*-->//g;      
          $FORM{$name} = $value;
     }
}

#### Name Search ##################################

sub name_search {

     $infile=0;
     open (USERLIST,"<$basedir/$userfile") || die $!;
     @users = <USERLIST>;
     close (USERLIST);

     open (USER,">>$basedir/$userfile") || die $!;
     print "Content-type: text/html\n\n";
     foreach $pair (@users) {
          ($username,$lastpoll,$datestamp)=split(/\,,,,,,,,,,,/,$pair);
          if ($username eq $FORM{'name'}) {
               print "&namefree=false";
               $infile=1;
          }
     }
     if ($infile==0) {
          &stamp;
          print "&namefree=true";
          print USER "$FORM{'name'},,,,,,,,,,,$timestamp,,,,,,,,,,,$datestamp\n";
     }

     close (USER);
     &clean_userlist;

     open (INROOM,"<$basedir/$userfile") || die $!;
     @inchat = <INROOM>;
     close (INROOM);
     $people=0;
          foreach $one (@inchat) {
               $people++;
          }
     if ($people==1) {
          open (MESSAGES,">$basedir/$messagefile") || die $!;
          print MESSAGES "";
          close (MESSAGES);
     }
     print "&eof=true";
}

#### Get messages ##################################

sub get_messages {

     &get_userlist;
     open (MESSAGES,"<$basedir/$messagefile") || die $!;
     @text = <MESSAGES>;
     close (MESSAGES);

     print "&messages=";
          foreach $line (@text) {
          $line =~ s/ /+/g;
          $line =~ s/%/%25/g;
          $line =~ s/&/%26/g;
          #$line =~ s/?/%51/g;
          print $line;
     }
     print "&eot=true";
}

#### Post messages ##################################

sub post_message {

     open (MESSAGES,">>$basedir/$messagefile") || die $!;
     print MESSAGES "<$FORM{'name'}> $FORM{'text'}\n";
     close (MESSAGES);
     &get_messages;
}

#### Get list of current users ##################################

sub get_userlist {

     &clean_userlist;
     open (INROOM,"<$basedir/$userfile") || die $!;
     @inchat = <INROOM>;
     close (INROOM);
     $people=0;

     print "&userlist=";
     foreach $one (@inchat) {
          ($username,$lastpoll)=split(/\,,,,,,,,,,,/,$one);
          print "$username\n";
          $people++;
     }
}

#### Clean user list ##################################

sub clean_userlist {

     open (USERLIST,"<$basedir/$userfile") || die $!;
     @users = <USERLIST>;

     close (USERLIST);
     &stamp;
     $inlist=0;

     open (NEWLIST,">$basedir/$userfile") || die $!;
     foreach $set (@users) {
          ($username,$lastpoll,$lastdate)=split(/\,,,,,,,,,,,/,$set);
          chop($lastdate);
          if ($lastpoll+7 >= $timestamp && $lastdate eq $datestamp) {
               if ($username eq $FORM{'name'}) {
                    print NEWLIST "$username,,,,,,,,,,,$timestamp,,,,,,,,,,,$datestamp\n";
                    $inlist=1;
               } else {
                    print NEWLIST "$username,,,,,,,,,,,$lastpoll,,,,,,,,,,,$lastdate\n";                    
               }
          }          
     }
     if ($inlist==0) {
          print NEWLIST "$FORM{'name'},,,,,,,,,,,$timestamp,,,,,,,,,,,$datestamp\n";               
     }
close (NEWLIST);
}
#### Get timestamp ##################################

sub stamp {
     ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
     $totalseconds=$sec+$min*60+$hour*3600;
     $timestamp = $totalseconds;
     $datestamp = "$mday $mon $year";
     chop($timestamp) if ($timestamp =~ /\n$/);
     chop($timestamp) if ($datestamp =~ /\n$/);
}

exit;
