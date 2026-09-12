#include<iostream> 
using namespace std; 
class Outer 
{
    private: 
    int num1; 
    static int num2; 
    public: 
    class Inner
    {
        private: 
        int num3; 
        static int num4;
        public: 
        Inner( void ) : num3(30)
        {   } 
        friend class Outer; 
    }; //end of inner class 
    public: 
    Outer( void ) : num1(10)
    {   }
    void printRecord( void )
    {
        Outer::Inner inObj; 
        cout<<"num1 : "<<this->num1<<endl; 
        cout<<"num2 : "<<Outer::num2<<endl;
        cout<<"num3 : "<<inObj.num3<<endl; 
        cout<<"num4 : "<<Outer::Inner::num4<<endl; 
        
    }
}; //end of outer class 
int Outer :: num2 = 20; 
int Outer :: Inner :: num4 = 40; 
int main()
{
    Outer outObj; 
    outObj.printRecord( ); 
    return 0;
}
