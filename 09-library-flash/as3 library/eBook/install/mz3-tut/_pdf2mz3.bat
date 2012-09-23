@echo off
ECHO.
ECHO _pdf2mz3 v1.8.8 - 2010, Apr 26 (added bookmark example)
ECHO Written by Florian and Hans Nuecke, mz3-info@vservu.de
ECHO Copyright VservU GmbH 2010
ECHO This file can be freely used and modified by anybody, as long as this and the above three lines of comment stay
ECHO.
ECHO Helper script to build a MegaZine3 book from a PDF file.
ECHO We tested this command file but cannot assume any warranties; use at your own risk!
ECHO.
ECHO This command file does the following:
ECHO - Ask you for the name of your MZ3 book, e.g. mybook1 (no spaces allowed in name!!)
ECHO - creates a folder with that name if not existing
ECHO - creates a subfolder /pages in that folder if not existing
ECHO - waits if necessary until your confirmation the pdf file was copied
ECHO - asks for the number of pages of that pdf file
ECHO - asks for the pagewidth and pageheight of your book
ECHO - converts every page of the pdf file into a low and high resolution swf page
ECHO - creates a MZ3 File with that name, using the provided parameters
ECHO - creates a index file that will start your book
ECHO.
ECHO This command file creates the following directories in the actual folder:
ECHO    One with the name you provide as book name plus some supporting folders as
ECHO        _search_index
ECHO        _custom_files (plus subfolder backing_files) and 
ECHO        _changed_mz3_files (with subdirectories gui and plugins)
ECHO    If you don't want this to happen, please do not use this command file.

:: Activate this, for modulo calculation in the loop
SETLOCAL ENABLEDELAYEDEXPANSION
:: If you want to display more details, SET echo_info==1
SET echo_info=0

:: set all parameters with those passed with the call (if provided)
:: book_name must not contain any spaces!
IF [%1]==[] GOTO no_book_name
SET book_name=%1
SET param_cnt=0

SHIFT
IF [%1]==[] GOTO no_pg_count
SET pg_count=%1
SET param_cnt=1

SHIFT
IF [%1]==[] GOTO no_pg_width
SET width=%1
SET param_cnt=2

SHIFT
IF [%1]==[] GOTO no_pg_height
SET height=%1
SET param_cnt=3

SHIFT
IF [%1]==[] GOTO no_pg_format
SET pg_format=%1
SET param_cnt=4

SHIFT
IF [%1]==[] GOTO no_scale
SET scale=%1
SET param_cnt=5

SHIFT
IF [%1]==[] GOTO no_jpg_l_q
SET jpg_l_q=%1
SET param_cnt=6

SHIFT
IF [%1]==[] GOTO no_jpg_h_q
SET jpg_h_q=%1
SET param_cnt=7

SHIFT
IF [%1]==[] GOTO no_res_px_l
SET res_px_l=%1
SET param_cnt=8

SHIFT
IF [%1]==[] GOTO no_res_px_h
SET res_px_h=%1
SET param_cnt=9

SHIFT
IF [%1]==[] GOTO no_book_type
SET book_type=%1
SET param_cnt=10

SHIFT
IF [%1]==[] GOTO no_zoomminscale
SET zoomminscale=%1
SET param_cnt=11

SHIFT
IF [%1]==[] GOTO no_zoommaxscale
SET zoommaxscale=%1
SET param_cnt=12

SHIFT
IF [%1]==[] GOTO no_zoomsnap
SET zoomsnap=%1
SET param_cnt=13

SHIFT
IF [%1]==[] GOTO no_zoomsteps
SET zoomsteps=%1
SET param_cnt=14

SHIFT
IF [%1]==[]  GOTO no_zoominit
SET zoominit=%1
SET param_cnt=15

SHIFT
IF [%1]==[]  GOTO no_maxloaded
SET maxloaded=%1
SET param_cnt=16

SHIFT
IF [%1]==[]  GOTO no_pagethickness
SET pagethickness=%1
SET param_cnt=17

SHIFT
IF [%1]==[]  GOTO no_maxthickness
SET maxthickness=%1
SET param_cnt=18

SHIFT
IF [%1]==[]  GOTO no_thumbscale
SET thumbscale=%1
SET param_cnt=19

SHIFT
IF [%1]==[]  GOTO no_logo_pos
SET logo_pos=%1
SET param_cnt=20

SHIFT
IF [%1]==[]  GOTO no_settings
SET settings=%1
SET param_cnt=21

SHIFT
IF [%1]==[]  GOTO no_plugin_list
SET plugin_list=%1
SET param_cnt=22

SHIFT
IF [%1]==[]  GOTO no_qualitycontrol
SET qualitycontrol=%1
SET param_cnt=23

SHIFT
IF [%1]==[]  GOTO no_centercovers
SET centercovers=%1
SET param_cnt=24

SHIFT
IF [%1]==[]  GOTO no_cornerhint
SET cornerhint=%1
SET param_cnt=25

SHIFT
IF [%1]==[]  GOTO no_pageoffset
SET pageoffset=%1
SET param_cnt=26

SHIFT
IF [%1]==[]  GOTO no_dragrange
SET dragrange=%1
SET param_cnt=27

SHIFT
IF [%1]==[]  GOTO no_searchmethod
SET searchmethod=%1
SET param_cnt=28

SHIFT
IF [%1]==[]  GOTO no_shadows
SET shadows=%1
SET param_cnt=29

SHIFT
IF [%1]==[]  GOTO no_searchclear
SET searchclear=%1
SET param_cnt=30

SHIFT
IF [%1]==[]  GOTO no_startpage
SET startpage=%1
SET param_cnt=31

SHIFT
IF [%1]==[]  GOTO no_version_name
SET version_name=%1
SET param_cnt=32

SHIFT
IF [%1]==[]  GOTO no_make_pg
SET make_pg=%1
SET param_cnt=33

SHIFT
IF [%1]==[]  GOTO no_parameter_list
SET parameter_list=%1
SET param_cnt=34

SHIFT
IF [%1]==[]  GOTO no_thumbloadtext
SET thumbloadtext=%1
SET param_cnt=35

SHIFT 
IF [%1]==[]  GOTO no_custom_webaddress
SET custom_webaddress=%1
SET param_cnt=36

SHIFT 
IF [%1]==[]  GOTO no_bookmark_title
SET bookmark_title=%1
SET param_cnt=37

SHIFT
IF [%1]==[]  GOTO no_make_what
SET make_what=%1
SET param_cnt=38

SET full_auto=true
GOTO :all_param

:no_book_name
SET book_name="demo"

:no_pg_count
SET pg_count=2

:no_width 
SET width=816

:no_height
SET height=1056

:no_pg_format
SET pg_format=US

:no_scale
SET scale=0

:no_jpg_l_q
SET jpg_l_q=40

:no_jpg_h_q
SET jpg_h_q=90

:no_res_px_l
SET res_px_l=36

:no_res_px_h
SET res_px_h=96

:no_book_type
SET book_type=pdf

:no_zoomminscale
SET zoomminscale=0.5

:no_zoommaxscale
SET zoommaxscale=4.0

:no_zoomsnap
SET zoomsnap="0.5, 0.75, 1.0, 1.5, 2.0, 3.0, 4.0"

:no_zoomsteps
SET zoomsteps=2

:no_zoominit
SET zoominit=0

:no_maxloaded
SET maxloaded=24
IF NOT %book_type%==pdf SET maxloaded=24

:no_pagethickness
SET pagethickness=0.7

:no_maxthickness
SET maxthickness=30

:no_thumbscale
SET thumbscale=0.25

:no_logo_pos
SET logo_pos="pw-w,ph-h"

:no_settings
SET settings="true,false,false,false,false"

:no_plugin_list
SET plugin_list="search, print, backgroundsounds, help, pdflinks"

:no_qualitycontrol
SET qualitycontrol=true

:no_centercovers
SET centercovers=false

:no_cornerhint
SET cornerhint=false

:no_pageoffset
SET pageoffset=0

:no_dragrange
SET dragrange=20

:no_searchmethod
SET search_method=client

:no_shadow
SET shadow=0.3

:no_searchclear
SET searchclear=true

:no_startpage
SET startpage=1

:no_version_name
SET version_name="n"

:no_make_pg
SET make_pg=y

:no_parameter_list
SET parameter_list=""

:no_thumbloadtext
SET thumbloadtext=wait

:no_custom_webaddress
SET custom_webaddress=http://megazine.mightypirates.de

:no_bookmark_title
SET bookmark_title=%maxloaded%

:no_make_what
:: b = create both a standard book and a cersion to be copied on media
SET make_what=b

SET full_auto=false

:all_param
IF %echo_info%==1 ECHO %param_cnt% Parameters received by _pdf2mz3
IF %echo_info%==1 ECHO %book_name%,%pg_count%,%pg_width%,%pg_height%,%pg_format%,
IF %echo_info%==1 ECHO %scale%,%jpg_q_l%,%jpg_q_h%,%res_px_l%,%res_px_h%,%book_type%,
IF %echo_info%==1 ECHO %zoomminscale%,%zoommaxscale%,%zoomsnap%,%zoomsteps%,%zoominit%,%maxloaded%,
IF %echo_info%==1 ECHO %pagethickness%,%maxthickness%,%thumbscale%,%logo_pos%,%settings%,
IF %echo_info%==1 ECHO %plugin_list%,%qualitycontrol%,%centercovers%,%cornerhint%,%pageoffset%,%dragrange%,
IF %echo_info%==1 ECHO %searchmethod%,%shadows%,%searchclear%,%startpage%,%version_name%,%make_pg%,
IF %echo_info%==1 ECHO %parameter_list%,%thumbloadtext%,%custom_webaddress%,%bookmark_title%,%make_what%
IF %echo_info%==1 PAUSE

:: Delete all double quotes
SET book_name=%book_name:"=%
SET version_name=%version_name:"=%
SET plugin_list=%plugin_list:"=%
SET parameter_list=%parameter_list:"=%
SET settings=%settings:"=%
SET zoomsnap=%zoomsnap:"=%
SET bookmark_title=%bookmark_title:"=%
SET custom_webaddress=%custom_webaddress:"=%
IF %echo_info%==1 ECHO make_what %make_what%  bookmark_title %bookmark_title%  make_pg %make_pg%
IF %echo_info%==1 PAUSE

IF NOT [%book_type%]==[pdf] goto no_chk_pdf2swf
IF [%make_pg%]==[n] goto no_chk_pdf2swf

:: -------------------------------------------------------------
:: The installation location of the swftools pdf to swf converter
:: CHANGE THIS TO WHERE YOUR INSTALLATION OF THE SWFTOOLS IS


SET PDF2SWF=C:\Programme\SWFTools\pdf2swf.exe

:: --------------------------------------------------------------

:: Defaults workaround for x64 platforms.
IF NOT EXIST "%PDF2SWF%" (
    IF EXIST "C:\Program Files (x86)\SWFTools\pdf2swf.exe" (
        SET PDF2SWF=C:^\Program Files ^(x86^)^\SWFTools\pdf2swf.exe
    )
)

:: Work around if swftol is installed at C: level
IF NOT EXIST "%PDF2SWF%" (
    IF EXIST "C:\SWFTools\pdf2swf.exe" (
        SET PDF2SWF=C:^\SWFTools\pdf2swf.exe
    )
)

:: Test if the swftools are installed...
IF NOT EXIST "%PDF2SWF%" GOTO swftools

:: --------------------------------------------------------------

:no_chk_pdf2swf
SET F_NAME=%book_name%

:getparam1
IF [%full_auto%]==[true] GOTO proc_param1
ECHO.
IF [%book_name%] == [] GOTO no_book_name_entered
ECHO Please either enter the correct name of your MZ3 book 
ECHO       *** NO SPACES WITHIN THE NAME!! ***
SET /p h_book_name="or accept %book_name% as the name of you book (Return)"
IF [%h_book_name%] == [] goto proc_param1
SET book_name=%h_book_name%
goto proc_param1

:no_book_name_entered
SET book_name=demo
ECHO If your book is not named    demo   enter the name of your MZ3 book
SET /p h_book_name="*** No spaces ***, without extension .pdf!: "
IF [%h_book_name%] == [] GOTO proc_param1
SET book_name=%h_book_name%

:proc_param1
::SET book_name=%book_name:"=%
::SET book_name=%book_name:"=%
SET F_NAME=%book_name%

IF [%book_type%]==[pdf]	SET pdf_name=%book_name%.pdf
IF NOT [%book_type%]==[pdf] ECHO A book of type %book_type% will be created
IF [%book_type%]==[pdf] if NOT [%make_pg%]==[n] ECHO A book type %book_type% will be created, converting %pdf_name% into swf pages
IF [%book_type%]==[pdf] if [%make_pg%]==[n] ECHO A book of type %book_type% will be created, but no pages converted.
IF [%echo_info%]==[1] ECHO pdf_name %pdf_name% book_name %book_name% book_type %book_type%
IF [%make_what%]==[n] goto convert_pages

:: skip check for PDF file in case of pages are not to be converted or it is not a pdf type of book
IF [%make_pg%]==[n] goto chk_param2_pg
IF NOT [%book_type%]==[pdf] goto chk_param2
:: check if pdf file exists

IF EXIST %pdf_name% goto chk_param2
ECHO.
ECHO No PDF file named %pdf_name% found
ECHO Please copy the pdf file %pdf_name% to this folder: %CD%
GOTO no_book_name_entered

:chk_param2
ECHO.
IF %book_type%==pdf ECHO PDF file %pdf_name% found 
:chk_param2_pg
IF [%full_auto%]==[true] GOTO getparam3

:getparam2
ECHO.
SET /p h_pg_count= "How many pages should your book have (def %pg_count%; even # please): "
IF [%h_pg_count%]==[] ECHO A default amount of %pg_count% pages is assumed...
if NOT [%h_pg_count%]==[] set pg_count=%h_pg_count%

:getparam3
IF NOT [%pg_format%]==[US] GOTO not_us
SET width=816
SET height=1056
:not_us
IF NOT [%pg_format%]==[DIN] goto not_din
SET width=679
SET height=960
:not_din

IF NOT [%version_name%]==[n] SET book_name=%book_name%_%version_name%

IF [%make_what%]==[n] goto start_conv
IF [%full_auto%]==[true] goto start_conv
:: 816 * 1056 for a US form letter 8.5 inch
:: 679 * 960 for a DIN A4 letter 
ECHO Hint: For a DIN A4 page is             679*960 a good combination
ECHO       For a US letter 8.5 inch page is 816*1056 a good combination
SET /p h_width="New pagewidth (default is %width%): "
IF NOT [%h_width%]==[] SET width=%h_width%

SET /p h_height="New pageheight (default is %height%): "
IF NOT [%h_height%]==[] SET height=%h_height%

ECHO.
SET scale=0
SET h_scale=0
ECHO the high resolution pages will be used for print 
ECHO and can be used for for higher zoom scales. 
SET /p h_scale="zoomscale at which a high resolution img will be loaded (def 0; no switching): "
IF NOT [%h_scale%] == [] SET scale=%h_scale%

:start_conv
:: everything prepared, now start the conversion (if needed and requested)
:: If a folder with the given name does not exist already, it will be created
IF NOT EXIST %book_name%\NUL MD %book_name%
IF NOT EXIST %book_name%\pages\NUL MD %book_name%\pages 

:: the /book and /pages folders will be created in any case!
IF [%make_what%]==[n] goto prep_CD
IF [%make_what%]==[c] goto prep_CD
:: make_what is either m or b

IF NOT EXIST %book_name%\jpgpng\NUL MD %book_name%\jpgpng
IF NOT EXIST %book_name%\%book_name%\sound\NUL MD %book_name%\sound\
IF NOT EXIST %book_name%\%book_name%\video\NUL MD %book_name%\video\

:pg_folder_created
IF NOT EXIST %book_name%\thumbs\NUL MD %book_name%\thumbs 
IF NOT EXIST _search_index\NUL MD _search_index
IF NOT EXIST _custom_files\NUL MD _custom_files
:: prepare parallel folders for CD copy; if megazine\ folder exists AND make_what==true

:prep_cd
IF [%make_what%]==[n] GOTO convert_pages
IF [%make_what%]==[m] goto no_MD_make_what
IF EXIST megazine\NUL GOTO yes_megazine3_framework
ECHO No MegaZine3 Software found at %cd%
ECHO If a copy is exists at %book_name%_CD\megazine\, this copy will be used
PAUSE
IF NOT EXIST %book_name%_CD\megazine\NUL GOTO no_megazine3_framework

:yes_megazine3_framework
:: make_what is either c or b
IF NOT EXIST %book_name%_CD\NUL MD %book_name%_CD
IF NOT EXIST %book_name%_CD\megazine\pages\NUL MD %book_name%_CD\megazine\pages\

IF NOT EXIST %book_name%_CD\megazine\NUL MD %book_name%_CD\megazine
IF NOT EXIST %book_name%_CD\megazine\jpgpng\NUL MD %book_name%_CD\megazine\jpgpng\
IF NOT EXIST %book_name%_CD\megazine\sound\NUL MD %book_name%_CD\megazine\sound\
IF NOT EXIST %book_name%_CD\megazine\video\NUL MD %book_name%_CD\megazine\video\
IF NOT EXIST %book_name%_CD\megazine\_search_index\NUL MD %book_name%_CD\megazine\_search_index\

:: Create autrun.inf file
ECHO [AutoRun] > %book_name%_CD\autorun.inf
ECHO open^=megazine/megazine.exe >> %book_name%_CD\autorun.inf
ECHO icon=mz3.ico >> %book_name%_CD\autorun.inf

:no_MD_make_what
:: if a preloader file named bookname.swf or bookname_versionname.swf is provided, this file will be copied to megazine/ also; no need to save anything first...
:: The custom preloader files can be provided at  _custom_files
::

GOTO chk_preloader

:no_megazine3_framework
ECHO There is no MegaZine3 framework available (no folder named megazine/). 
ECHO Please download the latest version from here:
ECHO http://megazine.mightypirates.de/index.php?id=download
ECHO.
ECHO Without a complete framework, this command file job cannot complete
ECHO it's full job. Files might be missing like: preloader, plugins, asul files, ...
ECHO.
ECHO Copy the megazine framework here: %CD%
ECHO.
ECHO Please abort (CRTL-C), then copy the megazine3 files and start again.
ECHO You also can continue and the MegaZine3 file and the index file will be created, 
ECHO but the book will not work.
ECHO.
PAUSE

:chk_preloader
:: check, if a custom preloader exists; and if so, copy that file to megazine/
:: take version preloader if exists (v), if not take book preloader if exists (b), if not take custom_preloader if exists (c, for compatibility), if no custom preloader exists take standard preloader (s); 
:: if not even the standard preloader exists, start book directly (m)
SET preloader_type=m
IF EXIST megazine\preloader.swf SET preloader_type=s
IF EXIST _custom_files\custom_preloader.swf SET preloader_type=c
IF EXIST _custom_files\%f_name%.swf SET preloader_type=b
IF EXIST _custom_files\%book_name%.swf SET preloader_type=v

IF [%preloader_type%]==[c]  (
  XCOPY /e /y _custom_files\custom_preloader.swf megazine\
  SET preloader_name=megazine/custom_preloader.swf
)
IF [%preloader_type%]==[m]  (
  SET preloader_name=megazine/megazine.swf
)
IF [%preloader_type%]==[s]  (
  SET preloader_name=megazine/preloader.swf
)
IF [%preloader_type%]==[b]  (
  XCOPY /e /y _custom_files\%f_name%.swf megazine\
  SET preloader_name=megazine/%f_name%.swf
)
IF [%preloader_type%]==[v]  (
  XCOPY /e /y _custom_files\%book_name%.swf megazine\
  SET preloader_name=megazine/%book_name%.swf
)


:chk_logo_name
SET logo_name=gui/engine/poweredby.png
SET h_logo_name=_custom_files/custom_logo
IF EXIST %h_logo_name%.png (
    XCOPY /e /y _custom_files\custom_logo.png megazine\
	SET logo_name=custom_logo.png
)
IF  EXIST %h_logo_name%.jpg (
    XCOPY /e /y _custom_files\custom_logo.jpg megazine\
	SET logo_name=custom_logo.jpg
)
IF  EXIST %h_logo_name%.swf (
    XCOPY /e /y _custom_files\custom_logo.swf megazine\
	SET logo_name=custom_logo.swf
) 

:no_logo_c
SET custom_pagebackground=

SET h_custom_pagebackground=_custom_files/custom_pagebackground
IF EXIST %h_custom_pagebackground%.png (
    XCOPY /e /y _custom_files\custom_pagebackground.png megazine\
	SET custom_pagebackground=custom_pagebackground.png
)
IF  EXIST %h_custom_pagebackground%.jpg (
    XCOPY /e /y _custom_files\custom_pagebackground.jpg megazine\
	SET custom_pagebackground=custom_pagebackground.jpg
)
IF  EXIST %h_custom_pagebackground%.swf (
    XCOPY /e /y _custom_files\custom_pagebackground.swf megazine\
	SET custom_pagebackground=custom_pagebackground.swf
)
 
ECHO.
ECHO The logo used is                 %logo_name%  
ECHO     preloader file is            %preloader_name% 
ECHO	 custom_pagebackground is            %custom_pagebackground%
ECHO The url linked with the logo is  %custom_webaddress% (if provided and logo shown)
ECHO.
IF %echo_info%==1 ECHO +++ Show pdf conversion settings if book_type is pdf (it is %book_type%)

:: Process all pages
IF %book_type%==pdf ECHO now ready to convert using       %PDF2SWF% 
IF [%make_what%]==[n] GOTO convert_pages
IF [%make_what%]==[c] ECHO   Book will be prepared for copy on media 
IF [%make_what%]==[b] ECHO   Book will be prepared for copy on media also
ECHO   for number of pages            %pg_count%
ECHO   of size                        %width%*%height% 
ECHO   from PDF file                  %pdf_name%
ECHO   writing low res pages to       %book_name%/pages/page_lx
ECHO   writing high res pages to      %book_name%/pages/page_hx
ECHO   with pagenumbers  x=1 to       %pg_count% 
IF [%scale%] == [0] ECHO no reload of other resolution at specific zoom scale
IF NOT [%scale%]==[0] ECHO change resolution at zoomscale   %scale%
IF NOT [%parameter_list%]==[] ECHO parameter list                   %parameter_list%
IF NOT [%thumbloadtext%]==[] ECHO thumbloadtext                    %thumbloadtext%
IF [%make_what%]==[c] ECHO A folder with all files needed 
IF [%make_what%]==[b] ECHO Parallel to the book %book_name% a folder with all files needed 
IF [%make_what%]==[c] ECHO    for a copy on media is created with the name %book_name%_CD
IF [%make_what%]==[b] ECHO    for a copy on media is created with the name %book_name%_CD
ECHO.
ECHO *** If you want to modify more parameters 
ECHO *** or only want to enter the book name and page numbers: 
ECHO *** Start the file _set_param.bat instead of _pdf2mz3.bat!
ECHO.

IF [%full_auto%]==[true] goto no_pause
PAUSE
:no_pause
:convert_pages
IF %echo_info%==1 ECHO +++ create_pdf if book_type is pdf (it is %book_type%)
IF [%make_pg%]==[n] goto no_create_pg
IF NOT [%book_type%]==[pdf] GOTO create_mz3

  FOR /L %%i IN (1,1,%pg_count%) DO (
    ECHO Processing page %%i
	"%PDF2SWF%" -q -t -T 9 -s internallinkfunction=megazine.PDFlinkHandler -j%jpg_q_h% -s zoom=%res_px_h% -G -p %%i -f "%pdf_name%" "%book_name%/pages/page_h%%i.swf"
	"%PDF2SWF%" -q -t -T 9 -s internallinkfunction=megazine.PDFlinkHandler -j%jpg_q_l% -s zoom=%res_px_l% -G -p %%i -f "%pdf_name%" "%book_name%/pages/page_l%%i.swf"
)

:no_create_pg
:create_mz3
IF [%make_what%]==[n] goto no_mz3copy_make_what
IF [%make_what%]==[m] goto no_mz3copy_make_what

:: copy MegaZine3 software, search index, thumbs, images and created pages to the respective folder in %book_name%_CD
ECHO Now the MegaZine3 Software, the search index and the data (jpg, png, swf, snd, vid) are copied to the CD folder
IF EXIST megazine\megazine.exe COPY megazine\megazine.exe %book_name%_CD\megazine\
IF EXIST _changed_mz3_files\megazine.exe COPY _changed_mz3_files\megazine.exe %book_name%_CD\megazine\

:: IF megazine.swf already exist in CD/megazine folder it is assumed that the software already was copied,
:: and another copy process is omitted. If you want a fresh copy, delete the CD/megazine folder first
IF EXIST %book_name%_CD\megazine\megazine.swf goto no_mz3copy_make_what
XCOPY /e /y megazine\*.* %book_name%_CD\megazine\

:no_mz3copy_make_what
IF [%make_what%]==[m] goto build_index_file
IF NOT [%make_pg%]==[n] XCOPY /e /y %book_name%\pages\*.* %book_name%_CD\megazine\pages\
IF [%make_what%]==[n] goto end

XCOPY /e /y VERSION. %book_name%_CD\
XCOPY /e /y COPYING. %book_name%_CD\
XCOPY /e /y README. %book_name%_CD\
IF exist _search_index\%f_name%.txt XCOPY /e /y _search_index\%f_name%.txt %book_name%_CD\megazine\_search_index\

IF [%make_what%]==[c] goto build_index_file
XCOPY /e /y %book_name%\jpgpng\*.* %book_name%_CD\megazine\jpgpng\
XCOPY /e /y %book_name%\video\*.* %book_name%_CD\megazine\video\
XCOPY /e /y %book_name%\sound\*.* %book_name%_CD\megazine\sound\
XCOPY /e /y %book_name%\thumbs\*.* %book_name%_CD\megazine\thumbs\


:build_index_file
IF [%make_what%]==[c] goto build_mz3_file
ECHO Now creating the index_%book_name%.html files
:: Write Index_File
ECHO ^<^^!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"^> >index_%book_name%.html
ECHO 	^<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"^> >>index_%book_name%.html
ECHO 	^<head^> >>index_%book_name%.html
ECHO 	^<title^>MegaZine3 PageFlip Book %book_name%^</title^> >>index_%book_name%.html
ECHO 	^<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /^> >>index_%book_name%.html
ECHO 	^<link type="text/css" href="style.css" rel="stylesheet" /^> >>index_%book_name%.html
ECHO 	^<script type="text/javascript" src="js/swfobject.js"^>^</script^> >>index_%book_name%.html
ECHO 	^<script type="text/javascript" src="js/swfaddress.js"^>^</script^> >>index_%book_name%.html
ECHO 	^<script type="text/javascript" src="megazine/megazine.js"^>^</script^> >>index_%book_name%.html
ECHO 	^<script type="text/javascript"^> >>index_%book_name%.html
ECHO 		//^<^^![CDATA[ >>index_%book_name%.html
ECHO 		var flashvars = { >>index_%book_name%.html
ECHO 			/* >>index_%book_name%.html
ECHO 				Used to pass the name of the xml file to use. Path is relative to the megazine.swf file^^! >>index_%book_name%.html
ECHO 				IMPORTANT: when not using the wmode: "transparent" option below, REMOVE THE COMMA (,) after >>index_%book_name%.html
ECHO 							the file name. Otherwise this will break JavaScript (and thus the loading of the >>index_%book_name%.html
ECHO 							Flash content) in Internet Explorer. >>index_%book_name%.html
ECHO 			*/ >>index_%book_name%.html
ECHO 			xmlFile: "../%book_name%/megazine.mz3" >>index_%book_name%.html
ECHO 			/* Remove the // to enable transparency (show HTML background). Not recommended (slow). Use book/background instead. */ >>index_%book_name%.html
ECHO 			//wmode: "transparent"	 >>index_%book_name%.html
ECHO 		}; >>index_%book_name%.html
ECHO 		var params = { >>index_%book_name%.html
ECHO 			menu: "false", >>index_%book_name%.html
ECHO 			scale: "noScale", >>index_%book_name%.html
ECHO 			allowFullscreen: "true", >>index_%book_name%.html
ECHO 			allowScriptAccess: "always", >>index_%book_name%.html
ECHO 			/* This is the background color used for the Flash element. */ >>index_%book_name%.html
ECHO 			bgcolor: "#333333" >>index_%book_name%.html
ECHO 		}; >>index_%book_name%.html
ECHO 		var attributes = { >>index_%book_name%.html
ECHO 			id: "megazine" >>index_%book_name%.html
ECHO 		}; >>index_%book_name%.html
ECHO 		swfobject.embedSWF("%preloader_name%", "megazine", "100%%", "100%%", "9.0.115", "js/expressInstall.swf", flashvars, params, attributes); >>index_%book_name%.html
ECHO 		//]]^> >>index_%book_name%.html
ECHO 	^</script^> >>index_%book_name%.html
ECHO ^</head^> >>index_%book_name%.html
ECHO ^<body^> >>index_%book_name%.html
ECHO 	^<div id="megazine"^> >>index_%book_name%.html
ECHO 		^<h1^>MegaZine3 requires FlashPlayer 9^</h1^> >>index_%book_name%.html
ECHO 		^<p^>^<a href="http://www.adobe.com/go/getflashplayer"^>^<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /^>^</a^>^</p^> >>index_%book_name%.html
ECHO 		^<p^>^<a href="http://megazine.mightypirates.de/"^>Powered by MegaZine3^</a^>^</p^> >>index_%book_name%.html
ECHO 	^</div^> >>index_%book_name%.html
ECHO ^</body^> >>index_%book_name%.html
ECHO ^</html^> >>index_%book_name%.html

:build_mz3_file
:: Write XML header and lead in
:: create megazine.mz3 for the book in first loop and for bookname_CD in the second loop (if %make_what%==true
ECHO Now creating the %book_name%/megazine.mz3 and optionally the %book_name%_CD/megazine/megazine.mz3 file
SET mz3_name=%book_name%/megazine.mz3
SET path_name=../%book_name%/
SET search_path=../
SET index=a
:for_loop
IF [%index%]==[c] GOTO end_for_loop
:: skip if only CD has to be built
IF [%index%]==[a] IF [%make_what%]==[c] GOTO no_mz3_make_what
IF [%index%]==[a] ECHO Path1: creation of the book version for images in path %path_name% and mz3 file in %mz3_name%
IF [%index%]==[b] ECHO Path2: creation of the CD version; images and the megazine.mz3 file are located 
IF [%index%]==[b] ECHO        in path %mz3_name%/

ECHO ^<?xml version="1.0" encoding="utf-8"?^> > %mz3_name%
ECHO ^<^^!DOCTYPE book SYSTEM "http://megazine.mightypirates.de/megazine2.dtd"^> >> %mz3_name%
ECHO ^<book plugins="console, keyboardnavigation, batchpages, navigationbar, links, swfaddress, %plugin_list%" >> %mz3_name%
ECHO		pagewidth="%width%" pageheight="%height%"  >> %mz3_name%
ECHO		errorlevel="ERROR" >> %mz3_name%
ECHO		thumbloadtext="%thumbloadtext%" >> %mz3_name%
ECHO		zoomminscale="%zoomminscale%" zoommaxscale="%zoommaxscale%" >> %mz3_name%
ECHO		zoomsnap="%zoomsnap%" >>%mz3_name%
ECHO		zoomsteps="%zoomsteps%" >> %mz3_name%
IF NOT %zoominit%==0 ECHO		zoominit ="%zoominit%" >> %mz3_name%
ECHO		dragrange="%dragrange%" >> %mz3_name%
ECHO		maxloaded="%maxloaded%" >> %mz3_name%
ECHO		qualitycontrol="%qualitycontrol%" >> %mz3_name%
ECHO		thumbpath="%path_name%thumbs/" >> %mz3_name%
ECHO		thumbscale="%thumbscale%" >> %mz3_name%
ECHO		searchmethod="%searchmethod%" >> %mz3_name%
:: Use as search index text file named after the pdf file, i.e. without version name
IF [%index%]==[a] IF NOT EXIST _search_index/%f_name%.txt ECHO Search will not work for the online book because no search index found (file _search_index/%f_name%.txt missing!)
IF [%index%]==[b] IF NOT EXIST %book_name%_CD/megazine/_search_index/%f_name%.txt ECHO Search will not work for the offline book (CD, DVD) because no search index found ( file %book_name%_CD/megazine/_search_index/%f_name%.txt missing!)
ECHO		searchindex="%search_path%_search_index/%f_name%.txt" >> %mz3_name%
ECHO		cornerhint="%cornerhint%" >> %mz3_name%
ECHO		pagethickness="%pagethickness%" >> %mz3_name%
ECHO		shadows="%shadows%" >> %mz3_name%
ECHO		searchclear="%searchclear%" >> %mz3_name%
ECHO		startpage="%startpage%" >> %mz3_name%
ECHO		centercovers="%centercovers%" >> %mz3_name%
IF NOT [%parameter_list%]==[] ECHO		%parameter_list% >> %mz3_name%
ECHO		pageoffset="%pageoffset%"^> >> %mz3_name%
ECHO	^<background^> >> %mz3_name%
ECHO	    ^<box background="image(%logo_name%)" width="160" height="45" anchors=%logo_pos% url="%custom_webaddress%/" target="_blank"/^> >> %mz3_name%
ECHO	^</background^> >> %mz3_name%

ECHO.
		IF NOT [%custom_pagebackground%] == [] (
ECHO	^<pagebackground^> >> %mz3_name%
ECHO		^<box background="image(%custom_pagebackground%)" width="%width%+%width%" height="%height%" anchors="0,0"  target="_self"/^> >> %mz3_name%
ECHO	^</pagebackground^> >> %mz3_name%
)
IF [%bookmark_title%]==[] goto no_bookmarks
ECHO ^<^^!-- Example for the use of bookmarks --^> >> %mz3_name%
ECHO ^<bookmarks^> >> %mz3_name%
ECHO    ^<bookmark  >> %mz3_name%
ECHO      title="last page"  >> %mz3_name%
ECHO      page="last"  >> %mz3_name%
ECHO   	  color="#0033cc"  >> %mz3_name%
ECHO    /^> >> %mz3_name%
ECHO    ^<bookmark  >> %mz3_name%
ECHO      title="1st" >> %mz3_name%
ECHO   	  page="chapter1" >> %mz3_name%
ECHO    /^> >> %mz3_name%
ECHO   ^<bookmark >> %mz3_name%
ECHO      title="book_start" >> %mz3_name%
ECHO      page="book_start" >> %mz3_name%
ECHO      color="#e0e0e0" >> %mz3_name%
ECHO     /^> >> %mz3_name%
ECHO     ^<bookmark >> %mz3_name%
ECHO       title="maxloaded:%maxloaded%" >> %mz3_name%
ECHO       page="%maxloaded%" >> %mz3_name%
ECHO       color="#cc3300" >> %mz3_name%
ECHO     /^> >> %mz3_name%
ECHO     ^<bookmark >> %mz3_name%
ECHO       title="page 10" >> %mz3_name%
ECHO       page="10" >> %mz3_name%
ECHO       color="#dddd00" >> %mz3_name%
ECHO     /^> >> %mz3_name%
ECHO     ^<bookmark >> %mz3_name%
ECHO       title="EoB" >> %mz3_name%
ECHO       page="book_end" >> %mz3_name%
ECHO       color="#e0e0e0" >> %mz3_name%
ECHO     /^> >> %mz3_name%
ECHO     ^<bookmark >> %mz3_name%
ECHO       title="ch 3" >> %mz3_name%
ECHO       page="chapter3" >> %mz3_name%
ECHO       color="#e0e0e0" >> %mz3_name%
ECHO     /^> >> %mz3_name%
ECHO     ^<bookmark >> %mz3_name%
ECHO       title="ch 4" >> %mz3_name%
ECHO       page="chapter4" >> %mz3_name%
ECHO       color="#eeffaa" >> %mz3_name%
ECHO    /^> >> %mz3_name%
ECHO	^</bookmarks^> >> %mz3_name%

ECHO     ^<chapter anchor="chapter1"^> >> %mz3_name%
ECHO     ^<page bgcolor="#bbccdd"^> >> %mz3_name%
ECHO     ^<txt position="center middle"  align="center" color="#111111" rasterize="false" ^> >> %mz3_name%
ECHO     ^<content^>^<^^![CDATA[^<b^>Jump forward ^</b^> to ^<i^>last page^</i^>^<br/^>This link is realized by ^<b^> area^</b^> The text is NOT rasterized^<br/^> >> %mz3_name%
ECHO The area has an overlay with color and border]]^>^</content^> >> %mz3_name%
ECHO     ^</txt^> >> %mz3_name%
ECHO     ^<area url="anchor:last" width="400" height="100" position="center middle"  overlay="color(0,0.5,0xffff00);border(0,1,#333333,3" /^> >> %mz3_name%		 
ECHO     ^</page^> >> %mz3_name%
ECHO     ^<page color="0xccddee"/^> >> %mz3_name%
ECHO     ^</chapter^> >> %mz3_name%
:no_bookmarks

::build the pages construct; assumption: pages plugin is used; will probably be checked in a later version
ECHO	^<chapter 	>> %mz3_name%
:: treat pdf, jpg and png separately
IF %book_type%==pdf  GOTO pages_pdf
IF %book_type%==jpg  GOTO pages_jpg
::if book is a png book, i.e. low res images are png images
:pages_png
::output at least this row to show the png page in low quality
ECHO		pages=^"scale('%path_name%jpgpng/png_l{{num}}.png'); >> %mz3_name%
IF [%scale%]==[0] GOTO do_print
::a value for zoom scale was provided. At that scale the higher resolution page can be loaded
::check if at least the first page in hi-res is available. If so, megazine will try to load the hi-res png version of the respective pages
IF EXIST  "%book_name%/jpgpng/img_h1.png" ECHO		scale('%path_name%jpgpng/img_h{{num}}.png',%scale%); >> %mz3_name%
::if there is no hi_res png available, a test for a jpg image is made. If img_l1.jpg is found in subfolfer /jpgpng, then jpg images will be loaded at higher zoom scale
IF NOT EXIST  "%book_name%/jpgpng/img_h1.png" IF EXIST  "%book_name%jpgpng/img_h1.jpg" ECHO		scale('%path_name%jpgpng/img_h{{num}}.jpg',%scale%); >> %mz3_name%
GOTO do_print

:pages_pdf
::book is a pdf book
ECHO		pages=^"scale('%path_name%pages/page_l{{num}}.swf'); >> %mz3_name%
IF [%scale%]==[0] GOTO do_print
::a value for zoom scale was provided. At that scale the higher resolution page can be loaded
::check if at least the first page in hi-res is available. If so, megazine will try to load the hi-res swf version of the respective pages
IF EXIST  "%book_name%/pages/page_h1.swf" ECHO		scale('%path_name%pages/page_h{{num}}.swf',%scale%); >> %mz3_name%
::if there is no hi-res swf available, a test for a png image is made. if img_l1.png is found in subfolder /jpgpng, then png images will be loaded at higher zoom scale
IF NOT EXIST  "%book_name%/pages/page_h1.swf" IF NOT EXIST  "%book_name%/jpgpng/img_h1.png" ECHO		scale('%path_name%jpgpng/img_h{{num}}.png',%scale%); >> %mz3_name%
GOTO do_print


:pages_jpg
::book is a jpg book
ECHO		pages=^"scale('%path_name%jpgpng/img_l{{num}}.jpg'); >> %mz3_name%
IF [%scale%]==[0] GOTO do_print
::a value for zoom scale was provided. At that scale the higher resolution page can be loaded
::check if at least the first page in hi-res is available. If so, megazine will try to load the hi-res png version of the respective pages first
IF NOT EXIST  "%book_name%/pages/page_h1.swf" GOTO scale_noswf_at_jpg
ECHO		scale('%path_name%pages/page_h{{num}}.swf',%scale%); >> %mz3_name%
GOTO do_print

:scale_noswf_at_jpg
::if there is no hi-res swf; even if jpg is the standard book format, it could make sense to provide png or swf files for higher resolution pages!
::if /pages/page_h1.swf is found in subfolfer /pages, then swf images will be loaded at higher zoom scale
IF EXIST "%path_name%jpgpng/img_h1.png" ECHO		scale('%path_name%jpgpng/img_h{{num}}.png',%scale%); >> %mz3_name%
IF NOT EXIST "%path_name%jpgpng/img_h1.png" IF EXIST  "%book_name%/jpgpng/img_h1.jpg" ECHO		scale('%path_name%jpgpng/img_h{{num}}.jpg',%scale%); >> %mz3_name%

:do_print
IF [%echo_info%]==[1] ECHO do_print book_name %book_name%
IF NOT EXIST  "%book_name%/pages/page_h1.swf" GOTO print_no_hqswf
ECHO		print('%path_name%pages/page_h{{num}}.swf'); >> %mz3_name%
IF %echo_info%==1 ECHO created print_hq_swf
GOTO print_done

:print_no_hqswf
IF [%echo_info%]==[1] ECHO print_no_hqswf
IF NOT EXIST "%path_name%jpgpng/img_h1.png" GOTO print_no_hqpng
ECHO		print('%path_name%jpgpng/img_h{{num}}.png'); >> %mz3_name%
IF [%echo_info%]==[1] ECHO print_hq_png
GOTO print done

:print_no_hqpng
IF [%echo_info%]==[1] ECHO print_no_hqpng
IF NOT EXIST "%path_name%jpgpng/img_h1.jpg" GOTO print_no_hqjpg
IF [%echo_info%]==[1] ECHO print_h jpg
ECHO		print('%path_name%jpgpng/img_h{{num}}.jpg'); >> %mz3_name%
GOTO print_done

:print_lq_version
:print_no_hqjpg
IF [%echo_info%]==[1] ECHO  print_no_hq_jpg and print_lq_version
IF NOT EXIST  "%book_name%/pages/page_l1.swf" GOTO print_no_lqswf
ECHO		print('%path_name%pages/page_l{{num}}.swf'); >> %mz3_name%
IF [%echo_info%]==[1] ECHO created print_lq_swf
GOTO print_done

:print_no_lqswf
IF [%echo_info%]==[1] ECHO print_no_lq_swf 
IF NOT EXIST  "%book_name%/jpgpng/img_h{{num}}.png" GOTO print_no_lqpng
ECHO		print('%path_name%pages/pages_l{{num}}.png'); >> %mz3_name%
IF [%echo_info%]==[1] ECHO print_lqpng
GOTO print_done

:print_no_lqpng
IF [%echo_info%]==[1] ECHO print_no_lqpng
IF EXIST  "%book_name%/jpgpng/img_l{{num}}.jpg" ECHO		print('%path_name%pages/pages_l{{num}}.jpg'); >> %mz3_name%
:: if no better version than the previous checked one, ommit the print row

:print_done
IF [%echo_info%]==[1] ECHO print row created
ECHO		count(1,%pg_count%); >> %mz3_name%
ECHO		settings(%settings%)^"^> >> %mz3_name%
ECHO.
:: If book mark active, create 2 sample chapters
IF [%bookmark_title%]==[] GOTO no_additional_chapters

ECHO	^<^^!-- Example with several named chapters, and for an anchor on the last page --^> >> %mz3_name%
ECHO     ^<page bgcolor="#aabbcc" anchor="book_start"^> >> %mz3_name%
ECHO     ^<txt position="center middle" width="300" align="left" color="#333333" rasterize="false"^> >> %mz3_name%
ECHO     ^<content^>^<^^![CDATA[^<b^>Page in front of the book^^!^<br/^>Jump forward ^</b^> to page 10^<br/^>here the link is realized by area and the text is not rasterized]]^>^</content^> >> %mz3_name%
ECHO     ^</txt^> >> %mz3_name%
ECHO     ^<area url="anchor:10" width="300" height="60" position="center middle" overlay="color(0,0.5,0xee9900);border" /^> >> %mz3_name%		 
ECHO     ^</page^> >> %mz3_name%
ECHO     ^<page bgcolor="#ddeeff"/^> >> %mz3_name%
ECHO     ^</chapter^> >> %mz3_name%
ECHO     ^<^^!-- Example several named chapters and for an anchor on the last page --^> >> %mz3_name% 
ECHO     ^<chapter anchor="book_end" ^> >> %mz3_name% 
ECHO     ^<page bgcolor="#ffeeaa"^> >> %mz3_name% 
ECHO     ^<txt position="center" top="30" align="center" color="#111111" ^> >> %mz3_name% 
ECHO     ^<content^>^<^^![CDATA[^<b^>Jump back ^</b^> ^<i^>to^</i^> page 10^<br/^>here the link is realized by area and the text is rasterized by default]]^>^</content^> >> %mz3_name%
ECHO     ^</txt^> >> %mz3_name%
ECHO     ^<area url="anchor:10" width="300" height="80" position="center" top="30" overlay="color(0,0.3,0x669999);border" /^> >> %mz3_name%		 
ECHO     ^</page^> >> %mz3_name%
ECHO     ^<page bgcolor="#eeaa99"/^> >> %mz3_name% 
ECHO     ^</chapter ^> >> %mz3_name% 
ECHO     ^<^^!-- Example for an anchor on the last page --^> >> %mz3_name% 
ECHO     ^<chapter anchor="chapter4" ^> >> %mz3_name% 
ECHO     ^<page bgcolor="#eeffee"^> >> %mz3_name% 
ECHO     ^<txt position="center middle" width="400" align="center" selectable="true" color="#111111" overlay="color(0,0.1,0x333333);border(0,0.75,solid,0xFF0000,3)"^> >> %mz3_name% 
ECHO     ^<content^>^<^^![CDATA[^<b^>Jump back ^</b^> ^<i^>to^</i^> page 5^<br/^>^<br/^>This time using HTML reference and no area^<br/^> >> %mz3_name%
ECHO     ^<a href="javascript:MegaZine.gotoPage(5);" title="link set with htlm anchor"^>--- Which is possible because the text is set to selectable and therefore automatically ---^</a^> >> %mz3_name%
ECHO not rasterized.^<br/^> The link is active only within the ^<b^>---^</b^> signs^<br/^>All formatting is achieved with html features^<br/^>This does not work for an offline book (CD version)]]^>^</content^> >> %mz3_name%
ECHO     ^</txt^> >> %mz3_name%
ECHO     ^</page^> >> %mz3_name%
ECHO     ^<page bgcolor="#dddd99"/^> >> %mz3_name% 
ECHO     ^<page bgcolor="#ccffcc" anchor="last"/^> >> %mz3_name% 
ECHO     ^<page bgcolor="aaeecc"/^> >> %mz3_name% 

:no_additional_chapters
ECHO	^</chapter^> >> %mz3_name%


:: Write lead out to XML
ECHO ^</book^> >> %mz3_name%

:no_mz3_make_what

:: set path and file name for CD output
SET mz3_name=%book_name%_CD/megazine/megazine.mz3
SET path_name= 
Set search_path=

IF [%index%]==[a] IF NOT [%make_what%]==[c] ECHO Book %book_name%\megazine.mz3 is created
IF [%index%]==[b] ECHO Book_CD %book_name%_CD\megazine\megazine.mz3 is created
IF [%index%]==[b] SET index=c
IF [%index%]==[a] SET index=b

IF [%make_what%]==[m] SET index=c
:: skip building file for media
GOTO for_loop

:: End of FOR LOOP
:end_for_loop

:: all MZ3 files created
: mz3_created
IF NOT EXIST megazine\ GOTO no_start
ECHO.
IF [%make_what%]==[n] goto end


SET page_type=swf
IF %book_type%==png SET page_type=png
IF %book_type%==jpg SET page_type=jpg

ECHO Your book named %book_name% (with pages of tpye %page_type% )
IF [%make_what%]==[m] ECHO    will start by a call of index_%book_name%.html
IF [%make_what%]==[m] goto show_mz3_book
ECHO    will start out of the %book_name%_CD folder first when you hit any key.
ECHO The %book_name%_CD folder can be copied on any medium like a CD and should work immediately without problems,
ECHO    because a fully version of the MegaZine3 Software is included in that folder
ECHO.
SET index_n=%book_name%_CD\megazine\megazine.exe
PAUSE
START %index_n%
IF [%make_what%]==[c] goto end
ECHO.
ECHO ----------------------------------------
ECHO.
ECHO With the next hit of a key the version %vsersion_name% of your book will start
:show_mz3_book
ECHO This book shares one version of the MegaZine3 software together with other books, 
ECHO    and this only can work after you modified the FLASH security settings (FLASH sandbox problem). 
ECHO If you see empty, grey pages please read the tutorial at www.vservu.de/mz3-tut/index_tut-t1e.html or 
ECHO    in your local folder if you downloaded the complete tutorial package.
ECHO.

PAUSE
SET index_n=index_%book_name%.html
START %index_n%
ECHO.
ECHO -----------------------------------------
ECHO If you saw grey pages, please open the MZ3 console with a 
ECHO    right click into the book. Then hit the "#" key
ECHO 
ECHO In the Adobe window that opens you can change the setting and solve the problem
ECHO Alternatively to using the right click within the book page, you can go directly to this page:
ECHO http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager.html
ECHO.
ECHO In Global Security Settings you have to add the name of your base folder 
ECHO    to the trusted folders. The name of your base folder is:
ECHO.
ECHO ++++++++++++++++
ECHO "%cd% "
ECHO ++++++++++++++++
ECHO.
:no_start
ENDLOCAL
GOTO :end

:swftools
ECHO [EN - English]
ECHO.
ECHO This script requires the "pdf2swf" program from swftools.
ECHO See http://www.swftools.org/pdf2swf.html
ECHO.
ECHO If you do not have them installed, please download now and install.
ECHO Then change this file (open it with Notepad), by setting where
ECHO you installed it (default is C:\swftools, if you did not use a
ECHO custom path you do not need to change this file).
ECHO Look for the line
ECHO.
ECHO   SET PDF2SWF=%PDF2SWF%
ECHO.
ECHO and change the path to your installation location.
ECHO.
ECHO.
ECHO [DE - Deutsch]
ECHO.
ECHO Dieses Script benoetigt das "pdf2swf" Programm von swftools.
ECHO Siehe http://www.swftools.org/pdf2swf.html
ECHO.
ECHO Falls Sie diese nicht installiert haben, bitte laden Sie sie jetzt
ECHO herunter und installieren Sie sie. Oeffnen Sie dann diese Datei
ECHO (mit Notepad) und aendern Sie den Installationspfad (falls sie
ECHO in das Standardverzeichnis C:\swftools\ installieren brauchen Sie
ECHO hier nichts aendern). Suchen Sie dazu nach der Zeile
ECHO.
ECHO   SET PDF2SWF=%PDF2SWF%
ECHO.
ECHO und aendern Sie den Pfad so dass er auf ihr Installationsverzeichnis
ECHO verweist.
GOTO :end

:help
ECHO [EN - English]
ECHO.
ECHO How to use:
ECHO pdf2mz3.bat ["pdf file name without extension"] [numberofpages]
ECHO                  [pagewidth] [pageheight]
ECHO in folder pages/ the low and high resolution swf files are created, named page_ln and page_hn for low and high res pages 
ECHO with page numbers n=1-numberofpages (2nd parameter)
ECHO if pagewidth and pageheight are ommitted, as default pagewidth="816" and pageheight="1056" are used
ECHO.
ECHO First parameter  is the name of the pdf file; if omitted you will be asked to enter it
ECHO Second parameter  is the number of pages to extract from the source pdf document.
ECHO      If omitted it can be entered, or the default of 10 pages will be used.
ECHO Third and fourth  parameter are the target page width and height in pixels. Optional parameters
ECHO.
ECHO e.g.: pdf2mz3.bat 
ECHO.
ECHO This will produce 10 (or the entered number) swf files in the folder pdfname/pages/ with the
ECHO names page_l1.swf and page_h1.swf through page_l10.swf and page_h10.swf
ECHO.
ECHO Also note that in the folder pdfname/ a megazine.mz3 file is generated that
ECHO represents a book with the extracted pages. 
ECHO at the node whre this file is located an index file will be created named index_pdfname.html
ECHO.
ECHO [DE - Deutsch]
ECHO.
ECHO Benutzungshinweise:
ECHO pdf2mz3.bat ["pdfname.pdf"] [seitenzahl]
ECHO                  [seitenbreite] [seitenhoehe]
ECHO.
ECHO Der erste Parameter  ist Name PDF-Datei ohne Erweiterung (.pdf). Falls nicht vorhanden wird er abgefragt.
ECHO Der zweite Parameter ist die Anzahl der Seiten, die aus der Quell-PDF-Datei
ECHO     gelesen werden sollen. Falls nicht vorhanden, wird die Anzahl abgefragt. Bei einer leeren Eingabe wird 10 genommen
ECHO Der dritte und vierte Parameter gibt die Zielseitenbreite und -hoehe an. Falls nicht vorhanden/eingegeben, 
ECHO     werden die Voreinstellung 816*1056 genommen 
ECHO.
ECHO Bsp.: pdf2mz3.bat "MeinPDF" 12 
ECHO       oder auch nur pdf2mz3.bat bzw. Doppelklick auf die Datei.
ECHO.
ECHO Dies wuerde 12 SWF Seiten im Ordner pdfname/pages mit den Namen
ECHO page_l1.swf bzw. page_h1.swf bis inklusive page_l12.swf und page_h12.swf erzeugen.
ECHO.
ECHO Im Ordner pdfname/ wird eine megazine.mz3 Datei erzeugt, und im Basisverzeichnis 
ECHO eine Indexdatei mit dem Namen index_pdffile.html generiert.
ECHO.
GOTO :end

:end
PAUSE
EXIT