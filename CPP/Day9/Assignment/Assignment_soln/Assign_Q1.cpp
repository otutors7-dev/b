
#include <iostream>
using namespace std;
class Employee
{
    int id;
    double salary;

public:
    Employee() // Parameterless Constructor
    {
        id = 0;
        salary = 0.0;
    }
    Employee(int id, double salary) // Parameterized Constructor
    {
        this->id = id;
        this->salary = salary;
    }
    // Made virtual: late binding we want accept and display to be called on type of object

    virtual void accept()
    {
        cout << "Enter id: ";
        cin >> id;
        cout << "Enter Salary: ";
        cin >> salary;
    }
    virtual void display()
    {
        cout << "ID: " << id << endl;
        cout << "Salary: " << salary << endl;
    }
};
// Virtual inheritance because we dont want members to be inherited multple times
class Manager : virtual public Employee
{
    double bonus;

public:
    Manager()
    {
        bonus = 0;
    }
    // Invoking the Employee(base class's) parameterized constructor in Initializer list

    Manager(int id, double salary, double bonus) : Employee(id, salary)
    {
        this->bonus = bonus;
    }
    void accept()
    {
        Employee::accept();
        acceptManager();
    }
    void display()
    {
        Employee::display();
        displayManager();
    }

protected:
    void acceptManager()
    {
        cout << "Enter Bonus: ";
        cin >> bonus;
    }
    void displayManager()
    {
        cout << "Bonus=" << bonus << endl;
    }
};
class Salesman : virtual public Employee
{
    double commission;

public:
    Salesman()
    {
        commission = 0;
    }
    Salesman(int id, double salary, double commission) : Employee(id, salary)
    {
        this->commission = commission;
    }
    void accept()
    {
        Employee::accept();
        acceptSalesman();
    }
    void display()
    {
        Employee::display();
        displaySalesman();
    }

protected:
    void acceptSalesman()
    {
        cout << "Enter commission: ";
        cin >> commission;
    }
    void displaySalesman()
    {
        cout << "Commission: " << commission << endl;
    }
};
class SalesManager : public Manager, Salesman
{
public:
    void accept()
    {
        Employee::accept();
        Manager::acceptManager();
        Salesman::acceptSalesman();
    }
    void display()
    {
        Employee::display();
        Manager::displayManager();
        Salesman::displaySalesman();
    }
};
enum e_choice
{
    Exit,
    addManager,
    addSalesman,
    addSalesmanager,
    countDesignation,
    displayManager,
    displaySalesman,
    displaySalesManager
};
e_choice menu()
{
    int choice;
    cout << endl;
    cout << "Enter 0: Exit" << endl;
    cout << "Enter 1: Add Manager" << endl;
    cout << "Enter 2: Add Salesman" << endl;
    cout << "Enter 3: Add Salesmanager" << endl;
    cout << "Enter 4: Display the count of all employees with respect to designation" << endl;
    cout << "Enter 5: Display Manager" << endl;
    cout << "Enter 6: Display Salesman" << endl;
    cout << "Enter 7: Display SalesManager" << endl;
    cout << "Enter choice: ";
    cin >> choice;
    cout << endl;
    return e_choice(choice);
}

// Using Namespace to organize the code so that it becomes easy to maintain the code

namespace N1
{
    void addManager(Employee *arr[], int &index, int &manager)
    {
        arr[index] = new Manager();
        arr[index]->accept();
        arr[index]->display();
        ++index;
        ++manager;
        cout << endl;
    }

    void addSaleman(Employee *arr[], int &index, int &salesman)
    {
        arr[index] = new Salesman();
        arr[index]->accept();
        arr[index]->display();
        ++index;
        ++salesman;
        cout << endl;
    }

    void addSaleManager(Employee *arr[], int &index, int &salesmanager)
    {
        arr[index] = new SalesManager();
        arr[index]->accept();
        cout << endl;
        arr[index]->display();
        ++index;
        ++salesmanager;
        cout << endl;
    }

    void countDesignation(Employee *arr[], int &index)
    {
        int manager = 0, salesman = 0, salesmanager = 0;
        for (int i = 0; i < index; i++)
        {
            if (typeid(*arr[i]) == typeid(Manager))
                ++manager;
            if (typeid(*arr[i]) == typeid(Salesman))
                ++salesman;
            if (typeid(*arr[i]) == typeid(SalesManager))
                ++salesmanager;
        }
        cout << "Manager: " << manager << endl;
        cout << "Salesman: " << salesman << endl;
        cout << "SalesManager: " << salesmanager << endl;
    }

    void displayManager(Employee *arr[], int &index, int &manager)
    {

        try
        {
            if (manager == 0)
                throw 1;
            for (int i = 0; i < index; i++)
            {
                if (typeid(*arr[i]) == typeid(Manager))
                {
                    cout << "Manager: " << endl;
                    arr[i]->display();
                    cout << endl;
                }
            }
        }
        catch (int exception)
        {
            cout << "No Manager Exist" << endl;
        }
    }

    void displaySalesman(Employee *arr[], int &index, int &salesman)
    {

        try
        {
            if (salesman == 0)
                throw 1;
            for (int i = 0; i < index; i++)
            {
                if (typeid(*arr[i]) == typeid(Salesman))
                {
                    cout << "Salesman: " << endl;
                    arr[i]->display();
                    cout << endl;
                }
            }
        }
        catch (int exception)
        {
            cout << "No Salesman Exist" << endl;
        }
    }

    void displaySalesManager(Employee *arr[], int &index, int &salesmanager)
    {
        try
        {
            if (salesmanager == 0)
                throw 1;
            for (int i = 0; i < index; i++)
            {
                if (typeid(*arr[i]) == typeid(SalesManager))
                {
                    cout << "SalesManager: " << endl;
                    arr[i]->display();
                    cout << endl;
                }
            }
        }
        catch (int exception)
        {
            cout << "No SalesManager Exist" << endl;
        }
    }
}

int main()
{

    int choice, index = 0;
    int manager = 0, salesman = 0, salesmanager = 0; // To count Employee of each designation
    Employee *arr[20];                               // Array of Pointer of Employee type

    while ((choice = menu()) != Exit)
    {
        switch (choice)
        {

        case addManager:
            N1::addManager(arr, index, manager);
            break;

        case addSalesman:
            N1::addSaleman(arr, index, salesman);
            break;

        case addSalesmanager:
            N1::addSaleManager(arr, index, salesmanager);
            break;

        case countDesignation:
            N1::countDesignation(arr, index);
            break;
        case displayManager:
            N1::displayManager(arr, index, manager);
            break;

        case displaySalesman:
            N1::displaySalesman(arr, index, salesman);
            break;

        case displaySalesManager:
            N1::displaySalesManager(arr, index, salesmanager);
            break;
        }
    }
    // Delloacting Memory allocated dynamically
    for (int i = 0; i < index; i++)
    {
        delete arr[i];
    }
    return 0;
}
