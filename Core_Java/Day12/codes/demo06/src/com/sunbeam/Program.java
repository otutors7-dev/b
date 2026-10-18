package com.sunbeam;
enum WeekDays{
	MONDAY{
	  @Override
	public String toString() {
		return "Monday"; 
	}	
	},
	TUESDAY{
		@Override
		public String toString() {
			return "Tuesday"; 
		}
	},
	WEDNESDAY{
		@Override
		public String toString() {
			return "Wednesday"; 
		}
	},
	THURSDAY{
		@Override
		public String toString() {
			return "Thursday"; 
		}
	}
}
public class Program {

	public static void main(String[] args) {
		for(WeekDays w : WeekDays.values()) {
			System.out.println(w.ordinal() + "." + w.name() + "." + w.toString());
		}

	}

}
