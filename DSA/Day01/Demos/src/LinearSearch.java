import java.util.Scanner;

public class LinearSearch {
	
	public static int linearSearch(int arr[], int key){
		//2. traverse array from one end to another
		for(int i = 0 ; i < arr.length ; i++) {
			//3. compare key with current element
			if(key == arr[i])
				return i;
		}
		//4. if array is finished, key is not found
		return -1;
	}

	public static void main(String[] args) {

		int arr[] = {88, 33, 66, 99, 11, 77, 22, 55, 14};
		
		Scanner sc = new Scanner(System.in);
		
		//1. take key from user
		System.out.print("Enter key to be searched : ");
		int key = sc.nextInt();
		
		int index = linearSearch(arr, key);
		if(index != -1)
			System.out.println("Key is found at index " + index);
		else
			System.out.println("Key is not found");
		
		
		sc.close();

	}

}
