
public class MaximumAverageSubarray1 {

	public static double findMaxAverage(int[] nums, int k) {
		// find sum of first window
		int sum = 0;
		for(int i = 0 ; i < k ; i++)
			sum += nums[i];
		
		// update result of first window into maxSum
		int maxSum = sum;
		
		// slide window by one towards right
		for(int j = k, i = 0 ; j < nums.length ; j++, i++) {
			sum = sum + nums[j] - nums[i];
			
			if(sum > maxSum)
				maxSum = sum;
		}
		
		// find avg and return it
		return (double)maxSum / k;
	}

	public static void main(String[] args) {
		
		int nums[] = {1,12,-5,-6,50,3}, k = 4;
		
		double avg = findMaxAverage(nums, k);
		System.out.println("Max avg : " + avg);
		
	}

}
