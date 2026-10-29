#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>

//Wait System Call Example
//Syntax:
//int wait(int *status);
//    where: status is a pointer to an integer where the exit status of the child process will be stored. If status is NULL, no status information is returned.
//The wait() system call suspends execution of the calling process until one of its children terminates. If a child has already terminated by the time of the call, 
//then the function returns immediately. The status argument is a pointer to an integer where the exit status of the child process will be stored. If status is NULL, 
//no status information is returned. The return value of wait() is the process ID of the terminated child, or -1 if an error occurred.
//Parent waits for child to terminate
//before continuing its execution

int main(void)
{
	int s;
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
		for(int i = 20 ; i > 0 ; i--)
		{
			if(i == 10)
				wait(&s);
			printf("parent : i = %d\n", i);
			sleep(1);
		}
		printf("parent : child process terminated [ID : %d] !!!\n", WEXITSTATUS(s));
	}
	printf("program finished !!!\n");
	return 0;
}



