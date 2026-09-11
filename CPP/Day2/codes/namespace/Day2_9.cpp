#include<stdio.h> 
namespace na
{
    int num1 = 10; 
}
int main()
{
    //printf("num1 : %d",na::num1);
    //printf("num1 : %d",na::num1); 
    //printf("num1 : %d",na::num1);
    //printf("num1 : %d",na::num1);
    using namespace na; 
    printf("num1 : %d\n",num1); 
    printf("num1 : %d\n",num1); 
    printf("num1 : %d\n",num1); 

    return 0;
}
