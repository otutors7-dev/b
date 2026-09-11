#include <stdio.h>
namespace na
{
    int num1 = 10;
}
using namespace na;
namespace ntest
{
    void printRecord(void)
    {
        // using namespace na;
        printf("num1 : %d\n", num1);
        // printf("num1 : %d\n",na::num1);
    }
    void showRecord(void)
    {
        // using namespace na;
        printf("num1 : %d\n", num1);
        // printf("num1 : %d\n",na::num1);
    }
    void displayRecord(void)
    {
        // using namespace na;
        printf("num1 : %d\n", num1);
        // printf("num1 : %d\n",na::num1);
    }
}
int main()
{
    using namespace ntest; 
    printRecord( ); 
    showRecord( ); 
    displayRecord( ); 
    return 0;
}

int main1()
{
    ntest::showRecord();
    ntest::printRecord();
    ntest::displayRecord();
    return 0;
}