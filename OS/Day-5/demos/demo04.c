#include<stdio.h>
#include<unistd.h>

//Zombie Process Example
/*
Zombie processes are those processes that have completed execution but still 
have an entry in the process table.
Cmd: ps -e -o pid,ppid,state,cmd
*/

int main(void)
{
	printf("program started !!!\n");
	int ret = fork();
	if(ret == 0)
	{
		// child
		for(int i = 0 ; i < 5 ; i++)
		{
			printf("child : i = %d\n", i);
			sleep(1);
		}
	}
	else
	{
		// parent
		for(int i = 10 ; i > 0 ; i--)
		{
			printf("parent : i = %d\n", i);
			sleep(1);
		}
	}
	printf("program finished !!!\n");
	return 0;
}



