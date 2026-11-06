
class HashTable{
	static class Entry{
		private int key;
		private String value;
		
		public Entry(int k, String v) {
			key = k;
			value = v;
		}
	}
	
	
	private Entry arr[];
	private int SIZE;
	
	public HashTable(int size) {
		SIZE = size;
		arr = new Entry[SIZE];
	}
	
	private int h(int k) {
		return k % SIZE;
	}
	
	private int h(int k, int i) {
		return (h(k) + i) % SIZE;
	}
	
	public void put(int key, String value) {
		//1. find slot for given key
		int slot = h(key);
		int i = 1;
		
		//2. if slot is not empty, means collision has occured
		while(arr[slot] != null) {
			//2.1 if key value pair is present, will update value
			if(key == arr[slot].key) {
				arr[slot].value = value;
				return;
			}
			//2.2 if key value pair is not present, will go for probe
			slot = h(key, i++);
		}
		
		//3. add key value pair at index slot
		arr[slot] = new Entry(key, value);
	}
	
	public String get(int key) {
		//1. find slot for given key
		int slot = h(key);
		int i = 1;
		
		//2. if slot is not empty, means collision has occured
		while(arr[slot] != null) {
			//2.1 if key value pair is present, will return value
			if(key == arr[slot].key) {
				return arr[slot].value;
			}
			//2.2 if key value pair is not present, will go for probe
			slot = h(key, i++);
		}
		
		//3. if key is not found
		return null;
	}
	
	public String remove(int key) {
		// TODO
		return null;
	}
}




public class OpenAddressing {

	public static void main(String[] args) {
		
		HashTable tbl = new HashTable(10);
		
		tbl.put(8, "v1");
		tbl.put(3, "v2");
		tbl.put(4, "v3");
		tbl.put(6, "v4");
		tbl.put(10, "v5");
		tbl.put(13, "v6");
		tbl.put(6, "updated");
		
		
		String value = tbl.get(6);
		if(value != null)
			System.out.println("Key is found and value : " + value);
		else
			System.out.println("Key is not found");
	}

}











