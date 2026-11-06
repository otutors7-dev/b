import java.util.Arrays;

public class InsertionSort {
	
	public static void insertionSort(int arr[], int N) {
		//1. pick elemnts of array one by one (start fron 2nd index)
		for(int i = 1 ; i < N ; i++) {
			int temp = arr[i];
			int j;
			//2. compare picked element with all left neighbors one by one
			for(j = i - 1 ; j >= 0 ; j--) {
				//3. if left neighbor is greater than picked element then move it towards right
				if(arr[j] > temp)
					arr[j+1] = arr[j];
				else
					break;
			}
			//4. insert picked element at its appropriat place
			arr[j+1] = temp;
		}
	}

	public static void main(String[] args) {

		int arr[] = {55, 44, 22, 66, 11, 33};
		
		System.out.println("Array before sort : " + Arrays.toString(arr));
		insertionSort(arr, arr.length);
		System.out.println("Array after sort : " + Arrays.toString(arr));

	}

}
