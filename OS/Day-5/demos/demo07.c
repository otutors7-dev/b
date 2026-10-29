#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>

//Exec Family of Functions Example
//execl() function is used to execute a program. It replaces the current process image with a new process image. The new process image is loaded from the specified file and executed. The execl() function takes the following parameters:
//const char *path: This is the path to the executable file that you want to execute
//const char *arg0, const char *arg1, ...: These are the arguments to pass to the executable file. The last argument must be NULL.
//last argument must be NULL to indicate the end of the argument list. The first argument (arg0) is typically the name of the executable file itself, and subsequent arguments are passed to the program as command-line arguments.
int main(void)
{
	int s;
	printf("program started !!!\n");
	int ret = fork();
	if(ret == 0)
	{
		// child
		//ex : ls -l -i -a
		//syntax: int execl(const char *path, const char *arg0, ..., NULL);
		execl("/usr/bin/ls", "ls", "-l", "-i", "-a", NULL);
	}
	else
	{
		// parent
			wait(&s);
	}
	printf("program finished !!!\n");
	return 0;
}



