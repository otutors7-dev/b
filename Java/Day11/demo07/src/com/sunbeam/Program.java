package com.sunbeam;

import java.util.Optional;
import java.util.function.BinaryOperator;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Program {

	public static void main(String[] args) {
		Stream<Integer> strm1 = Stream.of(1, 2, 3, 4, 5); // stream of 5 elements

		Optional<Integer> maxInt = strm1.max((x, y) -> x - y);

		if (maxInt.isPresent()) // true
			System.out.println("max int = " + maxInt.get()); // 5

		System.out.println("max int = " + maxInt.orElse(0)); // 5

		maxInt.ifPresent(i -> System.out.println("max int = " + i)); // 5

		Stream<Integer> strm2 = Stream.empty(); // empty stream
		maxInt = strm2.max((x, y) -> x - y);

		if (maxInt.isPresent()) // false
			System.out.println("max int = " + maxInt.get()); // not execute

		System.out.println("max int = " + maxInt.orElse(0)); // 0
		
		 

	}

}




