#include<stdio.h> 
namespace na
{
    int num1 = 10; 
}
int num1 = 20; 
int main()
{
    using namespace na; 
    //printf("num1 : %d",num1); 
    printf("num1 : %d\n",na::num1); //10 
    printf("num1 : %d\n",::num1); //20  
    return 0;
}