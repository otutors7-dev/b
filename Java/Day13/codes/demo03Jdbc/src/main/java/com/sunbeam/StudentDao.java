package com.sunbeam; 

import java.util.List;

public interface StudentDao extends AutoCloseable {
	Student findByID(int roll) throws Exception ;
	List<Student> findAll( ) throws Exception; 
	int save(Student s) throws Exception ; 
}
