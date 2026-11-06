import java.util.Arrays;

public class TwoSum2 {
	
	public static int[] twoSum(int[] nums, int target) {
        int left = 0, right = nums.length - 1;
        while(left < right) {
        	int sum = nums[left] + nums[right];
        	if(sum == target)
        		return new int[] {left + 1, right + 1};
        	if(sum < target)
        		left++;
        	else
        		right--;
        }
        return null;
    }

	public static void main(String[] args) {
		int nums[] = {2, 7, 11, 15};
		int target = 9;
		
		int ans[] = twoSum(nums, target);
		System.out.println("Ans : " + Arrays.toString(ans));
	}

}
