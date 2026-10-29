#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>

/*
Waitpid System Call Example
Syntax:
pid_t waitpid(pid_t pid, int *status, int options);
	where: pid is the process ID of the child process to wait for. 
	If pid is -1, waitpid() waits for any child process. 
	If pid is 0, waitpid() waits for any child process in the same process group as the calling process. 
	If pid is greater than 0, waitpid() waits for the child process with the specified process ID.
status:  is a pointer to an integer where the exit status of the child process will be stored. If status is NULL, no status information is returned.
options: is a bitwise OR of zero or more of the following flags:
	WNOHANG: If the specified child process has not yet terminated, waitpid() returns immediately with a return value of 0.
	WUNTRACED: If the specified child process has stopped due to a signal, waitpid() returns immediately with the process ID of the child.

	*/

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
				waitpid(ret, &s, 0);

			printf("parent : i = %d\n", i);
			sleep(1);
		}
		printf("parent : child process terminated [ID : %d] !!!\n", WEXITSTATUS(s));
	}
	printf("program finished !!!\n");
	return 0;
}



