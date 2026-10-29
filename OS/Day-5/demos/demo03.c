#include<stdio.h>
#include<unistd.h>

//Orphaned Process Example
//Orphaned processes are those processes whose parent process has terminated 
//before them. When a parent process terminates, the orphaned child processes are
// adopted by the init process (process ID 1). 
int main(void)
{
	printf("program started !!!\n");
	int ret = fork();
	if(ret == 0)
	{
		// child
		for(int i = 0 ; i < 10 ; i++)
		{
			printf("child : i = %d\n", i);
			sleep(1);
		}
	}
	else
	{
		// parent
		for(int i = 5 ; i > 0 ; i--)
		{
			printf("parent : i = %d\n", i);
			sleep(1);
		}
	}
	printf("program finished !!!\n");
	return 0;
}



