#include<stdio.h> 
namespace na
{
    int num1 = 10; 
}
int main()
{
    int num1 = 20; 
    using namespace na; 
    printf("num1 : %d",num1); 
    return 0;
}
