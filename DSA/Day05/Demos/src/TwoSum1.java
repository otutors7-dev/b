import java.util.Arrays;
import java.util.HashMap;

public class TwoSum1 {
	
	public static int[] twoSum(int[] nums, int target) {
        // craete a hashmap
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		// traverse array from 0 to N-1
		for(int i = 0 ; i < nums.length ; i++) {
			// find diff
			int diff = target - nums[i];
			// check if diff is present in hashmap or not
			int j = map.getOrDefault(diff, -1);
			if(j != -1)
				return new int[] {i, j};
			else
				map.put(nums[i], i);
		}
		// pair is not found
		return null;
    }

	public static void main(String[] args) {
		int nums[] = {2, 7, 11, 15};
		int target = 9;
		
		int ans[] = twoSum(nums, target);
		System.out.println("Ans : " + Arrays.toString(ans));
	}

}
