package com.util;

import java.util.Comparator;

import com.domain.Employee;

public class SortById implements Comparator<Employee> {

	@Override
	public int compare(Employee x, Employee y) {
		return Integer.compare(x.getEmpid(),y.getEmpid()); 
	}

}
