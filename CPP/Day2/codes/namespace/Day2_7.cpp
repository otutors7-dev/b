#include<stdio.h> 
namespace na
{
    int num1 = 10; 
    int num2 = 20; 
}
namespace na 
{
    int num3 = 30; 
    int num4 = 40; 
}
int main()
{
    printf("num1 : %d\n",na::num1);
    printf("num2 : %d\n",na::num2);
    printf("num3 : %d\n",na::num3);
    printf("num4 : %d\n",na::num4); 
    return 0;
}
