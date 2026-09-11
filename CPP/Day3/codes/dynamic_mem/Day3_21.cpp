#include <iostream>
#include <stdlib.h>
using namespace std;
int main()
{
    int **ptr = (int **)calloc(4, sizeof(int *));
    if (ptr != NULL)
    {
        // ptr[0] = (int*)calloc(3 , sizeof(int));
        // ptr[1] = (int*)calloc(3 , sizeof(int));
        // ptr[2] = (int*)calloc(3 , sizeof(int));
        // ptr[3] = (int*)calloc(3 , sizeof(int));
        for (int index = 0; index < 4; index++)
            ptr[index] = (int *)calloc(3, sizeof(int));
        for(int row = 0 ; row < 4 ; row++)
        {
            for(int col = 0 ; col < 3 ; col++)
            {
                cout<<"Enter ptr[" << row << "][" << col << "]"; 
                cin>>ptr[row][col]; 
            }
        }
        for(int row = 0 ; row < 4 ; row++)
        {
            for(int col = 0 ; col < 3 ; col++)
            {
                 cout<<ptr[row][col]<<" ";  
            }
            cout<<endl; 
        }
        for(int index = 0 ; index < 4 ; index++)
        {
               free(ptr[index]); 
               ptr[index] = NULL; 
        }
    }
    return 0;
}

int main4()
{
    // void * calloc(size_t, size_t)
    int *ptr = (int *)calloc(3, sizeof(int)); // 12 bytes
    if (ptr != NULL)
    {
        ptr[0] = 10;
        ptr[1] = 20;
        ptr[2] = 30;
        // ptr[3] = 40;
        // ptr[4] = 50;
        // void * realloc(void *, size_t)
        ptr = (int *)realloc(ptr, 5 * sizeof(int));
        if (ptr != NULL)
        {
            ptr[3] = 40;
            ptr[4] = 50;
            for (int index = 0; index < 5; index++)
                cout << ptr[index] << endl;
        }
        free(ptr);
        ptr = NULL;
    }
    else
        cout << "Memory allocation Failed" << endl;

    return 0;
}
int main3(int argc, char const *argv[])
{
    // void * calloc(size_t, size_t)
    int *ptr = (int *)calloc(4, sizeof(int)); // 16 bytes
    if (ptr != NULL)
    {
        ptr[0] = 10;
        ptr[1] = 20;
        ptr[2] = 30;
        ptr[3] = 40;
        for (int index = 0; index < 4; index++)
            cout << ptr[index] << endl;
        free(ptr);
        ptr = NULL;
    }
    return 0;
}

int main2()
{
    // void* malloc(size_t size);
    int *ptr = (int *)malloc(4 * sizeof(int)); // 16 bytes
    if (ptr != NULL)
    {
        ptr[0] = 10;
        ptr[1] = 20;
        ptr[2] = 30;
        ptr[3] = 40;
        for (int index = 0; index < 4; index++)
            cout << ptr[index] << endl;
        free(ptr);
        ptr = NULL;
    }
    return 0;
}
int main1()
{
    // void* malloc(size_t size);
    int *ptr = (int *)malloc(sizeof(int));
    if (ptr != NULL)
    {
        *ptr = 200;
        cout << "Value : " << *ptr << endl;
        free(ptr);
        ptr = NULL;
    }
    else
        cout << "Memory allocation failed";
    return 0;
}
