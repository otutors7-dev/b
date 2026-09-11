#include<stdio.h> 
namespace na
{
    int num1 = 10; 
    int num2 = 20; 
}
namespace nb 
{
    int num1 = 30; 
    int num4 = 40; 
}
int main()
{
    printf("num1 : %d\n",na::num1);
    printf("num2 : %d\n",na::num2);
    printf("num3 : %d\n",nb::num1);
    printf("num4 : %d\n",nb::num4); 
    return 0;
}
