package com.sunbeam;

public class Program {

	public static void main(String[] args) {
	   //int[][] arr = new int[3][3]; // default value -- 0 allocated on heap  
	   //int[] arr[] = new int[3][3]; // OK 
	   //int arr[][] = new int[3][3]; // OK 
	
	   //double[][] arr = new double[][] { {1,2,3} , {4,5,6} };
//		double[][] arr = { {1,2,3} , {4,5,6} };
//		
//		for(int row = 0 ; row < 2 ; row++) {
//			for(int col = 0 ; col < 3 ; col++) {
//				System.out.print(arr[row][col] + " ");
//			}
//			System.out.println();
//		}
		//Ragged array -- array of arrays 
		int[][] rarr = new int[4][]; 
		rarr[0] = new int[1];
		rarr[1] = new int[2];
		rarr[2] = new int[3];
		rarr[3] = new int[4];
		
		for(int i = 0 ; i < rarr.length ; i++) {
			for(int j = 0 ; j < rarr[i].length ; j++) {
				System.out.print(rarr[i][j] + " ");
			}
			System.out.println();
		}
		int num = 0; 
		
		for(int i = 0 ; i < rarr.length ; i++) {
			for(int j = 0 ; j < rarr[i].length ; j++) {
				rarr[i][j] = ++num; 
			}
			System.out.println();
		}
		for(int i = 0 ; i < rarr.length ; i++) {
			for(int j = 0 ; j < rarr[i].length ; j++) {
				System.out.print(rarr[i][j] + " ");
			}
			System.out.println();
		}
		
		
		
	}

}





