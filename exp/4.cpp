#include<cstdio>
#include<iostream>
#include<bits/stdc++.h>
#include<string>
using namespace std;
#define MOVE(x,i) (((x)<<(i))^(x>>(32-(i))) )
#define L1(x) ((x)^MOVE(x,2)^MOVE(x,10)^MOVE(x,18)^MOVE(x,24))  
#define L2(x) ((x)^MOVE(x,13)^MOVE(x,23))
#define SBOX(x) ((un int)(sbox[(x)&255])|(((un int)sbox[((x)>>8)&255])<<8)|(((un int)sbox[((x)>>16)&255])<<16)|(((un int)sbox[((x)>>24)&255])<<24))
#define un unsigned
int change(int x){
      int A1=0xA7;
      int flag;
      int result=0;
      int tem;
      int flag2;
      for(int i=0;i<8;i++){
          flag=(A1 & 0x80)>>7;
          tem=x & A1;
          flag2=0;
          for(int j=0;j<8;j++){
              flag2^=(tem & 1);
              tem>>=1;
          }
          result=result | (flag2<<i);
          A1=(A1<<1) | flag;
      }
      result^=0xd3;
      return result;
  }

int multiplication(int a,int b){ 
      int tem=0;
      int i=0;
      while(b){
          if(b&1){
              tem^=a<<i;
          }
          i++;
          b>>=1;
      }   
      return tem;
  }
int lengt(int x) 
{
	int sign=0,shift=0,sum=0;
	for(int i=4;i+1;--i)
	{
		sign=!!(x>>(1<<i));
		shift=sign<<i;
		x>>=shift;
		sum+=shift;
	}
	return sum;
}
void division(int a,int b,int* round,int* left){
      *round=0;
      *left=0;
      int distance;
      while(1){
          distance=lengt(a)-lengt(b);
          if(distance>=0 && a){ 
              a=a ^ (b<<distance);
              *round=(*round) | (1<<distance);
          }else{
              *left=a;
              break;
          }
      }   
  }
int inverse(int a,int b){
      int y2=0;
      int y1=1;
      int q,r,x,y;
      while(b){
          division(a,b,&q,&r);
          y=y2^multiplication(q,y1);
          a=b;
          b=r;
          y2=y1;
          y1=y;
      }
      return y2;
}
void swap(unsigned char* m,int a,int b)
{
	un char k=change(a);
	unsigned char tmp=m[b];
	m[a]=m[b];
	k=inverse(0x1f5,k);	
	m[b]=m[a];
	tmp=change(k);
	m[a]=tmp;
}
unsigned char* step1(char * key)
{
	unsigned char* s=new unsigned char[256];
	for(int i=0;i<256;i++)
	{
		s[i]=i;
	}
	int j=0;
	int len=strlen(key);
	for(int i=0;i<256;i++)
	{
		j=(j+s[i]+key[i%len])%256;
		swap(s,i,j);
	}
	return s;
}
void rot(char *t)
{
	
	t[3]^=t[0];
	t[1]^=t[2];
	t[0]^=t[3];
	t[2]^=t[1];
	t[3]^=t[0];
	t[1]^=t[2];
}
un int rk[5]={    3189850980, 496040354, 1262144242, 742873957, 2654435769};
void step3(int id,un char* sbox,un int* in, un int* key)
{
	un int ck=0;
	for(int i=0;i<4;i++)
	{
		ck<<=8;
		ck+=(((((id<<2)+i)<<3)-((id<<2)+i))%256);
		
	}
	key[id+4]=key[id]^L2(SBOX(key[id+3]^key[id+1]^key[id+2]^ck));
	in[id+4]=in[id]^L1(SBOX(in[id+1]^in[id+2]^in[id+3]^key[id+4]));
}
void step4(un int* in,un int* ans)
{
	ans[0]=in[35];
	ans[1]=in[34];
	ans[2]=in[33];
	ans[3]=in[32];
	ans[4]=0;
}
char* step2(char* in,char* ke)
{
	char* ans=new char[20]; 
	un char* sbox=step1(ke);
	for(int i=0;i<4;i++)
	{
		rot(in+4*i);
		rot(ke+4*i);
		*((un int*)ke+i)^=(rk[i]^rk[i+1]); 
	}
	int t=strlen(in);
	int i=0,j=0,k=0;
	un char tmp=0;
	un int *inp=(un int *)in;
	un int *kep=(un int *)ke;
	un int *ansp=(un int *)ans;
	for(;i<t;)
	{
		step3(i<<1,sbox,inp,kep);
		i=(i+1)%256;
        j=(j+sbox[i])%256;
		k=(sbox[i]+sbox[j])%256;
        ans[i]=in[i]^sbox[k];
        
        step3((i<<1)-1,sbox,inp,kep);
	}
	
	step4(inp,ansp);
	
	return ans;
}
//key:U'K_thi4_encrypt
//  m:trick_rc_real_sm 
char keys[500]="Welcome to HashCTF,I\'m sure U_Know_th4_crypt";
un char ans[100]={0xa8,0xba,0x54,0x4a,
			   0xcf,0xce,0xfa,0x59,
			   0xf5,0x63,0x48,0xb7,
			   0xc1,0x49,0x47,0x40};
int main()
{
	char* s=new char[400];
	printf("%s",keys);
	printf("\nplease input your flag:\n");
	scanf("%s",s);
	int l=strlen(s);
	if(lengt(l)==4)
	{
		char* t=step2(s,&keys[28]);
		delete [] s;
		l=strlen(t);
		if(lengt(l-1)==3)
		{
			for(int i=0;i<l;i++)
			{
				
				if((un char)t[i]!=ans[i])
				{
					delete [] t;
					goto end;
				}
				
			}
			delete [] t;
			printf("Congratulations! Flag is HashCTF{your input}\n");
			return 0;
		} 
	}
end:
	
	printf("wrong");
	return 0;
}

