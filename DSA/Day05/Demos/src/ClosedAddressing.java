
class HashTable {
	static class Entry{
		private int key;
		private String value;
		public Entry(int k, String v) {
			key = k;
			value = v;
		}
	}
	
	private int SIZE;
	private List<Entry> arr[];
	
	public HashTable(int size) {
		SIZE = size;
		arr = new List[SIZE];
		for(int i = 0 ; i < SIZE ; i++)
			arr[i] = new LinkedList<HashTable.Entry>();
	}
	
	private int h(int k) {
		return k % SIZE;
	}
	
	public void put(int key, String value) {
		//1. find corresponding slot
		int slot = h(key);
		
		//2. if key already exist, then update existing value
		if(!arr[slot].isEmpty()) {
			for(Entry e : arr[slot]) {
				if(key == e.key) {
					e.value = value;
					return;
				}
			}
		}
		
		//3. add entry into linked list of slot
		Entry e = new Entry(key, value);
		arr[slot].add(e);
	}
	
	public String get(int key) {
		//1. find corresponding slot
		int slot = h(key);
		
		//2. if key exist, then return value
		if(!arr[slot].isEmpty()) {
			for(Entry e : arr[slot]) {
				if(key == e.key) {
					return e.value;
				}
			}
		}
		
		//3. if key doesn't exist
		return null;
	}
	
	public void remove(int key) {
		// TODO
	}
	
}


public class ClosedAddressing {

	public static void main(String[] args) {
		
		HashTable tbl = new HashTable(10);
		
		tbl.put(8, "v1");
		tbl.put(3, "v2");
		tbl.put(10, "v3");
		tbl.put(4, "v4");
		tbl.put(6, "v5");
		tbl.put(13, "v6");
		tbl.put(23, "v7");
		tbl.put(26, "v8");
		
		tbl.put(4, "updated");
		
		String value = tbl.get(4);
		if(value != null)
			System.out.println("Key is found and value = " + value);
		else
			System.out.println("Key is not found");
		
	}
}
