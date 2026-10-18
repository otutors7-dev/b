import java.util.Calendar;
class Date
{
	private int day;
	private int month;
	private int year;
	
	public Date() 
	{
		Calendar c = Calendar.getInstance();
		day = c.get(Calendar.DATE);
		month = c.get(Calendar.MONTH)+1;
		year = c.get(Calendar.YEAR);
	}
	public Date(int day, int month, int year)
	{
		this.day =day;
		this.month = month;
		this.year =year;
	}
	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
	void printDate() {
		System.out.println(day + " / " + month + " / "  + year);
	}
}

public class DateTest
{
	public static void main(String[] args)
	{
		Date d = new Date(1,1,2000);
		System.out.println("Default Date");
		d.printDate();
		
		Date d1 = new Date();
		System.out.println("Birthday");
		d1.setDay(14);
		d1.setMonth(2);
		d1.setYear(2003);
		d1.printDate();
		
		System.out.println("Today's Date");
		Date d2 = new Date();
		d2.printDate();		
		
		System.out.println("Month = " + d.getMonth());

	}
}
