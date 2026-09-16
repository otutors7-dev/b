#include<iostream>
#include<string>
using namespace std;

class Product
{
private:
    int id;
    string title;
    double price;
    double discount;

public:
    Product() : id(0), title(""), price(0.0), discount(0.0)
    {}
    Product(int id, string title, double price, double discount)
        : id(id), title(title), price(price), discount(discount)
    {}

    double getFinalPrice()
    {
        return price - (price * discount / 100);
    }

    virtual void display()
    {
        cout << "ID: " << id << ", Title: " << title
             << ", Price: " << price << ", Discount: " << discount << "%"
             << ", Final Price: " << getFinalPrice() << endl;
    }

    virtual ~Product()
    {}
};

class Book : public Product
{
private:
    string author;

public:
    Book() : author("")
    { }

    Book(int id, string title, string author, double price)
        : Product(id, title, price, 10.0), author(author)
    { }

    void display()
    {
        cout << "[Book] ";
        Product::display();
        cout << "    Author: " << author << endl;
    }
};

class Tape : public Product
{
private:
    string artist;

public:
    Tape() : artist("")
    { }

    Tape(int id, string title, string artist, double price)
        : Product(id, title, price, 5.0), artist(artist)
    { }

    void display()
    {
        cout << "[Tape] ";
        Product::display();
        cout << "    Artist: " << artist << endl;
    }
};

int menu()
{
    int choice;
    cout << "0.Exit" << endl;
    cout << "1. Book" << endl;
    cout << "2. Tape" << endl;
    cout << "Enter Choice ";
    cin >> choice;
    return choice;
}

int main()
{
    Product* arr[3];

    for (int i = 0; i < 3; i++)
    {
        cout << "\n--- Product " << (i + 1) << " of 3 ---" << endl;
        int choice = menu();

        int id;
        string title, sub;
        double price;

        cout << "Enter ID: ";
        cin >> id;
        cout << "Enter Title: ";
        cin >> title;
        cout << "Enter Price: ";
        cin >> price;

        if (choice == 1)
        {
            cout << "Enter Author: ";
            cin >> sub;
            arr[i] = new Book(id, title, sub, price);
        }
        else if (choice == 2)
        {
            cout << "Enter Artist: ";
            cin >> sub;
            arr[i] = new Tape(id, title, sub, price);
        }
        else
        {
            cout << "Invalid, defaulting to Book.\n";
            arr[i] = new Book(id, title, "Unknown", price);
        }
    }

    double totalBill = 0.0;
    cout << "\n===== Final Bill =====\n";
    for (int i = 0; i < 3; i++)
    {
        arr[i]->display();
        totalBill += arr[i]->getFinalPrice();
    }
    cout << "\nTotal Bill: " << totalBill << endl;

    for (int i = 0; i < 3; i++)
    {
        delete arr[i];
        arr[i] = nullptr;
    }

    return 0;
}