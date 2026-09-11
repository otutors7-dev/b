#include<iostream>
using namespace std; 
class Chair 
{
    private: 
    int height; // instance variable  
    int weight; // instance variable  
    static int price; //classlevel variable 
    public: 
    Chair( void ) : height( 0 ) , weight( 0 )
    {   }
    Chair(int height , int weight ) : height(height) , weight(weight)
    {   }
    void setHeight(int height)
    {
        this->height = height; 
    }
    int getWeight( void )  
    {
        return this->weight; 
    }
    int getHeight( void ) 
    {
        return this->height; 
    }
    void setWeight(int weight)
    {
        this->weight = weight; 
    }
    static void setPrice(int price) 
    {
        Chair::price = price; 
    }
    static int getPrice( void )
    {
        return Chair::price; 
    }
    void printRecord( void )
    {
        cout<<"Height : "<<this->height<<endl;
        cout<<"Weight : "<<this->weight<<endl;
        cout<<"Price : "<<Chair::price<<endl;  
    }
}; 
int Chair :: price = 1000; 
int main()
{
    Chair c1(10,20);
    Chair c2(30,40);
    c1.printRecord( );
    c2.printRecord( );
    return 0;
}
