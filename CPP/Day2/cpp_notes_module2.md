# 📘 Module 2 — Namespaces, I/O Streams, Function Overloading & `this` Pointer

> **Course**: Object Oriented Programming Using C++
> **Instructor**: Ketan G Kore
> **Source Files**: [Day2 codes](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes) | [Day2.pdf](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/Day2.pdf)

---

## Table of Contents

1. [Scope Resolution Operator `::`](#1-scope-resolution-operator-)
2. [Namespaces — Avoiding Name Collisions](#2-namespaces--avoiding-name-collisions)
3. [Nested Namespaces](#3-nested-namespaces)
4. [The `using` Directive](#4-the-using-directive)
5. [Namespace Ambiguity & Resolution](#5-namespace-ambiguity--resolution)
6. [Namespaces — Advanced Usage](#6-namespaces--advanced-usage)
7. [Standard I/O Streams — `cin` & `cout`](#7-standard-io-streams--cin--cout)
8. [Manipulators](#8-manipulators)
9. [OOP Concepts — Class, Object, State, Behavior, Identity](#9-oop-concepts--class-object-state-behavior-identity)
10. [Classes with Namespaces and `cin`/`cout`](#10-classes-with-namespaces-and-cincout)
11. [Separating Declarations from Definitions](#11-separating-declarations-from-definitions)
12. [Function Overloading](#12-function-overloading)
13. [The `this` Pointer](#13-the-this-pointer)

---

## 1. Scope Resolution Operator `::`

### Types of Scope in C++

C++ has **six** types of scope — [Day2_1.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_1.cpp):

```cpp
#include<stdio.h>
int num1 = 10;            // 1. Program scope (global)
static int num2 = 20;     // 2. File scope (static global)

class Test
{
    int num3;              // 3. Class scope
};

namespace na
{
    int num4 = 10;         // 4. Namespace scope
}

int main()
{
    void print(int num1);  // 5. Function prototype scope
    int num5 = 50;         // 6. Function scope (local)
    {
        int num6 = 60;     //    Block scope (subset of function scope)
    }
    return 0;
}
```

### Variable Shadowing — [Day2_2.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_2.cpp)

When a local variable has the same name as a global variable, the **local variable takes precedence**:

```cpp
int num1 = 10;              // global
int main()
{
    int num1 = 20;           // local — shadows the global
    printf("num1 : %d\n", num1);  // Output: 20
}
```

### Accessing Global Variables with `::` — [Day2_3.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_3.cpp)

```cpp
int num1 = 10;              // global
int main()
{
    int num1 = 20;           // local
    printf("num1 : %d\n", num1);     // 20 (local)
    printf("num1 : %d\n", ::num1);   // 10 (global — accessed via ::)
}
```

> [!TIP]
> The **scope resolution operator `::`** without a prefix (i.e., `::variable`) accesses the **global namespace**. This is the only way in C++ to access a shadowed global variable.

### Nested Blocks — [Day2_4.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_4.cpp)

```cpp
int num1 = 10;              // global
int main()
{
    int num2 = 20;           // function scope
    printf("num2 : %d\n", num2);      // 20
    printf("num1 : %d\n", ::num1);    // 10
    {
        int num1 = 30;       // block scope — shadows global
        printf("num1 : %d\n", num1);    // 30 (block-local)
        printf("num1 : %d\n", ::num1);  // 10 (global)
    }
}
```

> [!NOTE]
> `::` can only reach the **global** scope. There is no operator in C++ to access an intermediate scope's variable that has been shadowed by an inner block.

---

## 2. Namespaces — Avoiding Name Collisions

### Basic Namespace — [Day2_5.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_5.cpp)

```cpp
namespace na
{
    int num1 = 10;    // namespace scope
}
int main()
{
    printf("num1 : %d", na::num1);  // Access via namespace::member
}
```

### Two Different Namespaces — [Day2_6.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_6.cpp)

If namespaces have **different names**, their members **may** have the same name:

```cpp
namespace na { int num1 = 10; int num2 = 20; }
namespace nb { int num1 = 30; int num4 = 40; }

int main()
{
    printf("num1 : %d\n", na::num1);  // 10
    printf("num2 : %d\n", na::num2);  // 20
    printf("num1 : %d\n", nb::num1);  // 30  — same name, different namespace!
    printf("num4 : %d\n", nb::num4);  // 40
}
```

### Same Namespace Extended — [Day2_7.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_7.cpp)

If two namespace blocks have the **same name**, they **merge** — but members within them must be unique:

```cpp
namespace na { int num1 = 10; int num2 = 20; }
namespace na { int num3 = 30; int num4 = 40; }  // extends 'na'

int main()
{
    printf("num1 : %d\n", na::num1);  // 10
    printf("num2 : %d\n", na::num2);  // 20
    printf("num3 : %d\n", na::num3);  // 30
    printf("num4 : %d\n", na::num4);  // 40
}
```

---

## 3. Nested Namespaces

Namespaces can be **nested** inside other namespaces — [Day2_8.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_8.cpp):

```cpp
namespace na          // Top-level namespace
{
    int num1 = 10;
    namespace nb      // Nested namespace
    {
        int num2 = 20;
    }
}
int main()
{
    printf("num1 : %d", na::num1);       // 10
    printf("num2 : %d", na::nb::num2);   // 20 — chain :: operators
}
```

---

## 4. The `using` Directive

### Basic `using` — [Day2_9.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_9.cpp)

Instead of writing `na::num1` repeatedly, use the **`using` directive**:

```cpp
namespace na { int num1 = 10; }
int main()
{
    // Without using: na::num1, na::num1, na::num1...
    using namespace na;        // Import all members of 'na'
    printf("num1 : %d\n", num1);  // No prefix needed!
    printf("num1 : %d\n", num1);
}
```

### Local Variable vs `using` — [Day2_10.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_10.cpp)

If a local variable has the same name as a namespace member, the **local variable wins**:

```cpp
namespace na { int num1 = 10; }
int main()
{
    int num1 = 20;            // local variable
    using namespace na;
    printf("num1 : %d", num1); // 20 — local takes precedence
}
```

### Global Variable vs Namespace Member — [Day2_11.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_11.cpp)

```cpp
namespace na { int num1 = 10; }
int num1 = 20;                  // global variable
int main()
{
    using namespace na;
    // printf("num1 : %d", num1); // ❌ AMBIGUOUS — compiler error!
    printf("num1 : %d\n", na::num1);  // 10 — explicit namespace
    printf("num1 : %d\n", ::num1);    // 20 — explicit global
}
```

> [!CAUTION]
> When both a global variable and a namespace member have the same name, and `using` is applied, accessing the name without a qualifier causes an **ambiguity error**.

---

## 5. Namespace Ambiguity & Resolution

### Two `using` Directives with Same Names — [Day2_12.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_12.cpp)

```cpp
namespace na { int num1 = 10; }
namespace nb { int num1 = 10; }

int main()
{
    using namespace na;
    printf("num1 : %d", num1);   // ✅ OK — only 'na' is active

    using namespace nb;
    // printf("num1 : %d", num1); // ❌ AMBIGUOUS — both na and nb have num1
}
```

> [!WARNING]
> Importing multiple namespaces that share member names causes ambiguity. Always prefer **explicit qualification** (`na::num1`) when multiple namespaces are in scope.

---

## 6. Namespaces — Advanced Usage

### Namespace with Functions, Structs, Nested Namespaces — [Day2_13.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_13.cpp)

```cpp
namespace na
{
    int num1 = 10;
    void print(void)
    {
        printf("num1 : %d\n", num1);
    }
    struct Point
    {
        int xPos, yPos;
        void printRecord(void)
        {
            printf("xPos : %d\n", xPos);
            printf("yPos : %d\n", yPos);
        }
    };
    namespace nb { int num3 = 30; }     // nested namespace
}

int main()
{
    using namespace na;
    struct Point pt1 = {10, 20};
    pt1.printRecord();            // xPos: 10, yPos: 20
    print();                      // num1: 10
    using namespace nb;
    printf("num3 : %d", num3);   // 30
}
```

### Global `using` Directive — [Day2_14.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_14.cpp)

If namespace members are used in **multiple functions**, declare `using` globally:

```cpp
namespace na { int num1 = 10; }
using namespace na;              // Global using — all functions can use 'num1'

void printRecord(void)  { printf("num1 : %d\n", num1); }
void showRecord(void)   { printf("num1 : %d\n", num1); }
void displayRecord(void){ printf("num1 : %d\n", num1); }

int main()
{
    ::showRecord();       // :: to call global functions explicitly
    ::printRecord();
    ::displayRecord();
}
```

### Organizing Functions into Namespaces — [Day2_15.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace/Day2_15.cpp)

```cpp
namespace na { int num1 = 10; }
using namespace na;

namespace ntest
{
    void printRecord(void)  { printf("num1 : %d\n", num1); }
    void showRecord(void)   { printf("num1 : %d\n", num1); }
    void displayRecord(void){ printf("num1 : %d\n", num1); }
}

int main()
{
    using namespace ntest;
    printRecord();       // Works without ntest:: prefix
    showRecord();
    displayRecord();
}
```

### Key Rules for Namespaces

| Rule | Detail |
|---|---|
| Names can be same or different | Across namespaces |
| Access via `::` or `using` | Two ways to reach members |
| Cannot define inside function/class | Must be global or nested in another namespace |
| `main()` cannot be in a namespace | Must be in global namespace |
| Cannot create object of namespace | Namespaces are for grouping only |
| `std` is the standard namespace | Contains all standard library items |
| Convention | Namespace names should be lowercase |

---

## 7. Standard I/O Streams — `cin` & `cout`

### What are Streams?

A **stream** is an abstraction (object) used to produce (write) and consume (read) data between a source and destination.

| Stream | Type | Represents | Class |
|---|---|---|---|
| `cin` | Input | Keyboard | `istream` (alias for `basic_istream<char>`) |
| `cout` | Output | Monitor | `ostream` (alias for `basic_ostream<char>`) |
| `cerr` | Error (unbuffered) | Monitor | `ostream` |
| `clog` | Error (buffered) | Monitor | `ostream` |

> All are declared as **extern objects** inside the `std` namespace in the `<iostream>` header.

### `cout` — Character Output — [Day2_16.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/cin_cout/Day2_16.cpp)

```cpp
// Step 1: Without 'using' — fully qualified
int main1()
{
    std::cout << "Hello world";       // std:: prefix required
}

// Step 2: With 'using namespace std'
int main2()
{
    using namespace std;
    cout << "Hello world";            // No prefix needed
}

// Step 3: Printing variables
int main3()
{
    int num1 = 10;
    cout << "num1 : " << num1;        // Chaining << operator
}

// Step 4: Multiple variables with endl
int main()
{
    int num1 = 10, num2 = 20;
    cout << "num1 = " << num1 << "," << "num2 = " << num2 << endl;
}
```

> [!NOTE]
> - `cout` uses the **insertion operator `<<`** (also called "put-to" operator)
> - `<<` can be **chained** to output multiple values in one statement
> - `endl` flushes the buffer AND adds a newline (slightly slower than `\n`)

### `cin` — Character Input — [Day2_17.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/cin_cout/Day2_17.cpp)

```cpp
// Step 1: Without 'using'
int main1()
{
    int num1;
    std::cout << "Enter the num1 : ";
    std::cin >> num1;                 // extraction operator >>
    std::cout << "num1 : " << num1;
}

// Step 2: With 'using namespace std' — reading two values
int main()
{
    int num1, num2;
    cout << "Enter the num1 and num2 :";
    cin >> num1 >> num2;              // Chaining >> to read multiple values
    cout << "num1 = " << num1 << endl << "num2 = " << num2;
}
```

> [!TIP]
> **Key Differences from C I/O:**
> | Feature | C (`printf`/`scanf`) | C++ (`cout`/`cin`) |
> |---|---|---|
> | Format specifiers | Required (`%d`, `%s`, etc.) | NOT needed — type-safe |
> | Address operator | `scanf` needs `&` for non-strings | `cin >>` handles it automatically |
> | Type safety | No — wrong specifier = UB | Yes — compiler knows the type |
> | Extensibility | Cannot extend | Can overload `<<`/`>>` for custom types |

---

## 8. Manipulators

Manipulators are **functions** (not characters) used to format output in C++.

| Manipulator | Header | Purpose |
|---|---|---|
| `endl` | `<iostream>` | Newline + flush buffer |
| `setw` | `<iomanip>` | Set field width |
| `fixed` | `<iomanip>` | Fixed-point notation |
| `scientific` | `<iomanip>` | Scientific notation |
| `setprecision` | `<iomanip>` | Set decimal precision |
| `dec`, `oct`, `hex` | `<iomanip>` | Number base |

---

## 9. OOP Concepts — Class, Object, State, Behavior, Identity

### Object Characteristics

| Property | Description | C++ Representation |
|---|---|---|
| **State** | Data stored inside object | Data member values |
| **Behavior** | Operations performable on object | Member functions |
| **Identity** | What distinguishes one object from others | Memory address |

### Class

- A **collection** of data members and member functions.
- The **template/blueprint/model** for objects.
- **Logical/imaginary** entity — doesn't occupy runtime memory by itself.
- Class implementation = **encapsulation**.

### Object

- A **variable/instance** of a class.
- A **physical/real-time** entity — gets space in memory.
- An entity with **state, behavior, and identity**.

### Special Member Functions (Compiler-Generated)
1. **Constructor** — initializes the object
2. **Destructor** — releases resources
3. **Copy Constructor** — creates a copy of an object
4. **Assignment Operator** — assigns one object to another

### Concrete vs Abstract
- **Concrete class**: Can create objects (instantiable)
- **Abstract class**: Cannot create objects (has pure virtual functions)
- **Concrete method**: Has a body
- **Abstract method**: Has no body (pure virtual)

---

## 10. Classes with Namespaces and `cin`/`cout`

### Employee Class with `cin`/`cout` — [Day2_18.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace_class_cin_cout/Day2_18.cpp)

```cpp
#include<iostream>
using namespace std;

class Employee
{
    private:
    char name[20];
    int age;
    double salary;

    public:
    void acceptRecord(void)
    {
        cout << "Name : ";   cin >> name;
        cout << "Age : ";    cin >> age;
        cout << "Salary : "; cin >> salary;
    }
    void printRecord(void)
    {
        cout << "Name : "   << name   << endl;
        cout << "Age : "    << age    << endl;
        cout << "Salary : " << salary << endl;
    }
};

int main()
{
    Employee emp;
    emp.acceptRecord();
    emp.printRecord();
}
```

---

## 11. Separating Declarations from Definitions

### Why Separate?

In real projects, **class declarations** go in header files (`.h`) and **definitions** go in source files (`.cpp`). This is called the **modular approach**.

### Declaration Inside, Definition Outside — [Day2_19.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace_class_cin_cout/Day2_19.cpp)

```cpp
class Employee
{
    private:
    char name[20]; int age; double salary;

    public:
    void acceptRecord(void);    // Declaration only
    void printRecord(void);     // Declaration only
};

// Definitions outside the class — use ClassName::
void Employee::acceptRecord(void)
{
    cout << "Name : ";   cin >> name;
    cout << "Age : ";    cin >> age;
    cout << "Salary : "; cin >> salary;
}

void Employee::printRecord(void)
{
    cout << "Name : "   << name   << endl;
    cout << "Age : "    << age    << endl;
    cout << "Salary : " << salary << endl;
}
```

> [!IMPORTANT]
> When defining member functions **outside** the class, you must use the **scope resolution operator** `ClassName::` to tell the compiler which class the function belongs to.

### Class Inside a Namespace — [Day2_20.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/namespace_class_cin_cout/Day2_20.cpp)

```cpp
namespace ntest
{
    class Employee
    {
        private:
        char name[20]; int age; double salary;
        public:
        void acceptRecord(void);
        void printRecord(void);
    };
}

using namespace ntest;

void Employee::acceptRecord(void)
{
    cout << "Name : ";   cin >> name;
    cout << "Age : ";    cin >> age;
    cout << "Salary : "; cin >> salary;
}

void Employee::printRecord(void)
{
    cout << "Name : " << name << endl;
    cout << "Age : "  << age  << endl;
    cout << "Salary : " << salary << endl;
}

int main()
{
    Employee emp;
    emp.acceptRecord();
    emp.printRecord();
}
```

---

## 12. Function Overloading

### What is Function Overloading?

> Defining **multiple functions** with the **same name** but **different signatures** is called function overloading.

It is an **OOP concept** that represents **compile-time polymorphism** (static polymorphism).

### Without Overloading (Different Names) — [Day2_21.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/FunctionOverloading/Day2_21.cpp)

```cpp
void sum(int a, int b)         // Adds two ints
{
    int result = a + b;
    cout << "Result : " << result << endl;
}
void add(int a, float b)      // Adds int and float — DIFFERENT name
{
    float result = a + b;
    cout << "Result : " << result << endl;
}
int main()
{
    ::sum(10, 20);
    ::add(10, 1.1f);
}
```

### Rule 1: Different Number of Parameters — [Day2_22.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/FunctionOverloading/Day2_22.cpp)

```cpp
void add(int a, int b)            // 2 parameters
{
    cout << "Result : " << a + b << endl;
}
void add(int a, int b, int c)     // 3 parameters — SAME name!
{
    cout << "Result : " << a + b + c << endl;
}
int main()
{
    ::add(10, 20);        // Calls 2-param version → 30
    ::add(10, 20, 30);    // Calls 3-param version → 60
}
```

### Rule 2: Different Type of Parameters — [Day2_23.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/FunctionOverloading/Day2_23.cpp)

```cpp
void add(int a, int b)            // (int, int)
{
    cout << "Result : " << a + b << endl;
}
void add(int a, float b)          // (int, float) — SAME name!
{
    cout << "Result : " << a + b << endl;
}
int main()
{
    ::add(10, 20);        // Calls (int, int) version
    ::add(10, 20.1f);     // Calls (int, float) version
}
```

### Rule 3: Different Order of Parameters — [Day2_24.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/FunctionOverloading/Day2_24.cpp)

```cpp
void add(int a, float b)          // (int, float)
{
    cout << "Result : " << a + b << endl;
}
void add(float a, int b)          // (float, int) — order matters!
{
    cout << "Result : " << a + b << endl;
}
int main()
{
    ::add(10, 20.1f);     // Calls (int, float) version
    ::add(10.1f, 20);     // Calls (float, int) version
}
```

### Function Overloading Rules Summary

| Rule | Overloaded By | Example |
|---|---|---|
| **1. Number of parameters** | Different count | `add(int, int)` vs `add(int, int, int)` |
| **2. Type of parameters** | Different types | `add(int, int)` vs `add(int, float)` |
| **3. Order of parameters** | Different order | `add(int, float)` vs `add(float, int)` |
| **4. Return type ONLY** | ❌ **NOT valid** | Cannot overload by return type alone |

### Key Points
- Functions must exist in the **same scope** for overloading.
- Return type is **NOT** considered for overloading (since catching return value is optional).
- These functions **cannot** be overloaded: `main()` and destructors.
- Both **global** and **member** functions can be overloaded.

---

## 13. The `this` Pointer

### What is `this`?

When you call a member function on an object, the compiler **implicitly passes the address of the calling object** as a hidden first argument. This address is stored in the `this` pointer.

**General type**: `ClassName * const this;`

This means `this` is a **constant pointer** — you cannot reassign it, but you can modify what it points to.

### Explicit `this` Usage — [Day2_25.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/this_pointer/Day2_25.cpp)

```cpp
class Complex
{
    private:
    int real, imag;
    public:
    // ClassName * const this;
    // this = &c1  (when called on c1)
    void acceptRecord()
    {
        cout << "Real : "; cin >> this->real;
        cout << "Imag : "; cin >> this->imag;
    }
    void printRecord(void)
    {
        cout << "Real : " << this->real << endl;
        cout << "Imag : " << this->imag << endl;
    }
};

int main()
{
    Complex c1;
    c1.acceptRecord();   // Internally: c1.acceptRecord(&c1);
    c1.printRecord();    // Internally: c1.printRecord(&c1);
}
```

### Resolving Name Ambiguity with `this` — [Day2_26.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/this_pointer/Day2_26.cpp)

When a **parameter name** matches a **data member name**, `this->` is essential:

```cpp
class Complex
{
    private:
    int real, imag;
    public:
    void initComplex(int real, int imag)  // parameter names shadow data members
    {
        cout << this << endl;        // prints address of calling object
        this->real = real;           // this->real = data member, real = parameter
        this->imag = imag;
    }
    void printRecord(void)
    {
        cout << this << endl;        // same address for same object
        cout << "Real : " << this->real << endl;
        cout << "Imag : " << this->imag << endl;
    }
};

int main(void)
{
    Complex c1;
    c1.initComplex(10, 20);   // c1.initComplex(&c1, 10, 20);
    c1.printRecord();         // c1.printRecord(&c1);
}
```

> [!IMPORTANT]
> When parameter names and data member names collide, the parameter takes precedence (like local vs global). Use `this->` to explicitly refer to the data member.

### Practical Example: Date Class — [Day2_27.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day2/codes/this_pointer/Day2_27.cpp)

A step-by-step class design process:

```cpp
// Step 1: Understand requirement and Declare the class
class Date
{
    // Step 2: Declare the data-members
    // Step 4: Apply access specifiers
    private:
    int day, month, year;

    public:
    // this = &dt1
    void acceptDate(void)
    {
        cout << "Day : ";   cin >> this->day;
        cout << "Month : "; cin >> this->month;
        cout << "Year : ";  cin >> this->year;
    }
    void printDate(void)
    {
        cout << this->day << "/" << this->month << "/" << this->year << endl;
    }
};

int main()
{
    // Step 3: Creating the Object
    Date dt1;
    // Step 5: Calling methods
    dt1.acceptDate();    // dt1.acceptDate(&dt1);
    dt1.printDate();     // dt1.printDate(&dt1);
}
```

### `this` Pointer — Key Rules

| Property | Detail |
|---|---|
| Type | `ClassName * const this` — constant pointer to current object |
| Availability | Every **non-static** member function |
| NOT available in | Global functions, `static` member functions, `friend` functions |
| Cannot be declared explicitly | Compiler handles it — it's the first hidden parameter |
| Purpose | Links data members and member functions — enables communication |
| When `this->` is optional | When there is no name collision between parameters and data members |
| When `this->` is mandatory | When parameter name shadows data member name |

---

> **Previous Module**: [← Module 1 — Foundations of C++ and OOP](file:///C:/Users/daksh/.gemini/antigravity-ide/brain/92fbddbf-9c4b-4006-8737-6fed254b8644/cpp_notes_module1.md)
>
> **Next Module**: [Module 3 — Inline Functions, Getters/Setters, Constructors, `const` Members & Dynamic Memory →](file:///C:/Users/daksh/.gemini/antigravity-ide/brain/92fbddbf-9c4b-4006-8737-6fed254b8644/cpp_notes_module3.md)
