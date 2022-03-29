
import java.util.Arrays;
import java.util.Scanner;

public class cau2 
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
				System.out.println("Loi nhap so nguyen lon hon 0");

				input.nextLine();
			}
		} while (check || size <= 0);

		int[] a = mangArr(size);

		do 
		{
			try 
			{
				System.out.println("Nhap x");
				x = input.nextInt();
				
				check2 = false;
			} catch (Exception e) 
			{
				System.out.println("Error :Nhap so nguyen");
				input.nextLine();
			}
		} while (check2);
		outputArr(a, size);
		int max = maxArr(a, size);
		System.out.println("Gia tri Max: " + max);
		int min = minArr(a,size);
		System.out.println("Gia tri Min: " + min);
		int count = numberEven(a,size);
		System.out.println("So phan tu chan trong mang la: " + count +" phan tu");

		System.out.print("Cac so nguyen to trong mang la: " );
		for (int i = 0; i < size; i++) 
		{
            if (primeNumber(a[i],size)) 
			{
                System.out.print(a[i] + " ");
            }
        }
		System.out.println();
		  sapxepTangdan(a);
		  timX(a,size,x);
	}

	// Nhập mảng
	public static int[] mangArr(int a) 
	{
		boolean check = true;
		int arr[] = new int[a];
		for (int i = 0; i < a; i++) 
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
					System.out.println("Lỗi");
					input.nextLine();
				}
			} while (check);

		}
		return arr;
	}

	// Xuất mang
	public static void outputArr(int[] a, int b) 
	{
		System.out.println("Mang ban vua nhap la : ");
		for (int i = 0; i < b; i++) 
		{
			System.out.print(a[i] + " ");
		}
		System.out.println();
	}

	// phan tu Max
	public static int maxArr(int[] a, int b) 
	{
		int max = 0;
		for (int i = 0; i < b; i++)
			if (a[i] > max)
				max = a[i];
		return max;
	}
	// phan tu Min
	public static int minArr(int[] a, int b) 
	{
		int min = a[0];
		for (int i = 0; i < b; i++)
			if (a[i] < min)
				min = a[i];
		return min;
	}
	//count phan tu la so chan
	public static int numberEven(int[] a, int b) 
	{
		int count =0;
		for(int i=0; i< b;i++)
			if(a[i]%2==0) count ++;
		return count;
	}
	// Tim so nguyen to
	public static boolean primeNumber(int a,int b)
	{
		if (a <= 2) 
		{
            return false;
        }
		int squareRoot = (int) Math.sqrt(a);
		for (int i = 2; i <= squareRoot; i++) 
		{
            if (a % i == 0) 
			{
                return false;
            }
        }
        return true;

	}
	//Sap xep tang dan
	public static void sapxepTangdan(int[] a) 
	{
		Arrays.sort(a);
		System.out.print("Mang duoc sap xep tang dan la:" +" ");
		System.out.println(Arrays.toString(a));
	}
	// tim gia tri x
	public static void timX(int[] a, int b, int x) 
	{
		for(int i=0;i<b;i++)
			if(a[i]==x){
		System.out.println("Phan tu thu " + i + " trong mang sau khi duoc sap xep co gia tri bang " +x);
		
		
	}

}
}