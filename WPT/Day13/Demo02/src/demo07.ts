function swap<T>(obj1: T, obj2: T) {
    console.log('obj1 - ' + obj1)
    console.log('obj2 - ' + obj2)
}

swap(10, 20)
swap('a', 'b')
swap<string>('sunbeam', 'infotech')
swap('sunbeam', 10)

// <T>void displayArray(T[] arr);

class Employee {
    name: string

    constructor(name: string) {
        this.name = name
    }
}

class Stack<T> {
    top: number = -1;
    arr: T[] = []

    push(e: T) {

    }

    pop(): T {
        this.top--;
        return this.arr[0]
    }


    peek(): T {
        return this.arr[0]
    }
}

const s1: Stack<number> = new Stack()
s1.push(10)

const s2: Stack<string> = new Stack()
s2.push('sunbeam')