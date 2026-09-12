#include<iostream> 
#include<fstream>
using namespace std; 
void write( )
{
    ofstream fout("File1.txt");
    fout<<"Hello world"; 
    fout.close( );    
}
void read( )
{
    string line; 
    ifstream fin("File1.txt"); 
    while(getline(fin,line))
    {
        cout<<line<<endl; 
    }
    fin.close( ); 
    
}
int main()
{
    //write( );
    read( );  
    return 0;
}
