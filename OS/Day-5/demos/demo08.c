#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>

//Exec Family of Functions Example
//execv() function is used to execute a program. It replaces the current process image with a new process image. The new process image is loaded from the specified file and executed. The execv() function takes the following parameters:
//const char *path: This is the path to the executable file that you want to execute
//char *const argv[]: This is an array of pointers to strings that represent the arguments to pass to the executable file. The last element of the array must be NULL.
int main(void)
{
	int s;
	printf("program started !!!\n");
	int ret = fork();
	if(ret == 0)
	{
		// child
		//ls -l -i -a
		char *args[] = {"ls", "-l", "-i", "-a", NULL};
		execv("/usr/bin/ls", args);
		// If execv fails, it will not return
		perror("execv failed");
	}
	else
	{
		// parent
			wait(&s);
	}
	printf("program finished !!!\n");
	return 0;
}



