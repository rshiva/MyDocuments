/**********************************************************************
 * $Workfile: MAIN.CPP $
 * $Revision: $
 *  $Modtime: $
 *
 * PURPOSE:
 * MD5 Example test application.
 * 
 * COPYRIGHT:
 * Copyright (c) 1995, 1996, 1997 Barrett Davis, All rights reserved.
 * This source code and the binaries that result may be freely distributed,
 * used and modified as long as the above copyright notice remains intact.
 * 
 * WARRANTY:
 * The author of main.cpp (hereafter referred to as "the author") makes no
 * warranty of any kind, expressed or implied, including without limitation, 
 * any warranties of merchantability and/or fitness for a particular purpose.
 * The author shall not be liable for any damages, whether direct, indirect,
 * special, or consequential arising from a failure of this program to 
 * operate in the manner desired by the user.  The author shall not be liable
 * for any damage to data or property which may be caused directly or 
 * indirectly by use of the program.
 *
 * In no event will the author be liable to the user for any damages,
 * including any lost profits, lost savings, or other incidental or 
 * consequential damages arising out of the use or inability to use the 
 * program, or for any claim by any other party.
 *************************************************************************/
#include "string.h"     // Needed for strlen().
#include "md5.h"        // MD5 message digest classes.
#include <iomanip.h>    // Stream manipulation methods.

const char VERSION[] = "3.00";   // Application version number.

int md5String( const char *inputString, unsigned char *buffer, int bufferLength );

// Simple test data to run through the MD5 algorithm.  
const char data0[] = "a";
const char data1[] = "abc";
const char data2[] = "message digest";
const char data3[] = "abcdefghijklmnopqrstuvwxyz";
const char data4[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
const char data5[] = "12345678901234567890123456789012345678901234567890123456789012345678901234567890";
const char data6[] = "Test data";
const char data7[] = "Jabberwocky by Lewis Carroll\n"
                      "\n"
                      "'Twas brillig, and the slithy toves\n"
                      "  Did gyre and gimble in the wabe:\n"
                      "All mimst were the borogroves,\n"
                      "  And the mome raths outgrabe.\n"
                      "\n"
                      "\"Beware the Jabberwock, my son!\n"
                      "  The jaws that bite, the claws that catch!\n"
                      "Beware the Jubjub bird, and shun\n"
                      "  The frumious Bandersnatch!\"\n"
                      "\n"
                      "He took his vorpal sword in hand:\n"
                      "  Long time the manxome fow he sought--\n"
                      "So he rested by the Tumtum tree,\n"
                      "  And stood awhile in thought.\n"
                      "\n"
                      "And, as in uffish thought he stood,\n"
                      "  The Jabberwock, with eyes of flame,\n"
                      "And whiffling through the tulgey wood,\n"
                      "  And burbled as it came!\n"
                      "\n"
                      "One, two! One, two! And through and through\n"
                      "  The vorpal blade went snicker - snack!\n"
                      "He left it dead, and with its head\n"
                      "  He went galumphing back.\n"
                      "\n"
                      "And hast thou slain the Jabberwock?\n"
                      "  Come to my arms by beamish boy!\n"
                      "O frabious day! Callooh! Callay!\n"
                      "  He chortled in his joy.\n"
                      "\n"
                      "'Twas brillig, and the slithy toves\n"
                      "  Did gyre and gimble in the wabe:\n"
                      "All mimsy were the borogroves,\n"
                      "  And the mome raths outgrabe.\n"
                      "\n";

void
describe( void )
{
   cout << "MD5 test application version " << VERSION << ".\n";
   return;
}

void
reportDigest( md5 &hash, const char *name )
{
   // Note that reading the digest from a MD5 object, clears the MD5
   // object state.  Extracting the digest changes the MD5 object state.
   md5Digest digest;
   hash.report( digest );       // Extract digest.

   // Here we stream the data for display.
   // Note that we run the risk of streaming unprintable characters here.
   cout << "Digest for " << name << " = " << digest << "\n"; 

   // Manipulate the digest result as if the digest were an array.
   int data[ MD5_DIGEST_LENGTH ];
   int ii;
   for( ii = 0; ii < MD5_DIGEST_LENGTH; ii++ ) {   // We can copy the result.
      data[ii] = digest[ii];       // Note we promote from uchar to int here.
   }
   // Output the digest as hex values:
   cout << hex << "      hex values = ";  // Set the integer base to HEX.
   cout.fill( '0' );                      // Set fill character to '0'.
   for( ii = 0; ii < MD5_DIGEST_LENGTH; ii++ ) {   
      cout << setw(2) << data[ii] << "."; // Set minimum width to 2.
   }
   cout << "\n\n";
   return; 
}

void
reportBuffer( const unsigned char *buffer, int length )
{
   if( buffer == 0 || length < 1 ) {
      return;
   }
   cout << hex << "buffer = ";
   cout.fill( '0' );            
   for( int ii = 0; ii < length; ii++ ) {   
      cout << setw(2) << (int)( buffer[ii] & 0x00FF ) << "."; 
   }
   cout << "\n";
   return;
}

   
void
test1( void )
{
   md5       hash;      // Create a MD5 object.

   cout << "Starting test 1\n";

   cout << "\nExamine the data strings one at a time\n";
   hash.update( data0, strlen( data0 ));     // Process data 0 string.
   reportDigest( hash, "data0" );            // Extract digest and report.

   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data1, strlen( data1 ));     // Process data1 string
   reportDigest( hash, "data1" );
   
   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data2, strlen( data2 ));     // Process data2 string.
   reportDigest( hash, "data2" );

   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data3, strlen( data3 ));     // Process data3 string.
   reportDigest( hash, "data3" );

   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data4, strlen( data4 ));     // Process data4 string.
   reportDigest( hash, "data4" );

   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data5, strlen( data5 ));     // Process data5 string.
   reportDigest( hash, "data5" );

   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data6, strlen( data6 ));     // Process data6 string.
   reportDigest( hash, "data6" );

   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data7, strlen( data7 ));     // Process data7 string.
   reportDigest( hash, "data7" );

   cout << "\nExamine the data strings together\n";
   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data0, strlen( data0 ));     // data 0.
   hash.update( data1, strlen( data1 ));     // data 1.
   hash.update( data2, strlen( data2 ));     // data 2.
   hash.update( data3, strlen( data3 ));     // data 3.
   hash.update( data4, strlen( data4 ));     // data 4.
   hash.update( data5, strlen( data5 ));     // data 5.
   hash.update( data6, strlen( data6 ));     // data 6.
   hash.update( data7, strlen( data7 ));     // data 7.
   reportDigest( hash, "all data forward " );

   hash.init();                              // Reinitialize MD5 for new data.
   hash.update( data7, strlen( data7 ));     // data 7.
   hash.update( data6, strlen( data6 ));     // data 6.
   hash.update( data5, strlen( data5 ));     // data 5.
   hash.update( data4, strlen( data4 ));     // data 4.
   hash.update( data3, strlen( data3 ));     // data 3.
   hash.update( data2, strlen( data2 ));     // data 2.
   hash.update( data1, strlen( data1 ));     // data 1.
   hash.update( data0, strlen( data0 ));     // data 0.
   reportDigest( hash, "all data backward" );

   cout << "\nExamine the progression of a digest in a loop of one string.\n";
   for( int ii = 0; ii < 4; ii++ ) {
      hash.init();                           // Reinitialize MD5 for new data.
      for( int jj = 0; jj <= ii; jj++ ) {
         hash.update( data7, strlen( data7 ));  // Process the string.
      }
      cout << "Loop " << ii << ": ";
      reportDigest( hash, "data7 in a loop" );   // Resets MD5 object.
   }
   cout << "Test 1 complete.\n";
   return;
}

void
test2( void )
{
   cout << "\nStarting test 2\n";

   unsigned char buffer[ MD5_DIGEST_LENGTH ];

   if( md5String( data0, buffer, MD5_DIGEST_LENGTH )) {
      reportBuffer( buffer, MD5_DIGEST_LENGTH );
   }
   if( md5String( data1, buffer, MD5_DIGEST_LENGTH )) {
      reportBuffer( buffer, MD5_DIGEST_LENGTH );
   }
   if( md5String( data2, buffer, MD5_DIGEST_LENGTH )) {
      reportBuffer( buffer, MD5_DIGEST_LENGTH );
   }
   if( md5String( data3, buffer, MD5_DIGEST_LENGTH )) {
      reportBuffer( buffer, MD5_DIGEST_LENGTH );
   }
   if( md5String( data4, buffer, MD5_DIGEST_LENGTH )) {
      reportBuffer( buffer, MD5_DIGEST_LENGTH );
   }
   if( md5String( data5, buffer, MD5_DIGEST_LENGTH )) {
      reportBuffer( buffer, MD5_DIGEST_LENGTH );
   }
   if( md5String( data6, buffer, MD5_DIGEST_LENGTH )) {
      reportBuffer( buffer, MD5_DIGEST_LENGTH );
   }
   if( md5String( data7, buffer, MD5_DIGEST_LENGTH )) {
      reportBuffer( buffer, MD5_DIGEST_LENGTH );
   }
   cout << "Test 2 complete.\n";   
   return;
}

int
md5String( const char *inputString, unsigned char *buffer, int bufferLength )
{  // ------------------------------------------------------------------
   // Generate the MD5 digest of the input string.
   // The string is assumed to be null terminated.
   // The digest is expected to be at least 16 bytes long.
   // This function returns 0 for error, or 1 for success.
   // ------------------------------------------------------------------
   if( inputString == 0 || inputString[0] == 0 || 
       buffer == 0 || bufferLength < MD5_DIGEST_LENGTH ) {
      return 0;   // Bad input paramters.
   }
   size_t stringLength = strlen( inputString );

   md5 hash;                              // Create a MD5 object.
   hash.update( inputString, stringLength );   // Process the string.
   
   md5Digest digest;
   hash.report( digest );                 // Extract digest.

   for( int ii = 0; ii < MD5_DIGEST_LENGTH; ii++ ) {
      buffer[ii] = digest[ii];
   }
   return 1;      // Success.   
}

int
main( void )
{
   describe();
   test1();
   test2();
   return 0;
}


