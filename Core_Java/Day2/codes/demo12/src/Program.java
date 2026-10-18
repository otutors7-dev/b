import java.util.Calendar;


public class Program {

	public static void main(String[] args) {
		Calendar c = Calendar.getInstance(); 
		int day = c.get(Calendar.DATE); 
		int month = c.get(Calendar.MONTH)+1; 
		
		int year = c.get(Calendar.YEAR); 
		
		System.out.println(day  + " /" + month + " /" + year);
	}

}
