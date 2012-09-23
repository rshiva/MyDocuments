HOW TO INSTALL:
===============
1. Variables in Frame 1:

Set Variable: "file_name" = "Your_movie.swf"           ---- change 
Set Variable: "file_size" = 73			       ---- total size in KB of the movie
Set Variable: "your_site" = "http://www.your_site.com" ---- change

Don't change the other variables.

2. In Frame 4 you will find the following code:

Set Variable: "percent_loaded" = (frame/total_frames)*100
If Frame Is Loaded (frame)
      Set Variable: "frame" = frame+1
End Frame Loaded
Set Variable: "open" = "( Opened so far "&(percent_loaded/100)*file_size&" KB)"
Set Property ("/BAR", X Scale) = percent_loaded*value

Replace with:
-------------

Set Variable: "percent_loaded" = (_framesloaded/_totalframes)*100
Set Variable: "open" = "( Opened so far "&(percent_loaded/100)*file_size&" KB)"
Set Property ("/BAR", X Scale) = percent_loaded*value




THAT'S ALL FOLKS.

NOTE:
======
I have not tested this preloader with a movie since I did not have a good one.
If you find any bugs could you send me an e-mail with the fix. Tnx in advance.
savco@hotmail.com




