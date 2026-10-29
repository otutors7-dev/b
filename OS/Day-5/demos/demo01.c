#include<stdio.h>
#include<unistd.h>

int main(void)
{
	printf("program started !!!\n");
	fork(); // create a new process for calling fork()
	printf("program finished !!!\n");
	return 0;
}
/*

int main(void)
{
	printf("program started !!!\n");
	ret=fork();
	if(ret == 0 )
	{
		printf("child program !!!\n");
	}
	else
	{
		printf("parrent program !!!\n");
	}
	return 0;
}

*/