#include<stdio.h> 
namespace na
{
    int num1 = 10; 
}
using namespace na; 
void printRecord( void )
{   
    //using namespace na; 
    printf("num1 : %d\n",num1); 
    //printf("num1 : %d\n",na::num1); 
}
void showRecord( void )
{
    //using namespace na; 
    printf("num1 : %d\n",num1); 
    //printf("num1 : %d\n",na::num1); 
}
void displayRecord( void )
{
    //using namespace na; 
    printf("num1 : %d\n",num1); 
    //printf("num1 : %d\n",na::num1); 
}
int main()
{
    ::showRecord( ); 
    ::printRecord( ); 
    ::displayRecord( ); 
    return 0;
}
/*
namespace na
{
    int num1 = 10; 
}
void printRecord( void )
{
    printf("num1 : %d\n",na::num1); 
}
void showRecord( void )
{
    printf("num1 : %d\n",na::num1); 
}
void displayRecord( void )
{
    printf("num1 : %d\n",na::num1); 
}
int main()
{
    ::showRecord( ); 
    ::printRecord( ); 
    ::displayRecord( ); 
    return 0;
}
*/ 