//	Rune Studios Game Saver - Flash Version
//	Author: Green
//	April 25, 2000

/*	Flash is able to read data in from text files, but not write to them.
	This is a problem when making games in Flash, because you can not save
	information into a file to load again later.  To solve this problem
	we create a work around in Flash using the "Exec" command.  We run
	a sepereate program that can save our data for us, bypassing Flash's
	inabilities        																	  		*/

/*	This file is distributed so other programmers can modify it to fit
	their needs.  																					*/



//libraries
#include <fstream.h>								//write data to a text file


//main function
void main(int argc, char *argv[], char *envp[])
{
   //local data
	ofstream out_file;

   //create the file we need to put the data into
   out_file.open("save.txt");

   //write the first variable read in to the text file
	for(int count = 1; count < 2; count++)
   {
      out_file<<"variable" <<count <<"=" <<argv[count];
   }

   //write all other variable after the first to the text file
   for (int count = 2; count <argc; count++)
   {
   	out_file<<"&variable" <<count <<"=" <<argv[count];
   }
}
