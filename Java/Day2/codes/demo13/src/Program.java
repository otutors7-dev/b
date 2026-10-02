import java.util.Calendar;
import java.util.Scanner;

class Date{
	private int day; 
	private int month; 
	private int year; 
	
	public void initDate( ) {
		Calendar c = Calendar.getInstance(); 
		day = c.get(Calendar.DATE);
		month = c.get(Calendar.MONTH) + 1; 
		year = c.get(Calendar.YEAR); 
	}
	public void acceptDate( ) {
		Scanner sc = new Scanner(System.in); 
		System.out.print("Day : ");
		day = sc.nextInt(); 
		System.out.print("Month : ");
		month = sc.nextInt(); 
		System.out.println("Year : ");
		year = sc.nextInt(); 
	}
	void printDate( ) {
		System.out.println(day + " / " + month + " / "  + year);
	}
}
public class Program {

	public static void main(String[] args) {
		Date dt1 = new Date(); 
		dt1.initDate();
		dt1.printDate();
		dt1.acceptDate();
		dt1.printDate();

	}

}
