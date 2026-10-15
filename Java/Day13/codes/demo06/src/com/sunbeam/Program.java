package com.sunbeam;


//thread is by default non-daemon thread (foreground)
//daemon (background) threads are for giving services to non-daemon (foreground) threads.
//when all non-daemon threads in a java process are terminated, the JVM exits.
//due to this all daemon threads are automatically (forcefully) terminated.

//main thread is non-daemon thread (foreground)
public class Program {
	public static void delay(int ms) {
		try {
			Thread.sleep(ms);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	public static void main(String[] args) {
		// thread creation - method 1
		//step1: create a new class inherited from thread class and override its run() method.
		//step2: create object of that thread class and call its start() method.
		class MyThread extends Thread{
			@Override
			public void run() {
				for(int i = 1 ; i<=7 ; i++) {
					System.out.println(" MY:  "+i);
					delay(1000); 
				}
			}

			
		}
		MyThread th1 = new MyThread(); 
		th1.setDaemon(false); // default 
		th1.start();
		
		
		// thread creation - method 2
		//step1: create a new class inherited from Runnable interface and implement its run() method.
		//step2: create object of Thread class with the object of above Runnable class and call thread's start() method
		class  YourThread implements Runnable{

			@Override
			public void run() {
				for(int i = 1 ; i<=10 ; i++) {
					System.out.println("Your: "+i);
					delay(1000); 
				}
				
			}
			
		}
		Thread th2 = new Thread(new YourThread()); 
		th2.setDaemon(true);
		th2.start();
		
		for(int i = 1 ; i<=5; i++) {
			System.out.println("Main: "+i);
			delay(1000); 
		}
		

	}

}



