import java.util.Arrays;

public class MergeSort {
	
	public static void mergeSort(int arr[], int left, int right) {
		//0. stop if partition contains single element
		if(left == right)
			return ;
		//1. divide array into two parts
		int mid = (left + right) / 2;
		//2. sort both partitions individually
		mergeSort(arr, left, mid);
		mergeSort(arr, mid + 1, right);
		//3. merge sorted partitions into temp array
		int size = right - left + 1;
		int temp[] = new int[size];
		int i = left, j = mid + 1, k = 0;
		//3.1 compare elements of left and right partitions
		while(i <= mid && j <= right) {
			// if ith element is smaller than jth element
			if(arr[i] < arr[j]) {
				temp[k] = arr[i];
				k++;
				i++;
			}
			// if jth element is smaller than ith element
			else {
				temp[k] = arr[j];
				k++;
				j++;
			}
		}
		//3.2 if right partition is finished
		while(i <= mid) {
			temp[k] = arr[i];
			k++;
			i++;
		}
		//3.3 if left partition is finished
		while(j <= right) {
			temp[k] = arr[j];
			k++;
			j++;
		}
		//4. overwrite temp array into original
		for(i = 0 ; i < size ; i++)
			arr[left + i] = temp[i];
	}

	public static void main(String[] args) {
		
		int arr[] = {7, 1, 9, 6, 2, 8, 3, 5, 4};
		
		System.out.println("Array before sort : " + Arrays.toString(arr));
		
		mergeSort(arr, 0, arr.length-1);
		
		System.out.println("Array after sort : " + Arrays.toString(arr));
	}

}
