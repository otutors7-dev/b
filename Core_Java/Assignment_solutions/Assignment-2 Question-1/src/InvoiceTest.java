class Invoice
{
	private String partNumber;
	private String partDescription;
	private int quantity;
	private double price;
	
	public Invoice()
	{
		partNumber ="a2";
		partDescription ="Hammer";
		quantity = 2;
		price =199;
	}
	public Invoice(String partNumber, String partDescription, int quantity, double price)
	{
		this.partNumber = partNumber;
		this.partDescription = partDescription;
		setQuantity(quantity);
		setPrice(price);
	}
	public String getPartNumber() {
		return partNumber;
	}
	public void setPartNumber(String partNumber) {
		this.partNumber = partNumber;
	}
	public String getPartDescription() {
		return partDescription;
	}
	public void setPartDescription(String partDescription) {
		this.partDescription = partDescription;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) 
	{
		if(quantity<0)
		{
			this.quantity =0;
			System.out.println("Quantity can't be Negative");
		}
		else
		{
			this.quantity = quantity;

		}
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) 
	{
		if(price<0.0)
		{
			this.price =0.0;
			System.out.println("Price can't be Negative");
		}
		else
		{
			this.price = price;
		}
	}
	void amount()
	{
		double amount = price*quantity;
		System.out.println("Total Amount = "+amount);
	}
}

public class InvoiceTest
{
	public static void main(String[] args)
	{
		Invoice i =new Invoice();
		i.amount();
		
		Invoice i1 = new Invoice("b","Hat",6,8);
		i1.amount();

		
	}
}
