import java.util.Arrays;

public class SelectionSort {
	
	public static void selectionSort(int arr[], int N) {
		//1. select one position of array
		for(int i = 0 ; i < N-1 ; i++) {
			//2. find smallest element out of remaining
			int minIndex = i;
			for(int j = i + 1 ; j < N ; j++) {
				// if current element is less than reference element then update minIndex
				if(arr[j] < arr[minIndex])
					minIndex = j;
			}
			//3. swap selected position element and smallest element
			int temp = arr[i];
			arr[i] = arr[minIndex];
			arr[minIndex] = temp;
		}//4. repeat till array is not sorted
	}

	public static void main(String[] args) {

		int arr[] = {44, 11, 55, 22, 66, 33};
		
		System.out.println("Array before sort : " + Arrays.toString(arr));
		selectionSort(arr, arr.length);
		System.out.println("Array after sort : " + Arrays.toString(arr));

	}

}
