#include <iostream>
using namespace std;
// Menu-Driven code  with 2 different pointers Book and Tape 
class Product
{
private:
    string title;
    double price;

public:
    Product(void) : title(""), price(0.0)
    {
    }
    void acceptRecord(void)
    {
        cout << "Title : ";
        cin >> title;
        cout << "Price : ";
        cin >> price;
    }
    void printRecord(void)
    {
        cout << "Title : " << title << endl;
        cout << "Price : " << price << endl;
    }
};
class Book : public Product
{
private:
    int pageCount;

public:
    Book(void) : pageCount(0)
    {
    }
    void acceptRecord(void)
    {
        Product::acceptRecord( ); 
        cout << "PageCount : ";
        cin >> pageCount;
    }
    void printRecord(void)
    {
        Product::printRecord( ); 
        cout << "PageCount : " << pageCount << endl;
    }
};
class Tape : public Product
{
private:
    int playTime;
public:
    Tape(void) : playTime(0)
    {
    }
    void acceptRecord(void)
    {
        Product::acceptRecord( ); 
        cout << "PlayTime : ";
        cin >> playTime;
    }
    void printRecord(void)
    {
        Product::printRecord( ); 
        cout << "PlayTime : " << playTime << endl;
    }
};
int menuList( void )
{
    int choice; 
    cout<<"0.Exit"<<endl; 
    cout<<"1.Book"<<endl;
    cout<<"2.Tape"<<endl;
    cout<<"Enter the choice : "; 
    cin>>choice; 
    return choice; 
}
int main()
{
    int choice; 
    while((choice = ::menuList())!=0)
    {
        Book *book = NULL; 
        Tape *tape = NULL; 
        switch (choice)
        {
        case 1: 
            book = new Book( ); 
            book->acceptRecord( ); 
            book->printRecord( ); 
            delete book; 
            book = NULL; 
            break;
        case 2: 
            tape = new Tape( ); 
            tape->acceptRecord( ); 
            tape->printRecord( ); 
            delete tape; 
            tape = NULL;    
            break;  
        }
    }
    return 0;
}
