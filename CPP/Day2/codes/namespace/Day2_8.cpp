#include<stdio.h> 
namespace na // Top level namespace 
{
    int num1 = 10; 
    namespace nb//nested namespace 
    {
        int num2 = 20; 
    }
}
int main()
{
    printf("num1 : %d",na::num1);
    printf("num1 : %d",na::nb::num2); 
    return 0;
}
