-------------------------------------------------
Flash Chat Readme
-------------------------------------------------

Author: Torray Wallace January 2000
http://pluto.spaceports.com/~torray

---------------------------------------------------------
Instructions
---------------------------------------------------------

The Script
----------
Upload the folowing files (as ASCII) to your CGI-BIN directory
and change their chmod status:

chatscript.cgi (chmod 755)
users.dat (chmod 777 or 666)
messages.dat (chmod 777 or 666)

The script was written in Perl and is free. Pass it on, sell it,
or do whatever you like.

Update the $basedir path in the cgi script:

	$basedir="/your_server_root/your_directory";

If you want to know more about Perl. Check out this tutorial:
http://www.ncsa.uiuc.edu/General/Training/PerlIntro/


The chat.fla
------------

All 'Load Variables' URL's need to be changed to the absolute
location of your cgi-bin with the chat script. You will find a
command that says:
Load Variables ("http://www.yoursite.com/cgi-bin/chatscript.cgi", "", vars=POST)
and change the URL to the appropriate location.

The first is change is located at frame 3 (start label) in the Action properties
of the submit button.

The second is located at frame 16 (read label) in the Action properties of the
submit button.

The third is located in the Action properties of frame 16 (the acutal frame itself).

That's all folks! Have fun...
