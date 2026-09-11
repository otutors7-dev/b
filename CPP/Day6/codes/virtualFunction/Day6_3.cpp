#include <iostream>
using namespace std;
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
int main2()
{
    Tape tape;
    tape.acceptRecord();
    tape.printRecord();
    return 0;
}

int main()
{
    Book b1;
    b1.acceptRecord();
    b1.printRecord();
    return 0;
}
