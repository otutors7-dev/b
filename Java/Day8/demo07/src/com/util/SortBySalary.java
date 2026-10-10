package com.util;

import java.util.Comparator;

import com.domain.Employee;

public class SortBySalary implements Comparator<Employee> {

	@Override
	public int compare(Employee x, Employee y) {
		return Double.compare(x.getSalary(),y.getSalary()); 
	}

}
