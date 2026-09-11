#include<stdio.h> 
namespace na
{
    int num1 = 10; 
    void print( void )
    {
        printf("num1 : %d\n",num1); 
    }
    struct Point 
    {
        int xPos; 
        int yPos; 
        void printRecord( void )
        {
            printf("xPos : %d\n",xPos); 
            printf("yPos : %d\n",yPos); 
        }
    }; 
    namespace nb //nested namespace 
    {
        int num3 = 30; 
    }
}
int main()
{
    using namespace na; 
    struct Point pt1 = {10,20}; 
    pt1.printRecord( ); 
    print( ); 
    using namespace nb; 
    printf("num3 : %d",num3); 
    return 0;
}

int main1()
{
    na::print( ); 
    na::Point pt1 = {10,20} ; 
    pt1.printRecord( ); 
    printf("num3 : %d",na::nb::num3); 
    return 0;
}
