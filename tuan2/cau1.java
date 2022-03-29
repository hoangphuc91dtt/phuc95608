


import java.util.Scanner;

public class cau1  
{
	public static Scanner input = new Scanner(System.in);
	public static void main(String[] args) 
	{
		boolean check = true;
		boolean check2 = true;
		int size = 0;
		int x = 0;
		do 
		{
			try 
			{
				System.out.println("Nhap chieu dai mang");
				size = input.nextInt();

				check = false;
			} catch (Exception e) 
			{
				System.out.println("Error :Nhap so nguyen");

				input.nextLine();
			}
		} while (check||size<=0);


		do 
		{
			try 
			{
				System.out.print("Nhap x = ");
				x = input.nextInt();
				
				check2 = false;
			} catch (Exception e) 
			{
				System.out.println("Error :Nhap so nguyen");
				input.nextLine();
			}
		} while (check2);
		
		int[] arr = mangArr(size);
		xuatArray(arr,size,x);
		
		
	}
	public static int[] mangArr(int size) 
	{
		boolean check = true;
		int arr[] = new int[size];
		for (int i = 0; i < size; i++) 
		{
        check = true;
			do 
			{
				try 
				{
					System.out.print("Nhap mang arr[" + i + "]" + " =");
					arr[i] = input.nextInt();
					check = false;
				} catch (Exception e) 
				{
					System.out.println("Error");
					input.nextLine();
				}
			} while (check);

		}
		return arr;
	}
	
	public static int[] xuatArray(int[] a,int size,int x) 
	{
		
		for (int i = 0; i < size-1; i++) 
		{
			if((a[i]+a[i+1])==x) 
			{
				System.out.println("Tong cua " +a[i]+" và " +a[i+1]+"= " + x);
			}
		}
		return null;
	}
	

}