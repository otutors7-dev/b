#include<stdio.h> 
int num1 = 10; 
int main()
{
    int num2 = 20; 
    printf("num2 : %d\n",num2); // 20 
    printf("num1 : %d\n",::num1);//10 
    {
        int num1 = 30; 
        printf("num3 : %d\n",num1);//30
        printf("num3 : %d\n",::num1);//10 
    } 
    return 0;
}
