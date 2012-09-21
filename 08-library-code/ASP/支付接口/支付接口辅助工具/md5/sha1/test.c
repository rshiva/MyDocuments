#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>

/*
Gen_MAC(unsigned short  status,
        unsigned char *msg_text,
		unsigned short msg_size,
		unsigned char *mac_text,
		unsigned char *save_buf);
unsigned char *SHA1(unsigned char *d,unsigned long n,unsigned char *md);
*/
int main()
{
	int rtn;
	unsigned char p_msg[100]="abcdefghijklmnopqrstuvwxyz";
	unsigned char key[16];
	unsigned char mac[8];
	unsigned char hash[20];
    
	memset(key,0x12,16); 
	rtn=Gen_MAC(4,p_msg,strlen(p_msg) ,mac,key);
	/*  ............  */
    
    SHA1(p_msg,strlen(p_msg),hash);
	return 0;
}