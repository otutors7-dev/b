#include<stdio.h> 
void Swap(int *x , int *y)
{
    int temp = *x; 
    *x = *y; 
    *y = temp; 
}
int main()
{
    int a = 10 , b = 20; 
    printf("Before swap\n"); 
    printf("a : %d\n",a);
    printf("b : %d\n",b);
    Swap(&a,&b);  
    printf("After swap\n"); 
    printf("a : %d\n",a);
    printf("b : %d\n",b);
    return 0;
}
