#include<iostream>
#include<string>
#include<memory>
using namespace std;
class ArrayIndexOutOfBoundsException
{
private:
	string message;
public:
	ArrayIndexOutOfBoundsException( string message = "Array Index Out Of Bounds Exception")
	{
		this->message = message;
	}
	string getMessage( void )const
	{
		return this->message;
	}
};

class Array
{
private:
	int size;
	int *arr;
public:
	Array( int size = 0 ) : size( size )
	{
		cout<<"Inside ctor"<<endl;
		if( this->size > 0 )
			this->arr = new int[ this->size ];
		else
			this->arr = NULL;
	}
	void acceptRecord( void )
	{
		for( int index = 0; index < this->size; ++ index )
		{
			cout<<"Enter element	:	";
			cin>>this->arr[ index ];
		}
	}
	void printRecord( void )const
	{
		for( int index = 0; index < this->size; ++ index )
			cout<<this->arr[ index ]<<endl;
	}
	~Array( void )
	{
		cout<<"Inside dtor"<<endl;
		if( this->arr != NULL )
		{
			delete[] this->arr;
			this->arr = NULL;
		}
	}
};
class AutoPtr
{
	Array *ptr;
public:
	AutoPtr( Array *ptr )
	{
		this->ptr = ptr;
	}
	Array* operator->( )
	{
		return this->ptr;
	}
    Array& operator*()
	{
		return *(this->ptr);
	}
	~AutoPtr( void )
	{
		delete this->ptr;
	}
};
//*(this->ptr) -> the Array object that ptr points to
int main3( void )
{
	//auto_ptr<Array> ptr( new Array(3));
	//ptr->acceptRecord();
	//ptr->printRecord();
	return 0;
}
int main2( void )
{
	AutoPtr ptr( new Array( 3 ) );
	ptr->acceptRecord(); 	//ptr.operator->()->acceptRecord();
	(*ptr).printRecord( );	//ptr.operator*().printRecord();
	return 0;
}
int main1( void )
{
	Array *ptr = new Array( 3 );
	ptr->acceptRecord();
	ptr->printRecord();
	delete ptr;
    return 0;
}
