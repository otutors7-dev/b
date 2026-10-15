package com.sunbeam;

public class Program {
	private static void delay(int ms) {
		try {
			Thread.sleep(ms);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		class PrintTable extends Thread{
			private int num; 
			
			public PrintTable(int num) {
				this.num = num;
			}

			@Override
			public void run() {
				for(int i = 1 ; i<=10 ; i++) {
					System.out.printf("%d * %d = %d\n",num,i,num * i);
					delay(500); 
				}
			}
			
		}
		PrintTable th1 = new PrintTable(2); 
		th1.setPriority(10);
		th1.start();
		
		PrintTable th2 = new PrintTable(4); 
		th2.setPriority(1);
		th2.start(); 
		

		try {
			th1.join();// calling thread i.e. main will wait for completion given thread i.e. th1 
			th2.join();// calling thread i.e. main will wait for completion given thread i.e. th2 
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println("EXIT");
		
	}

}
