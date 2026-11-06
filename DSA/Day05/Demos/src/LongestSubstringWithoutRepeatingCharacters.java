import java.util.HashSet;

public class LongestSubstringWithoutRepeatingCharacters {
	
	public static int lengthOfLongestSubstring(String s) {
		HashSet<Character> set = new HashSet<Character>();
		int len = s.length();
		
		int left = 0, maxLength = 0;
		for(int right = 0 ; right < len ; right++) {
			char ch = s.charAt(right);
			
			while(set.contains(ch)) {
				set.remove(ch);
				left++;
			}
			set.add(ch);
			int length = right - left + 1;
			if(length > maxLength)
				maxLength = length;
		}
		return maxLength;
    }

	public static void main(String[] args) {
		
		String s = "abcabcbb";
		
		int ans = lengthOfLongestSubstring(s);
		System.out.println("ans : " + ans);

	}

}
