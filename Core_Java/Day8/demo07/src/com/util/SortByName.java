package com.util;

import java.util.Comparator;

import com.domain.Employee;

public class SortByName implements Comparator<Employee> {

	@Override
	public int compare(Employee x, Employee y) {
		return x.getName().compareTo(y.getName()); 
	}

}
