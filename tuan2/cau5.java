import java.util.Scanner;

public class cau5 
{
	
	public static void main(String[] args) 
    {
		Scanner input = new Scanner(System.in);
		System.out.println("Nhap vao xau ki tu");
		String xau = input.nextLine();
		checkText(xau);
	} 
	public static void checkText(String xau) 
    {
		int count =0;
		for(int i=0;i<xau.length();i++) 
        {
			if(xau.charAt(i)=='c'&& xau.charAt(i+1)=='h') count++;
		}
		System.out.println("so lan xuat hien ki tu : "+ count + " lần");
	}
}

