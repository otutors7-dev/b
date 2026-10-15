package com.sunbeam;

public class Program {
	
	/*
	// race condition -- when deposit() and withdraw() methods are not declared synchronized
	public static void main(String[] args) {
		Account acc = new Account(1, "Savings",10000.00); 
		
		class DepositThread extends Thread{
			@Override
			public void run() {
				for(int i = 1 ; i<=10000; i++) {
					acc.deposit(100);
					System.out.println("Balance after Deposit : " + acc.getBalance());
				}
			}
		}
		DepositThread dt  = new DepositThread(); 
		dt.start();
		
		class WithDrawThread extends Thread{
			@Override
			public void run() {
				for(int i = 1 ; i<=10000; i++) {
					acc.withdraw(100);
					System.out.println("Balance after WithDraw : " + acc.getBalance());
				}
			}
		}
		WithDrawThread wt = new WithDrawThread(); 
		wt.start();
		
		
		try {
			dt.join();
			wt.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println("Final Balance : " +acc.getBalance());

	}*/
	
	/*
	// avoid race condition -- when deposit() and withdraw() methods are not declared synchronized
	// using "synchronized" block
		public static void main(String[] args) {
			Account acc = new Account(1, "Savings",10000.00); 
			
			class DepositThread extends Thread{
				@Override
				public void run() {
					for(int i = 1 ; i<=10000; i++) 
					{
						synchronized (acc) 
						{ // LOCK 
							acc.deposit(100);
							System.out.println("Balance after Deposit : " + acc.getBalance());
						} // UNLOCK
					}
				}
			}
			DepositThread dt  = new DepositThread(); 
			dt.start();
			
			class WithDrawThread extends Thread{
				@Override
				public void run() {
					for(int i = 1 ; i<=10000; i++) 
					{
						synchronized (acc) 
						{ // LOCK 
							acc.withdraw(100);
							System.out.println("Balance after WithDraw : " + acc.getBalance());
						} // UNLOCK
					}
				}
			}
			WithDrawThread wt = new WithDrawThread(); 
			wt.start();
			
			
			try {
				dt.join();
				wt.join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			System.out.println("Final Balance : " +acc.getBalance());

		}*/
	
	// race condition -- when deposit() and withdraw() methods are not declared synchronized
		public static void main(String[] args) {
			Account acc = new Account(1, "Savings",10000.00); 
			
			class DepositThread extends Thread{
				@Override
				public void run() {
					for(int i = 1 ; i<=10000; i++) {
						acc.deposit(100);
						System.out.println("Balance after Deposit : " + acc.getBalance());
					}
				}
			}
			DepositThread dt  = new DepositThread(); 
			dt.start();
			
			class WithDrawThread extends Thread{
				@Override
				public void run() {
					for(int i = 1 ; i<=10000; i++) {
						acc.withdraw(100);
						System.out.println("Balance after WithDraw : " + acc.getBalance());
					}
				}
			}
			WithDrawThread wt = new WithDrawThread(); 
			wt.start();
			
			
			try {
				dt.join();
				wt.join();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			System.out.println("Final Balance : " +acc.getBalance());

		}
	

}
