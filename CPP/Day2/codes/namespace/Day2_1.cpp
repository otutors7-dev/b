#include<stdio.h>
int num1 = 10; // Program scope 
static int num2 = 20; // File scope 
class Test 
{
    int num3; // class scope 
}; 
namespace na
{
    int num4 = 10; // namespace scope 
}
int main()
{
    void print(int num1);// Function prototype scope  
    int num5 = 50; // Function scope 
    {
        int num6 = 60; // Block scope 
    }
    return 0;
}
