#include<iostream> 
using namespace std; 
class Student 
{
    private: 
    string name; 
    int roll;
    double marks;  
    public: 
    Student( void ) : name("") , roll(0) , marks(0.0)
    {   }
    Student(string name , int roll, double marks) : name(name) , roll(roll) , marks(marks)
    {   }
    void printRecord( void )
    {
        cout<<"Name : "<<name<<endl;
        cout<<"Roll : "<<roll<<endl;
        cout<<"Marks : "<<marks<<endl;  
    }
}; 
int main()
{
    Student **arr = new Student*[2]; 
    arr[0] = new Student("Rahul",1,1000.00);
    arr[1] = new Student("Sandeep",2,2000.00);
    for(int index = 0 ; index < 2 ; index++)
    {
        arr[index]->printRecord( ); 
    }
    for(int index = 0 ; index < 2 ; index++)
    {
        delete[] arr[index];
        arr[index] = NULL;  
    }
    delete[] arr; 
    arr = NULL; 
    return 0;
}

int main3()
{
    Student *arr = new Student[2]; 
    arr[0] = Student("Rahul",1,1000.00);
    arr[1] = Student("Sandeep",2,2000.00);
    for(int index = 0 ; index < 2 ; index++)
       arr[index].printRecord( ); 
    delete[] arr; 
    arr = NULL;  
    return 0;
}

int main2()
{
    Student *arr[2]; 
    arr[0] = new Student("Rahul",1,1000.00);
    arr[1] = new Student("Sandeep",2,2000.00);
    for(int index = 0 ; index < 2 ; index++)
      arr[index]->printRecord( ); 
    for(int index = 0 ; index < 2 ; index++)
    {
        delete arr[index]; 
        arr[index] = NULL; 
    } 
    return 0;
}

int main1()
{
    Student arr[2]; // array of objects 
    arr[0] = Student("Rahul",1,1000.00);
    arr[1] = Student("Sandeep",2,2000.00); 
    for(int index = 0 ; index < 2 ; index++)
       arr[index].printRecord( ); 
    return 0;
}
