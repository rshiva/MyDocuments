@echo off
ECHO.
ECHO _set_param v1.8.7 - 2010, Apr 21 (added bookmarks and anchors in plugin list)
ECHO Written by Florian and Hans Nuecke, mz3-info@vservu.de
ECHO Copyright VservU GmbH 2010
ECHO This file can be freely used and modified by anybody, as long as this and the above three lines of comment stay
ECHO.
ECHO Wrapper script to provide all actually configurable parameters accepted by pdf2mz3, which then automatically will build a MegaZine3 book and directory structure.
ECHO We tested this command file but cannot assume any warranties; use at your own risk!
ECHO.
ECHO Proven default values are set as default but can be overwritten
ECHO This is an alternative option to calling pdf2mz3 without parameters, so you get asked and can enter key parameters interactively
ECHO Read the comments and change the values as you like
ECHO Save this file with a name that specifies the content, 
ECHO      e.g. give it the name _set_param_pdfname. Like _set_param_demo.bat; or use the option to create different versions with the command file _set_version
ECHO
SETLOCAL ENABLEDELAYEDEXPANSION
:: If you want to display more details, SET echo_info==1
SET echo_info=0

:: paramters  (parameter 1: book_name; parameter 2: page_count; paramter 3: version_name; paramter 4: make_pg),
:: If you convert from pdf, the book name must be identical with the name of your pdf file
:: If a version name given, the same PDF will be used but different books named version_name created, e.g. demo_01

:: If this parameter is not passed when _set_param is called, it can be modidied later interactively
::  Spaces within the name are not allowed! Please use "_" instead!
SET book_name=demo

:: If this parameter is not passed when _set_param is called, it can be modidied later interactively
SET pg_count=4

:: The parameter version_name usually is provided by the command file _set_version and used to generate separate versions of the same book
:: but with different _set_param.bat files (and with that different configurations)
:: if you set this to something else than "n" (standing for "no"), those characters are used to create a book named book_x (with x being the characters you entered)
SET version_name=n

:: If you do not want to convert your pdf book into swf pages (again) or ave the pdf file not at hand yet or got the swf pages elsewhere 
:: then "Set make_pg=n"
SET make_pg=y

:: If you want to prepare a folder to copy on a medium like a CD, set the parameter make_what accordingly
:: In that case and a second folder %bookname_CD will be created with the all files needed
:: These are the possible options 
:: make_what=m -> build megazine files for the general MZ3 book only (the folder bookname/ and the index.html and megazine.mz3 files)
:: make_what=c -> create folder for CD content only (the folder bookname_CD/ wwith megazine.mz3, megazine.exe and the complete megezine3 software
:: make_what=b -> create both, standard book and versio for media
:: make_what=n -> create no mz3 files; only directory structure and pages in case of pdf present and if make_pg==y (!= n)
SET make_what=b
::
:: You can prepare everything for a book created out of a pdf file or built out of jpg or png files. 
:: Selecting jpg or png will help to create a standardized directory structure and sample files, 
::     helpfull if you plan to build your book in a fully individually
:: Select either "pdf" or "jpg" or "png"; with "pdf" being the default
SET book_type=pdf

:: What format is your book (US letter/DIN A4)?
:: If you select US, pagewidth and height will be set to 816*1056
:: If you select DIN, pagewidth and height will be set to 679*960
:: If you select self, pagewidth and heigt will be set to pg_width and pg_height you can specify below
SET pg_format=US
SET pg_format=DIN
SET pg_format=self

:: Set the pagewidth and pageheight of your book 
:: This only is relevant if neither pg_format=U nor pg_format=DIN is set, i.e. if you selcted "self" as page format only!
:: THe default is half of DIN A4 to make it fit to almost all monitors
SET pg_width=408
SET pg_height=528

:: If you want to switch the used pages/files dependent on the zoom scale, specify the zoom scale
::    that will used as trigger level for such reload of a page. With scale=0 being the default, disabling such relaod
::    Example: SET scale=2.0 will present the page_l files as long as zoom scale is lower than 2.0, and reload page_h
::             when you zoom in more than to zoom scale 2.0. When you zoom out, the low resolution pages page_l will be used again
SET scale=0

:: With jpg_q you can influence the JPG quality of the pages; with values from 0 to 100. Where 100 is best
::      jpg_q_l specifies the quality of the low quality level pages page_l  (like pages named page_l1.jpg, page_l2.jpg, ...)
::      jpg_q_h specifies the quality of the high quality level pages page_h  (like pages named page_h1.jpg, page_h2.jpg, ...)
SET jpg_q_l=40
SET jpg_q_h=90

:: With res_px you can define the resolution used when converting form pdf to swf files (setting the zoom parameter in swf2pdf)
::      res_px_l specifies the resolution used for low quality, e.g. 36 dpi
::      res_px_h specifies the resolution used for high quality, e.g. 96 dpi
:: If both the pfg_q and res_px are the same for high and low quality, only page_l pages will be created and used
SET res_px_l=36
SET res_px_h=96

:: If you want to use zoom and liquid scaling, you can select the zoomsteps, zoomminscale, zoommaxscale and zoomsnap parameters
:: zoomminscale: lowest zoom scale you can zoom out to
:: zoommaxscale: highest zoom scale you can zoom in to
:: zoomsnap: a list ot zoom scales that will be in any case used when stepping up or down (with the + or - zoom button or the mouse wheel
::      example: SET zoomsnap="0.25, 0.5, 0.75, 1.0, 1.5, 2.0, 3.0 4.0"  if zoomstep is set to 2, only those zoom scale values will be used
:: zoomstep: the (minimum) number of zoom steps. 
:: If zoomsnap is set to "zoomminscale, zoommaxscale" (and with that disabled), zoomsteps defines the number of zoomsteps between zoomminscale and zoommaxscale
::      example: SET zoomsteps="10" ; if zoomminscale="0.5" and zoommaxscale="4.5", then every increase or decrease of zoom scale 
::               will add/subtract 0.4 (which is (4.5-0.5)/10) to the actual zoom scale. So the "snap" values are: 0.5, 0.9, 1.3, 1.7, 2.1, 2.5, 2.9, 3.3, 3.7, 4.1, 4.5
:: If zoomsnap defines additional values like SET zoomsnap="0.5, 1.0, 2.0, 4.0", then the zoom scale sequence will be:
::               0.5, 0.9, 1.0, 1.3, 1.7, 2.0, 2.1, 2.5, 2.9, 3.3, 3.7, 4.0, 4.1, 4.5
:: If you want the book to open with a specific zoom scale, you can set zoominit to a value different to 0 (within zoomminscale and zoommaxscale)
SET zoomminscale=0.25
SET zoommaxscale=4.0
SET zoomsnap="0.25,0.5, 0.75, 1.0, 1.5, 2.0, 3.0, 4.0"
SET zoomsteps=2
SET zoominit=0

:: The shape of a real book can be simulated in giving the pages a certain thickness. Setting pg_thick to values bigger than 0 will show a book edge
:: To achieve a book like look even with smaller magazines, here pagethickness is set to a higher value than by default, if the parameter is omitted.
:: The value should be between 0 and 1.0
SET pagethickness=0.7

:: The maximum thickness of a book can be limited to the following value. Fo book with more than about 30...50 pages this value could be increased 
::     or the pagethickness should be set to lower values, like the MegaZine3 default of pagethickness="0.1"
SET maxthickness=30

:: You can define the maximum number of pages loaded into the cache (memory). 
:: For swf pages with a lot of text, this value should be set to lower values, since otherwise the available memory will be insufficient and the browser will crash.
:: The number defines the number of single pages kept in the cache. A value of 6 will load 2 pages before the actual 2 pages hows and the 2 pages the next double page.
:: With that you can flip one page forward and backward an will see the content immediately. If you flip more than one page, the pages have to be loaded again 
::       and the scaled up thumbnail or a grey page with the "?" and a loading bar will show up.
:: If you have small jpg files, this value can be increased up to the number of pages of the book (if the book is not too big, i.e. e.g. > 50 pages)
:: The default is set to 12, so 2 double pages before and after the actual page will be loaded. To be on the safe side and you can start more than one book in your browser ;-)
:: Most stable browsers are Internet Explorer and Chrome, since both use separate processes for each book. Firefox and Opera are much higher risk to crash.
:: 
:: auto_load controls, what value will be used for maxloaded
:: maxloaded is set as follows (at the end of this command file), depending on the value of autoload
:: l (low)    Maxloaded is set 6
:: n (normal) Maxloaded is set to 22
:: h (high)   Maxloaded is set to 32
:: m (max)    Maxloaded is set to page count, which means that all (!!!) pages are would bechached; very dangerous with big books!
:: u (user)   Maxloaded is set to the value you provide below
SET autoload=h
SET maxloaded=22


:: You can change the behavior of the logic that reduces quality when flipping more than one page
:: Leave it set to true; or read the wiki first before making any changes: http://megazine.mightypirates.de/wiki/index.php/Book#qualitycontrol
SET qualitycontrol=true

:: With centercovers set to TURE (our default here), the book will start closed on the right side of the window,
:: leaving space for a special page. The demo package comes with a custom_pagebackground.png file that gives some instructions
:: This page also could be used for advertisements, an about-us portion, a faked opend first page, ...
:: If set to false, the book will be positioned with the first or last page, the cover pages, in the middle of the window. 
SET centercovers=false

:: The cornerhint is disabled here (set to false). If set to true, 
:: at the first start of the book the corner of the first page is animated (lifted). TO indicate the page can be flipped
:: This is a great hint for people not knowing about flip books, but it consumes a lot of computer power.
:: If you have a small book with no performance issues, you could set it to true
SET cornerhint=false

:: The dragrange is set to the 20 pixel, what normally is sufficient to click the edge of the page for turning it.
:: If you have active content in the book and the dragrange interferes with your buttons or active areas, you can decrease the value.
:: If your customers complain about not finding the active dragzone, you can increase
SET dragrange=20

:: the intensity of the simulated "depth" of a page when flipped can be modified with the shoadow parameter. 
:: A higher value strngthens the effect. Standard values are 0... 0.5. See the wiki for more details
SET shadows=0.3

:: If you want the book being opened with a specific page, you can define that start page here. By default it is 1 (i.e. the first page)
SET startpage=1

:: Everything is prepared for a search in the text. If you convert from a PDF file, in most cases you will be able to export the text
:: Such exported text can be used  as search index for megazine3. There is iforation available in the wiki, and we pla a tutorial
:: about the SEARCH feature. This tutorial will make use of the framework created by pdf2mz3
:: The following parameters have influence on search
:: searchmethod: client or server; if you do not want to provide your own sarch algorithms on your server, keep it set to client
SET searchmethod=client

:: If you prefer to not clear the field where you enter the strings to search for, you should set searchclear=false
:: If you prefer to clear the input field after every search, set searchclear to true
SET searchclear=false

:: To make your book's page numbering the same as the internal numbering of megazine3, you can adjust a potential offset with
:: the parameter pageoffset
SET pageoffset=0

:: 
:: *** book_params not working yet; only an idea!
:: *** Even if we picked the most intersting parameters (for the average user) here, there are many more available.
:: *** If you want to use this file to also add those parameters, you can list them under book_params
:: *** Another way is to modify the final megazine.mz3 directly, or after you gained some experience to build the best fir megazine.mz3 from scratcht yourselves
:: *** Below we list some more parameters to give you an example, but commented them out.
:: ***   SET book_params="foldfx='0.5', lang='en, de, es', loadparallel='2', reflection='false', spinecurvature='-0.5', zoomdoubleclick='false'"
:: *** book_params not working yet; only an idea!

:: You can modify the size of the thumbs (used for page preview) with this parameter.
:: If you want to make use of the option to provide thumbnails as jpg files at start of the book, 
:: you must provide jpg images numbered from 0 to the maximum number of pages like 0.jpg, 1.jpg, ... 29.jpg in the folder /thumbs of your book (like demo/thumbs/0.jpg)
:: Those jpg files must have the size of pagewidth*thumbscale and pageheight*thumbscale.
:: for a US letter book with 816*1056 px size and thumbscale="0.25" (the default), the thumbs should have a size of 204*256
:: You can define smaller or bigger thumbnail images with this parameter
SET thumbscale=0.25
:: here you can define the character(s) to show as long as the thumbnail is not loaded yet
SET thumbloadtext=wait

:: You can add plugins to the list of plugins loaded by default (hard coded in pdf2swf, where you could change also that):
::      keyboardnavigation, batchpages, navigationbar, links, swfaddress
:: Here you you can add your own plugins and the ones that are not used by default, like
::      search, print, backgroundsounds, help, pdflinks
:: SET plugin_list="search, print, backgroundsounds, help, pdflinks, bookmarks, anchors"
SET plugin_list="search, print, printpdf,  pdflinks, bookmarks, anchors"

:: if you want to have bookmarks, please give the page number or name of the first book mark. THis will be created and serve as an example.
:: The default is set to the maxloaded number, i.e. to the last page that is chaced
:: if you do not want to have book marks, leave bbookmark_title empty
SET bookmark_title=%maxloaded%
SET bookmark_title=""
:: Like with the plugin list this paramter list serves to extend the list and settings of paramters not handled individually so far
:: Example: SET paramter_list=password:secret; which will be modified at the end to password="secret"
::SET parameter_list="password^='secret'"

:: The following paramters have influence on the pages and can be either switched on (set to true) or off (set to false)
::      page@buffer: if pg_buf set to TURE, a static copy of the page will be made and used during the page flip action. 
::                   This can result in smoother page flips when a lot of text is used on a swf page
::      img@aa and page@buffer_aa: if img_aa is set to true, an anti_aliasing algorithm is used that usually results in better quality at certain zoom scales
::                    Trade off is lower over all performance
::      img@rasterize: if img_ra is set to true, then a swf is rasterized and cached. Could help to improve performance with movies or a lot of text on swf pages
::      nocache: if nocache is set to true, the FLASH cash will not be used and everthing will have to be loaded from the server; always. 
::                    Usually set to false and only needed  for special requests (like dynamically changing content on the server side; problems with crashes due to memory issues
::      gallerybutton: If gal_bt is set to true, the gallery will be used.
SET pg_buf=true
SET img_aa=false
SET img_ra=false
SET nocache=false
SET gal_bt=false

:: You can use your own company logo, company webaddress and company preloader.
:: pdf2mz3 prepares for that in building the directory structure for this
:: To use a company logo instead of the MegaZine3 logo, 
:: you must provide that logo as a png or jpg image (ideally sized 160*40) called custom_logo.jpg or custom_logo.png in the folder _custom_files
:: 
:: You can set the position of your logo here. Standard position is:"pw-w,ph-h" , 
::     an alternative posiiton is:"pw/2-pagew+120,ph-h-12" , which is to the right of the left page number
SET logo_pos="pw-w,ph-h"

:: Link to your own website
:: If you provide a web address below, that link will be used for your logo (if present). 
:: If no address is provided, the link to the megazine3.de site will be used
SET custom_webaddress=http://vservu.de

:: Using your custom preloader
:: If you provide your own preloader file named custom_preloader in the folder _custom_files, 
:: that file will be copied to the correct folder under megazine and used

::--------------------------------------------------------------------------------------------------------------------------------
:: ************* End of custumization area    ****************
:: ************* Nothing more to change below ****************
::--------------------------------------------------------------------------------------------------------------------------------
::
::
:: ask for name and count if not provided as parameter
::
IF [%echo_info%]==[1]  ECHO book %book_name%, version %version_name%, page count %page_count%, make pages %make_pg%, make what %make_what%
IF NOT [%1]==[] SET book_name=%1
IF  NOT [%2]==[] SET pg_count=%2
IF [%1]==[] SET /P h_book_name="Please enter the name of your book (default name is %book_name%) "
IF [%2]==[] SET /P h_pg_count="Please enter the page count of your book (defaultpage count is %pg_count%) "

IF NOT [%h_book_name%]==[] SET book_name=%h_book_name%
IF NOT [%h_pg_count%]==[] SET pg_count=%h_pg_count%

IF NOT [%3]==[] SET version_name=%3
IF NOT [%4]==[] SET make_pg=%4
IF NOT [%5]==[] SET make_what=%5

IF [%echo_info%]==[1]  ECHO book %book_name%, version %version_name%, page count %page_count%, make pages %make_pg%, make what %make_what%
SET settings="%pg_buf%, %img_aa%, %img_ra%, %nocache%, %gal_bt%"

IF NOT %book_type% == pdf IF NOT %book_type%==jpg IF NOT %book_type%==png SET book_type=pdf
IF [%parameter_list%]==[] SET parameter_list=""

:: depending on the value of autoload, maxloaded will be set
:: l (low)    Maxloaded is set 6
:: n (normal) Maxloaded is set to 22
:: h (high)   Maxloaded is set to 32
:: m (max)    Maxloaded is set to page count, which means that all (!!!) pages are chached; very dangerous with big books!
SET h_maxloaded=%maxloaded%
IF [%autoload%] == [l] SET h_maxloaded=6
IF [%autoload%] == [n] SET h_maxloaded=22
IF [%autoload%] == [h] SET h_maxloaded=32
IF [%autoload%] == [m] SET h_maxloaded=%pg_count%+%pg_count%
SET maxloaded=%h_maxloaded%
 
:summary
IF [%echo_info%]==[0] GOTO no_summary
ECHO book %book_name% count %pg_count% width %pg_width% height %pg_height%  page format %pg_format% 
ECHO scale %scale% h_qual %jpg_q_l% l_qual %jpg_q_h% l_re %res_px_l% h_res %res_px_h% 
ECHO book_type %book_type% minscale %zoomminscale% maxscale %zoommaxscale% 
ECHO snap %zoomsnap% steps %zoomsteps% zoominit %zoominit% maxloaded %maxloaded% 
ECHO pg_thick %pagethickness% max_thick %maxthickness% thumb scale %thumbscale%
ECHO logo_pos %logo_pos%  web address %custom_webaddress%
ECHO settings %settings%
ECHO plugin_list %plugin_list%
ECHO q_control %qualitycontrol% centercovers %centercovers% cornerhint %cornerhint% page offs %pageoffset% 
ECHO dragrange %dragrange% searchmethod %searchmethod% 
ECHO shadows %shadows% searchclear %searchclear% startpage %startpage%
ECHO version_name %version_name% make_pg %make_pg% parameter list %parameter_list% 
ECHO thumbloadtext %thumbloadtext% make_what %make_what%
PAUSE

:no_summary
IF %echo_info%==1 ECHO Parameters output by _set_param
IF %echo_info%==1 ECHO %book_name%,%pg_count%,%pg_width%,%pg_height%,%pg_format%,
IF %echo_info%==1 ECHO %scale%,%jpg_q_l%,%jpg_q_h%,%res_px_l%,%res_px_h%,%book_type%,
IF %echo_info%==1 ECHO %zoomminscale%,%zoommaxscale%,%zoomsnap%,%zoomsteps%,%zoominit%,%maxloaded%,
IF %echo_info%==1 ECHO %pagethickness%,%maxthickness%,%thumbscale%,%logo_pos%,%settings%,
IF %echo_info%==1 ECHO %plugin_list%,%qualitycontrol%,%centercovers%,%cornerhint%,%pageoffset%,%dragrange%,
IF %echo_info%==1 ECHO %plugin_list%,%qualitycontrol%,%centercovers%,%cornerhint%,%pageoffset%,%dragrange%,
IF %echo_info%==1 ECHO %searchmethod%,%shadows%,%searchclear%,%startpage%,%version_name%,%make_pg%,
IF %echo_info%==1 ECHO %parameter_list%,%thumbloadtext%,%custom_webaddress%,%bookmark_title%,%make_what%
IF %echo_info%==1 PAUSE
START _pdf2mz3.bat %book_name%,%pg_count%,%pg_width%,%pg_height%,%pg_format%,%scale%,%jpg_q_l%,%jpg_q_h%,%res_px_l%,%res_px_h%,%book_type%,%zoomminscale%,%zoommaxscale%,%zoomsnap%,%zoomsteps%,%zoominit%,%maxloaded%,%pagethickness%,%maxthickness%,%thumbscale%,%logo_pos%,%settings%,%plugin_list%,%qualitycontrol%,%centercovers%,%cornerhint%,%pageoffset%,%dragrange%,%searchmethod%,%shadows%,%searchclear%,%startpage%,%version_name%,%make_pg%,%parameter_list%,%thumbloadtext%,%custom_webaddress%,%bookmark_title%,%make_what%
ENDLOCAL
EXIT
