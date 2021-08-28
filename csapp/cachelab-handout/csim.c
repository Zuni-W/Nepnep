#include "cachelab.h"
#include <getopt.h>
#include <stdio.h>
#include<stdlib.h>
int s,b,E;
char *file;
int m,h,e;
long long S,B;
int v;
unsigned long long cur=0;
long long Smask;

typedef struct {
	long long valid;
	long long tag;
	long long lru;
}cache_t;
cache_t **cache;

void printUsage(char **argv)
{
 	printf("Usage: %s [-hv] -s <num> -E <num> -b <num> -t <file>\n", *argv);
 	puts("Options:");
	puts("  -h         Print this help message.");
  	puts("  -v         Optional verbose flag.");
  	puts("  -s <num>   Number of set index bits.");
  	puts("  -E <num>   Number of lines per set.");
  	puts("  -b <num>   Number of block offset bits.");
  	puts("  -t <file>  Trace file.");
  	puts("\nExamples:");
  	printf("  linux>  %s -s 4 -E 1 -b 4 -t traces/yi.trace\n", *argv);
  	printf("  linux>  %s -v -s 8 -E 2 -b 4 -t traces/yi.trace\n", *argv);
  	exit(0);
}

void get_opt(int argc,char **argv,const char *shortopt)
{
	signed char c;
	while ( 1 )
	{
    	c = getopt(argc, (char *const *)argv,shortopt);
    	if ( c == -1 )
      		break;
    	switch ( c )
    	{
      		case 'E':
        	E = atoi(optarg);
        	break;
      		case 'b':
        	b = atoi(optarg);
        	break;
      		case 'h':
        	printUsage((char **)argv);
      		case 's':
        	s = atoi(optarg);
        	break;
      		case 't':
        	file = optarg;
        	break;
      		case 'v':
        	v = 1;
        	break;
      		default:
        	printUsage((char **)argv);
    	}
	}
	if ( s<=0 || !E || b<=0 || !file || s>63||b>63 )
	{
		printf("%s: Missing required command line argument\n", *argv);
		printUsage((char **)argv);
				  
	}
	S=1<<s;
	B=1<<b;
	Smask=S-1;
	return ;
}
void initcache()
{
	cache = malloc(8LL * S);
  	for (int i = 0; i < S; ++i  )
  	{
	     cache[i]= malloc(24LL * E);
		for (int  j = 0; j < E; ++j  )
		{
		    (cache[i][j].valid) = 0;
		    cache[i][j].tag = 0LL;
		    cache[i][j].lru = 0LL;
										    
	    }
				    
    }
	return;
}
void freecache()
{
	for(int i=0;i<S;++i)
		free(cache[i]);
	free(cache);
	return ;
}
void accessdata(long long addr)
{
	unsigned long long count=-1;
	unsigned long long tag=addr>>(b+s);
	cache_t *set=cache[(addr>>b)&Smask];
	unsigned long long i=0;
	unsigned long long eline=0;
	while(1)
	{
		if(i>=E)
		{
			++m;
			if(v)
			{
				printf("miss ");
			}
			for(int j=0;j<E;j++)
			{
				if(set[j].lru<count)
				{
					count=set[j].lru;
					eline=j;
				}
			}
				++e;
				if(v)
				{
					printf("eviction ");
	
				}
			set[eline].lru=(++cur);
			set[eline].tag=tag;
			return;
		}
		if(!set[i].valid)
		{
			++m;
			if(v)
			{
				printf("miss ");
			}
			set[i].valid=1;
			set[i].tag=tag;
			set[i].lru=(++cur);
			return;
		}
		if(set[i].valid&&set[i].tag==tag)
		{
			set[i].lru=(++cur);
			h++;
			if(v)
			{
				printf("hit ");
			}
			return;
		}
	++i;
	}
}

void replay(char* t)
{
	char buf[1000];
	unsigned long long addr=0;
	unsigned long long len=0;
	FILE *f;
	f=fopen(t,"r");
	if(!f)
	{
		printf("wrong file");
		exit(1);
	}
	while(fgets(buf,1000,f))
	{
		if(buf[1]=='M'||buf[1]=='S'||buf[1]=='L')
		{
			sscanf(&buf[3],"%llx,%llu",&addr,&len);
			if ( v )
			{
			 	printf("%c %llx,%llu ", (unsigned int)buf[1], addr, len);
			}
			accessdata(addr);
			if(buf[1]=='M')
			accessdata(addr);
			if(v)
			putchar('\n');
			      
		}
	}
	fclose(f);
}

int main(int argc,char **argv,char **envp)
{
	get_opt(argc,argv,"s:b:E:t:hv");
	
	initcache();
	replay(file);
	freecache();
    printSummary(h, m, e);


    return 0;
}
