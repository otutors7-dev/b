# 📘 Module 1 — Foundations of C++ and Object-Oriented Programming

> **Course**: Object Oriented Programming Using C++
> **Instructor**: Ketan G Kore
> **Source Files**: [Day1 codes](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes) | [Day1.pdf](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/Day1.pdf)

---

## Table of Contents

1. [Programming Language Basics](#1-programming-language-basics)
2. [OOP Pillars & Philosophy](#2-oop-pillars--philosophy)
3. [C++ Language Introduction](#3-c-language-introduction)
4. [Memory Layout of a C++ Program](#4-memory-layout-of-a-c-program)
5. [Functions in C — Call by Value vs Call by Address](#5-functions-in-c--call-by-value-vs-call-by-address)
6. [Structures in C — Data + Functions Together](#6-structures-in-c--data--functions-together)
7. [Access Specifiers — `private`, `protected`, `public`](#7-access-specifiers--private-protected-public)
8. [From `struct` to `class` — The Evolution](#8-from-struct-to-class--the-evolution)
9. [Data Members and Member Functions](#9-data-members-and-member-functions)
10. [Instance, Instantiation & Message Passing](#10-instance-instantiation--message-passing)
11. [The `const` Keyword — Pointers & Variables](#11-the-const-keyword--pointers--variables)

---

## 1. Programming Language Basics

A **programming language** is a formal language used for:
- Business logic implementation
- Application Development (CUI, GUI, Library apps, etc.)

### Building Blocks of a Language
1. **Syntax & Semantics** — Rules for valid statements and their meanings
2. **Data Types** — Decide memory, nature, operations, and range
3. **Tokens** — The smallest unit: Identifiers, Keywords, Constants, Operators, Punctuators
4. **Built-in features** — Language-native constructs
5. **Standard library & run-time system**

### Types of Programming Languages
| Level | Description |
|---|---|
| Machine-level | Binary instructions directly for CPU |
| Low-level | Assembly language — mnemonics map to machine code |
| High-level | Human-readable — C, C++, Java, Python, etc. |

### Programming Paradigms
| Paradigm | Languages |
|---|---|
| **Procedural** | C, FORTRAN, Pascal, COBOL |
| **Object-Oriented** | C++, Java, C#, Simula, Smalltalk |
| **Object-Based** | Ada, VB, JavaScript |
| **Functional** | LISP, Python, Scala, Haskell |

---

## 2. OOP Pillars & Philosophy

> "Object-Oriented Programming" was coined by **Alan Kay**.
> **Grady Booch** is the inventor of UML (Unified Modelling Language).

### Major Pillars (Mandatory — language is NOT OOP without these)

| Pillar | Purpose |
|---|---|
| **Abstraction** | To achieve simplicity |
| **Encapsulation** | To achieve data hiding |
| **Modularity** | To minimize module dependency |
| **Hierarchy** | To achieve reusability |

### Minor Pillars (Useful but not essential)

| Pillar | Purpose |
|---|---|
| **Typing** | To reduce maintenance of the system |
| **Concurrency** | To utilize hardware resources efficiently |
| **Persistence** | To maintain state of object on secondary storage |

---

## 3. C++ Language Introduction

- Created by **Bjarne Stroustrup** in **1979**.
- Originally called **"C with Classes"**.
- A **pure C language** extended with classes — derived from **C** and **Simula**.
- Source file extension: **`.cpp`**
- Standardized by ISO: C++98, C++03, C++11, C++14, C++17, C++20, C++23.
- C++98 has **74 keywords**; C++11 added **10 more**.
- Reference: [cppreference.com](https://en.cppreference.com/w/cpp)

### Data Types in C++

| Category | Examples |
|---|---|
| **Fundamental** | `int`, `char`, `float`, `double`, `bool`, `void` |
| **Derived** | `int*`, `int[]`, `int&` (reference) |
| **User-Defined** | `struct`, `class`, `enum`, `union`, `typedef` |

> A data type decides 4 things: **Memory**, **Nature**, **Operation**, **Range**

---

## 4. Memory Layout of a C++ Program

| Section | Contents |
|---|---|
| **`.text`** | Executable instructions — shared among processes running same binary |
| **`.bss`** | Uninitialized global/static variables ("Block Started by Symbol") |
| **`.data`** | Initialized global/static variables — READ/WRITE permissions |
| **`.rdata`** | Constants and string literals — READ-ONLY |
| **Heap** | Dynamically allocated memory (`malloc`, `new`) |
| **Stack** | Function parameters, local variables, return addresses |

---

## 5. Functions in C — Call by Value vs Call by Address

### The `main` function — Key Rules
- The **main function** is the entry point — OS calls it.
- Only **one** `main` per project.
- Cannot be `static` or `const`.
- Must be **global** — cannot be inside a struct/class.
- Missing `main` → **linker error**.

#### Example: Function declaration & definition — [Day1_1.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_1.cpp)

```cpp
#include<stdio.h>
int main( void )
{
    void print( void);  // local function declaration
    print( );           // function call
    return 0;
}
void print( void )      // function definition
{
    printf("Hello world");
}
```

> [!NOTE]
> Functions can be declared locally (inside `main`) or globally (before `main`). The **definition** is always outside.

---

### Call by Value (Does NOT Swap) — [Day1_2.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_2.cpp)

```cpp
void Swap(int x, int y)  // x, y are COPIES of a, b
{
    int temp = x;
    x = y;
    y = temp;
}
int main()
{
    int a = 10, b = 20;
    Swap(a, b);           // a and b are UNCHANGED after this call
    printf("a : %d\n", a); // Still 10
    printf("b : %d\n", b); // Still 20
}
```

> [!WARNING]
> In **call by value**, the function works on copies. Changes to `x` and `y` do **not** reflect back to `a` and `b`.

---

### Call by Address (DOES Swap) — [Day1_3.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_3.cpp)

```cpp
void Swap(int *x, int *y)  // x, y are POINTERS to a, b
{
    int temp = *x;
    *x = *y;
    *y = temp;
}
int main()
{
    int a = 10, b = 20;
    Swap(&a, &b);            // Pass addresses — actual swap happens
    printf("a : %d\n", a);   // 20
    printf("b : %d\n", b);   // 10
}
```

> [!TIP]
> In **call by address**, pointers let the function modify the original variables. This is the only way in C to get "out parameters".

---

## 6. Structures in C — Data + Functions Together

### Step 1: Basic Structure Usage — [Day1_4.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_4.cpp)

```cpp
struct Employee  // Global structure (blueprint)
{
    char name[20];
    int age;
    double salary;
};
int main()
{
    struct Employee emp = {"Sandeep", 31, 1000.00};
    printf("Name : %s\n", emp.name);
    printf("Age : %d\n", emp.age);
    printf("Salary : %.2lf\n", emp.salary);
}
```

> Structures can be **global** (visible everywhere) or **local** (visible only inside the function where defined).

---

### Step 2: Separate Functions for Accept/Print — [Day1_5.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_5.cpp)

```cpp
struct Employee { char name[20]; int age; double salary; };

void acceptRecord(struct Employee *ptr)
{
    printf("Name : "); scanf("%s", ptr->name);
    printf("Age : ");  scanf("%d", &ptr->age);
    printf("Salary : "); scanf("%lf", &ptr->salary);
}
void printRecord(struct Employee *ptr)
{
    printf("Name : %s\n", ptr->name);
    printf("Age : %d\n", ptr->age);
    printf("Salary : %.2lf\n", ptr->salary);
}
int main()
{
    struct Employee emp;
    acceptRecord(&emp);   // pass address of struct
    printRecord(&emp);
}
```

> [!IMPORTANT]
> In pure C, functions that operate on structs must receive a **pointer to the struct** explicitly. This is a key limitation that C++ classes solve.

---

### Step 3: Menu-Driven Program — [Day1_6.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_6.cpp)

```cpp
int menuList(void)
{
    int choice;
    printf("0.Exit\n1.AcceptRecord\n2.PrintRecord\n");
    printf("Enter the choice : "); scanf("%d", &choice);
    return choice;
}
int main()
{
    struct Employee emp;
    int choice;
    while ((choice = menuList()) != 0)
    {
        switch (choice)
        {
            case 1: acceptRecord(&emp); break;
            case 2: printRecord(&emp);  break;
        }
    }
}
```

---

### The Problem: No Data Protection — [Day1_7.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_7.cpp)

```cpp
int main()
{
    struct Employee emp;
    acceptRecord(&emp);
    emp.salary = 0.0;     // ⚠️ Anyone can directly modify salary!
    printRecord(&emp);
}
```

> [!CAUTION]
> In C, there is **no access control** — any code can directly modify `emp.salary`. This is the motivation for **access specifiers** in C++.

---

## 7. Access Specifiers — `private`, `protected`, `public`

C++ introduces three access specifiers to control member visibility:

| Specifier | Accessible From |
|---|---|
| `private` | Only from **member functions** of the same class |
| `protected` | From member functions of the same class **and derived classes** |
| `public` | From **anywhere** (member functions, non-member functions, other classes) |

> [!IMPORTANT]
> - In C++, **`struct`** members are `public` by default.
> - In C++, **`class`** members are `private` by default.

---

## 8. From `struct` to `class` — The Evolution

### Using `struct` with Access Specifiers — [Day1_8.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_8.cpp)

```cpp
struct Employee
{
    private:                       // data is now hidden
    char name[20];
    int age;
    double salary;

    public:                        // functions are accessible
    void acceptRecord()            // No need for pointer parameter!
    {
        printf("Name : ");  scanf("%s", name);     // direct access
        printf("Age : ");   scanf("%d", &age);
        printf("Salary : "); scanf("%lf", &salary);
    }
    void printRecord()
    {
        printf("Name : %s\n", name);
        printf("Age : %d\n", age);
        printf("Salary : %.2lf\n", salary);
    }
};
int main()
{
    Employee emp;
    emp.acceptRecord();   // No need to pass &emp explicitly!
    // emp.salary = 0.0;  // ❌ ERROR — salary is private
    emp.printRecord();
}
```

> [!TIP]
> Notice two key improvements over pure C:
> 1. **Data hiding**: `salary` cannot be directly modified from outside
> 2. **No explicit pointer passing**: member functions access data members directly — the compiler implicitly passes `this`

---

### Using `class` instead of `struct` — [Day1_9.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_9.cpp)

```cpp
class Employee
{
    private:
    // data-members / fields / properties / attributes
    char name[20];
    int age;
    double salary;

    public:
    // member-functions / methods / operations / behaviour
    void acceptRecord()
    {
        printf("Name : ");  scanf("%s", name);
        printf("Age : ");   scanf("%d", &age);
        printf("Salary : "); scanf("%lf", &salary);
    }
    void printRecord()
    {
        printf("Name : %s\n", name);
        printf("Age : %d\n", age);
        printf("Salary : %.2lf\n", salary);
    }
};
int main()
{
    Employee emp;                       // Object
    emp.Employee::acceptRecord();       // Message passing (explicit scope)
    emp.Employee::printRecord();        // Same as emp.printRecord()
}
```

> [!NOTE]
> `emp.Employee::acceptRecord()` is equivalent to `emp.acceptRecord()`. The explicit scope resolution `Employee::` is optional but shows that the function belongs to the `Employee` class.

---

## 9. Data Members and Member Functions

### Key Concepts

| Concept | Explanation |
|---|---|
| **Data Member** | Variable declared inside class scope. Also called field/attribute/property. |
| **Member Function** | Function defined inside class scope. Also called method/operation/behavior. |
| **State** | Value/data stored inside object (represented by data members) |
| **Behavior** | Set of operations performable on an object (represented by member functions) |
| **Identity** | The property that distinguishes one object from all others (its memory address) |

### Memory Rules
- **Data members** get space **once per object**, according to their order of declaration.
- **Member functions** do **NOT** get space inside objects. All objects of the same class **share a single copy** of member functions.
- **Empty class** → object size is **1 byte** (to ensure unique address).

---

## 10. Instance, Instantiation & Message Passing

### Instantiation
```cpp
Employee emp;          // 'emp' is an instance (object) of class Employee
// class Employee emp; // The 'class' keyword is optional during instantiation
```

### Message Passing
**Process of calling a member function on an object** is called message passing.

```cpp
emp.acceptRecord();   // Internally: emp.acceptRecord(&emp);
emp.printRecord();    // Internally: emp.printRecord(&emp);
```

> [!IMPORTANT]
> When you call `emp.acceptRecord()`, the compiler **implicitly** passes the address of `emp` as a hidden first argument. This is stored in the **`this` pointer** inside the member function. More on `this` in Module 2.

### Practical Example: Menu-Driven Class — [day1Try.cpp](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/day1Try.cpp)

```cpp
class Employee {
    int age;
    int salary;
public:
    void getvalues() {
        printf("Enter the age of the employee \n");
        scanf("%d", &this->age);
        printf("Enter the salary of the employee \n");
        scanf("%d", &this->salary);
    }
    void printValues() {
        printf("The age of the employee is %d\n", this->age);
        printf("The salary of the employee is %d\n", this->salary);
    }
};

void selectMenu(int &choice) {     // C++ reference parameter
    printf("0. Exit\n1. Print Values\n2. Accept Values\n");
    scanf("%d", &choice);
}

int main() {
    int choice;
    Employee emp;
    while (choice) {
        selectMenu(choice);
        switch (choice) {
            case 1: emp.printValues(); break;
            case 2: emp.getvalues();   break;
        }
    }
}
```

---

## 11. The `const` Keyword — Pointers & Variables

The `const` keyword in C/C++ is used to make values immutable. With pointers, there are **four combinations**:

### Level 1: `const` Variable — [Day1_10.cpp (main1)](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_10.cpp)

```cpp
const int a = 10;  // Must be initialized at declaration
printf("a : %d", a);  // 10
// a = 20;            // ❌ ERROR — cannot modify const variable
```

### Level 2: Pointer to `const` (value is protected) — [Day1_10.cpp (main2)](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_10.cpp)

```cpp
const int a = 10, b = 20;
const int *ptr = &a;        // ptr points to a const int
// *ptr = 30;               // ❌ Cannot modify value through ptr
ptr = &b;                   // ✅ Can change what ptr points to
printf("*ptr : %d", *ptr);  // 20
```

### Level 3: `const` Pointer (address is locked) — [Day1_10.cpp (main3)](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_10.cpp)

```cpp
int a = 10, b = 20;
int * const ptr = &a;       // ptr is constant — cannot be reassigned
*ptr = 30;                  // ✅ Can modify the value
// ptr = &b;                // ❌ Cannot change what ptr points to
```

### Level 4: `const` Pointer to `const` (both locked) — [Day1_10.cpp (main)](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/Day1_10.cpp)

```cpp
const int a = 10, b = 20;
const int * const ptr = &a;  // Both value and address are locked
// *ptr = 30;                // ❌ Cannot modify value
// ptr = &b;                 // ❌ Cannot change address
```

### Summary Table

| Declaration | Modify `*ptr`? | Reassign `ptr`? |
|---|---|---|
| `const int *ptr` | ❌ No | ✅ Yes |
| `int * const ptr` | ✅ Yes | ❌ No |
| `const int * const ptr` | ❌ No | ❌ No |

### Backdoor: Non-const Pointer to `const` Variable — [main.c](file:///c:/Users/daksh/Desktop/sunbeam/CPP/CPP/Day1/codes/main.c)

```cpp
const int a = 10;
int *ptr = &a;       // ⚠️ Casting away constness (compiler warning)
printf("a : %d\n", a);      // 10
// a = 20;                   // ❌ Not allowed
*ptr = 20;                   // ✅ Modifies a through pointer!
printf("a : %d\n", a);      // 20
```

> [!CAUTION]
> This is **undefined behavior** in C++. Even though it may work on some compilers, casting away `const` and modifying the value can lead to crashes or unpredictable results, especially when the compiler optimizes `const` values.

---

> **Next Module**: [Module 2 — Namespaces, I/O Streams, Function Overloading & `this` Pointer →](file:///C:/Users/daksh/.gemini/antigravity-ide/brain/92fbddbf-9c4b-4006-8737-6fed254b8644/cpp_notes_module2.md)
