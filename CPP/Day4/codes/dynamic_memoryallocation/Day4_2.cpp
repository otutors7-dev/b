#include<iostream> 
using namespace std; 
int main()
{
    int **ptr = new int*[4]; 
    for(int index = 0 ; index < 4 ; index++)
      ptr[index] = new int[3]; 
    //ACCEPT , DISPLAY 
    for(int index = 0 ; index < 4 ; index++)
    {
        delete[] ptr[index]; 
        ptr[index] = NULL;  
    }
    delete[] ptr; 
    ptr = NULL; 
    return 0;
}
