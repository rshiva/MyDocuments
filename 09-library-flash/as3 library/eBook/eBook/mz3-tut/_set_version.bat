@echo off
:: Version 1.8.6, April 16, 2010 Hans and Florian Nuecke
:: 
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO This little command file asks for the book name, a version name and the page count.
ECHO You should have created a corresponding _set_param_version command file before, 
ECHO    or you can use this command file to create it for you. Then you should call this routine again after you made your modifications
ECHO In case a _set_param file with the version name added to the name is not found,
ECHO    such file is created with a copy of _set_param.bat 
ECHO.
ECHO This helps to easily create different versions of books out of the same PDF file, 
ECHO using different sets of paramters (configured in the related _set_parm.nat file.
ECHO.
ECHO Parameters that can be provided: %1:book_name %2:version_name %3:page_count %4:make_pg %5:make_what
ECHO Example: if you entered "demo" as book name and then set version to 1,
ECHO          a book named demo_1 using _set_param_1.bat will be created
ECHO.
ECHO If you not already did create a _set_param_1.bat with modified parameters,
ECHO the _set_param.bat file will be used to created a file _set_param_1.bat
ECHO.
ECHO If you then call this file with either "_set_version.bat test 1 6"
ECHO     or enter test (for book name), 1 (for version name) and 6 (for page count)
ECHO a book named test_1 will be created, using pdf file test.pdf and _set_param_1.bat
ECHO.
ECHO If you enter "n" (for "no") as version name, no version name will be attached
ECHO and the standard _set_param.bat command file will be called
ECHO.
:: If you want to display more details, SET echo_info==1
SET echo_info=0

:: book_name
SET book_name==demo

:: version name; will be appended to book name. Example demo_test with book_name=demo and version_name=test
SET version_name=n

:: page count of the book
SET page_count=4

:: make_pg defines if pages will be converted out of a PDF file; if set to no, there is no need for a PDF file
SET make_pg=y

:: make_what; defines what will be created with _pdf2mz3
:: options: 
::    m: mz3 files and index file and book folders
::    c: only the CD (media) folders; the books folders must exist already!
::    b: both; all files and folders will be created; best option for starting from scratch
::    n: nothing; no folders or files are created; only the pages are converted if and only if make_pg is not set to "n"
SET make_what=b


IF EXIST %1 SET book_name=%1
IF EXIST %2 SET version_name=%2
IF EXIST %3 SET page_count=%3
IF EXIST %4 SET make_pg=%4
IF EXIST %5 SET make_what=%5
IF [%echo_info%]==[1]  ECHO book %book_name%, version %version_name%, page count %page_count%, make pages %make_pg%, make what %make_what%

IF EXIST %1 goto chk_2
SET /p h_book="what is the name of your book (def: %book_name%), *** no spaces *** ? "
IF NOT [%h_book%]==[] SET book_name="%h_book%"

:chk_2
IF EXIST %2 goto chk_3
SET /p h_version="name of version? (if n, then no separate version;  def: n)?  "
IF NOT [%h_version%]==[] SET version_name=%h_version%

:chk_3
IF EXIST %3 GOTO chk_4
SET /p h_pages="how many pages does your pdf file have (def: 4)? "
IF NOT [%h_pages%]==[] SET page_count=%h_pages%

:chk_4
IF EXIST %4 GOTO chk_5
SET /p h_pages="do you want to convert pdf pages (def: y)? "
IF NOT [%h_pages%]==[] SET make_pg=%h_pages%

:chk_5
IF EXIST %5 GOTO end_chk
SET /p h_what="what to create? (m:mz3 c:CD b:both n:nothing;  def: b)? "
IF NOT [%h_what%]==[] SET make_what=%h_what%

:end_chk
IF [%echo_info%]==[1]  ECHO book %book_name%, version %version_name%, page count %page_count%, make pages %make_pg%, make what %make_what%
IF [%echo_info%]==[1]  PAUSE

IF [%version_name%]==[n] GOTO std_version
IF NOT EXIST _set_param_%version_name%.bat COPY _set_param.bat _set_param_%version_name%.bat

ECHO Start creating %book%_%version_name% with %page_count% pages

START _set_param_%version_name%.bat %book_name% %page_count% %version_name% %make_pg% %make_what%
GOTo :end

:std_version
IF [%version_name%]==[n] ECHO Start creating %book_name% with %page_count% pages
IF [%version_name%]==[n] START _set_param.bat %book_name% %page_count% %version_name% %make_pg% %make_what%

:end
ENDLOCAL
EXIT
