#include <stdio.h>
#include <stdlib.h>
#include <memory.h> 
 
#define FIRST	1
#define MID		2
#define LAST	3
#define ONLY	4

#define SUCCESS 0
#define MAX_TEXT_LEN                2048 


unsigned char  g_tempenkey[128] ;

unsigned short    Gen_MAC(unsigned short  status,unsigned char *msg_text,unsigned short msg_size,
		unsigned char *mac_text,unsigned char *save_buf);

int generate_soft_mac_core(unsigned short c_status,unsigned char *msg_text,unsigned short msg_size,
				unsigned char *hash_text, unsigned short *hash_size,unsigned short *save_buf);

void gen_i_enkey(unsigned char *inkey, unsigned char *enkey_array);
void cip(unsigned char *indata, unsigned char *outdata, unsigned char *key);
int  ecb_mac_proc(unsigned char *indata1,unsigned short indata1_blk,
                  unsigned char *outMAC,unsigned char *key);
void idea_uchar_to_ushort(
    unsigned char* inData,
    unsigned int inDataSize,
    unsigned short* outData);
void idea_ushort_to_uchar(
    unsigned short* inData,
    unsigned int inDataSize,
    unsigned char* outData);
unsigned short mul(unsigned short a, unsigned short b);
 


 
/*********************
!!!!!!!!!!!!!
**********************/
void idea_uchar_to_ushort(
    unsigned char* inData,
    unsigned int inDataSize,
    unsigned short* outData)
{
    unsigned int i,j,k;

    j = inDataSize/2;
    k = 0;

    for(i=0;i<j;i++){
        outData[i] = inData[k]*256 + inData[k+1];
        k += 2;
    }

    return;
}

/***********************
!!!!!!!!!!!!!!!
***********************/

void idea_ushort_to_uchar(
    unsigned short* inData,
    unsigned int inDataSize,
    unsigned char* outData)
{
    unsigned int i,j,k;

    j = inDataSize;
    k = 0;

    for(i=0;i<j;i++){
        outData[k++] = (unsigned char)(inData[i]/256);
        outData[k++] = (unsigned char)inData[i];
    }

    return;
}

/*******************
!!!!!!!!!!!!!
*******************/
void gen_i_enkey(unsigned char *inkey, unsigned char *enkey_array)

{
    unsigned short t_inkey[8],t_enkey_array[56];
    short i,k;
    unsigned short *p;

        idea_uchar_to_ushort(inkey,16,t_inkey);
  
        k = 0;
        for(i=0;i<8;i++){
           t_enkey_array[k++] = t_inkey[i];
        }

        p = t_enkey_array;
        for(i=0;i<6;i++){
            t_enkey_array[k++] = (p[1] << 9) | (p[2] >> 7); /*  0 */
            t_enkey_array[k++] = (p[2] << 9) | (p[3] >> 7); /*  1 */
            t_enkey_array[k++] = (p[3] << 9) | (p[4] >> 7); /*  2 */
            t_enkey_array[k++] = (p[4] << 9) | (p[5] >> 7); /*  3 */
            t_enkey_array[k++] = (p[5] << 9) | (p[6] >> 7); /*  4 */
            t_enkey_array[k++] = (p[6] << 9) | (p[7] >> 7); /*  5 */
            t_enkey_array[k++] = (p[7] << 9) | (p[0] >> 7); /*  6 */
            t_enkey_array[k++] = (p[0] << 9) | (p[1] >> 7); /*  7 */
            p = p + 8;
        }

        idea_ushort_to_uchar(t_enkey_array,k,enkey_array);

        return;
}
 
 
/*********************
!!!!!!!!!!!!!!!!!!
**********************/
void cip(unsigned char *indata, unsigned char *outdata, unsigned char *key)
{
    unsigned short t_indata[4],t_outdata[4],t_key[64];
    unsigned short x1,x2,x3,x4,t1,t2,x5;
    unsigned short *p,i;

        idea_uchar_to_ushort(indata,8,t_indata);
        idea_uchar_to_ushort(outdata,8,t_outdata);
        idea_uchar_to_ushort(key,52+52,t_key);

        p = t_key;
        x1 = t_indata[0];
        x2 = t_indata[1];
        x3 = t_indata[2];
        x4 = t_indata[3];
        for(i=0;i<8;i++){
            x1 = mul(x1,p[0]);
            x2 = x2 + p[1];
            x3 = x3 + p[2];
            x4 = mul(x4,p[3]);
			x5=x1^x3;
            t2 = mul(x5,p[4]);
            t1 = t2 + (x2^x4);
            t1 = mul(t1,p[5]);
            t2 = t1 + t2;
            x1 = x1 ^ t1;
            x4 = x4 ^ t2;

            t2 = t2 ^ x2;
            x2 = x3 ^ t1;
            x3 = t2;

            p = p + 6;
        }

        t_outdata[0] = mul(x1,p[0]);
        t_outdata[1] = x3 + p[1];
        t_outdata[2] = x2 + p[2];
        t_outdata[3] = mul(x4,p[3]);

        idea_ushort_to_uchar(t_outdata,4,outdata);

        return;
}

unsigned short mul(unsigned short a, unsigned short b)
{
    unsigned long lx;
    unsigned short low,high,x;

        if(a){
            if(b){
                lx = a;
                lx = lx*b;
		        low = (unsigned short)lx;
		        high = (unsigned short)(lx >>16);
                x = low - high;
                if(low < high){
                    x++;
                }
                return (unsigned short)x;
            }
            else{
                return (unsigned short)(1-a);
            }
        }
        else{
            return (unsigned short)(1-b);
        }
}
/********************
!!!!!!!!!!!!!
**********************/
int  ecb_mac_proc(unsigned char *indata1,unsigned short indata1_blk,
                  unsigned char *outMAC,unsigned char *key)
{
    unsigned short i,j,k;
    unsigned short tbuf[4],tbuf2[4];
    unsigned char  *inp;

        gen_i_enkey(key, g_tempenkey);

        inp = indata1;

        idea_uchar_to_ushort(outMAC,8,tbuf);
 
        j = indata1_blk;
        for(i=0;i<j;i++){
            idea_uchar_to_ushort(inp,8,tbuf2);
            for(k=0;k<4;k++){
                tbuf[k] ^= tbuf2[k];
            }
            cip((unsigned char*)tbuf, (unsigned char*)tbuf, g_tempenkey);
            inp = inp + 8;
        }

        idea_ushort_to_uchar(tbuf,4,outMAC);

        return 0;
}
 


/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*  Gen_MAC   !!!!!!!!!!!
*  return : 0 --- success, else --- failure
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
unsigned short Gen_MAC(
	unsigned short  status,
	unsigned char *msg_text,
	unsigned short msg_size,
	unsigned char *mac_text,
	unsigned char *key)   /* 16 unsigned chars */
{
	 
	unsigned char    ret_val;
	unsigned short     o_len;
	 
	 
	unsigned short    hashormac = 2;
 

	if((status == MID) || (status == FIRST)) {
		if(msg_size != 2*MAX_TEXT_LEN) {
			return 0xc8;
		}
	}
	if((status == LAST) || (status == ONLY)) {
		if(msg_size > 2*MAX_TEXT_LEN) {
			return 0xc4;
		}
	}

	if((ret_val = generate_soft_mac_core(status,msg_text,
			msg_size,mac_text,&o_len,(unsigned short *)key)) !=0) {
	return ret_val;
	}
	return(0);
}



 
/*************************** 
!!!!!!!!!!!!!!!
/****************************/
int generate_soft_mac_core(unsigned short c_status,unsigned char *msg_text,unsigned short msg_size,
				unsigned char *hash_text, unsigned short *hash_size,unsigned short *save_buf)
{
	unsigned short    *inbuf;
 	int     i;
	unsigned short    *word_point, cfb_block=8;

	int pad_bytes,pad_zero_no;
	int first_sndword,tail_bytes,indata_len;
	unsigned char  last8bytes[100];
	unsigned short kd_buf[64];
	unsigned short *static_inbuf;
	static_inbuf=(unsigned short*)malloc(5100);
        inbuf = static_inbuf;
	 
    memcpy(kd_buf,save_buf,64);
	
	switch(c_status) {
	    case 1:
		if(msg_size != (MAX_TEXT_LEN + MAX_TEXT_LEN)) {
			free(static_inbuf);
			return(0xc3);
		}
		memset(save_buf+32,0,64);
		ecb_mac_proc((unsigned char*)msg_text,(unsigned short)(MAX_TEXT_LEN/4),
                  (unsigned char*)(save_buf+32),(unsigned char*)(kd_buf+8));
		break;

	    case 2:
		if(msg_size != (MAX_TEXT_LEN + MAX_TEXT_LEN)) {
			free(static_inbuf);
			return(0xc3);
		}
		ecb_mac_proc((unsigned char*)msg_text,(unsigned short)(MAX_TEXT_LEN/4),
            (unsigned char*)(save_buf+32),(unsigned char*)(kd_buf+8));

		break;

	    case 3:
		if(msg_size > (MAX_TEXT_LEN + MAX_TEXT_LEN)) {
			free(static_inbuf);
			return(0xc4);
		}
		cfb_block = 8;
                memcpy(hash_text,save_buf+32,8);
		pad_bytes = cfb_block - (msg_size % cfb_block);
		pad_zero_no = pad_bytes - 1;

		tail_bytes = msg_size;
		first_sndword = tail_bytes >> 1;

		inbuf[0]=1+((tail_bytes+pad_bytes) >>1);
		word_point = (unsigned short *)msg_text;
		for(i=0;i<first_sndword;i++)
			inbuf[i+2] = word_point[i];

		if((tail_bytes % 2) ==1) {
			last8bytes[0]=msg_text[msg_size - 1];
			last8bytes[1]=1;
			for(i=0;i<pad_zero_no;i++)
				last8bytes[i+2]=0;
		}
		else {
			last8bytes[0]=1;
			for(i=0;i<pad_zero_no;i++)
				last8bytes[i+1]=0;
		}

		indata_len=(pad_bytes+1) >> 1;
		word_point = (unsigned short *)last8bytes;
		for(i=0;i<indata_len;i++)
			inbuf[i+2+first_sndword] = word_point[i];
		ecb_mac_proc((unsigned char*)&inbuf[2],(unsigned short)((inbuf[0]-1)/4),
              (unsigned char*)hash_text,(unsigned char*)(kd_buf+8));

		break;

	    case 4:
		if(msg_size > (MAX_TEXT_LEN + MAX_TEXT_LEN)) {
			free(static_inbuf);
			return(0xc4);
		}
		
		cfb_block = 8;
		memset(hash_text,0,8);
		pad_bytes = cfb_block - (msg_size % cfb_block);
		pad_zero_no = pad_bytes - 1;

		tail_bytes = msg_size;
		first_sndword=tail_bytes >> 1;

		inbuf[0]=1+((tail_bytes + pad_bytes) >>1);
		
		word_point = (unsigned short *)msg_text;
		for(i=0;i<first_sndword;i++)
			inbuf[i+2] = word_point[i];

		if((tail_bytes % 2) ==1) {
			last8bytes[0]=msg_text[msg_size - 1];
			last8bytes[1]=1;
			for(i=0;i<pad_zero_no;i++)
				last8bytes[i+2]=0;
		}
		else {
			last8bytes[0]=1;
			for(i=0;i<pad_zero_no;i++)
				last8bytes[i+1]=0;
		}

		indata_len=(pad_bytes+1) >> 1;
		word_point = (unsigned short *)last8bytes;
		for(i=0;i<indata_len;i++)
			inbuf[i+2+first_sndword] = word_point[i];

		ecb_mac_proc((unsigned char*)&inbuf[2],(unsigned short)((inbuf[0]-1)/4),
              (unsigned char*)hash_text,(unsigned char*)(kd_buf+8));
		break;
	    default:
			free(static_inbuf);
		return(0Xff);
	}
	free(static_inbuf);
	return 0;
}

 
 
 
