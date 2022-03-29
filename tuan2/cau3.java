import java.util.Scanner;
public class cau3 
{
    static int n,m,matrix[][];
    public static void nhapmatrix()
    {
        Scanner input = new Scanner(System.in);
        System.out.println("nhap so hang: ");
        n=input.nextInt();
        System.out.println("nhap so cot: ");
        m=input.nextInt();
        matrix=new int[n][m];
        for (int i = 0; i < n; i++) 
        {
            for (int j = 0; j < m; j++) 
            {
                System.out.print("  a["+i+","+j+"]=");
                matrix[i][j]=input.nextInt();
            }
            System.out.println();
        }
    }
    public static void xuatmatrix()
    {
        for (int i = 0; i < n; i++) 
        {
            for (int j = 0; j < m; j++) 
            {
            System.out.print(matrix[i][j] +"  ");
        }
        System.out.println("");
        }
    }
    public static int minmatrix()
    {
        int min=matrix[0][0];
        for (int i = 0; i < n; i++) 
        {
            for (int j = 0; j < m; j++) 
            {
                if (matrix[i][j]<min) 
                {
                    min=matrix[i][j];
                }
            }
        }
        return min;
    }
    public static int minle()
    {
        int minle=1000;
        for (int i = 0; i < n; i++) 
        {
            for (int j = 0; j < m; j++) 
            {
                if ((matrix[i][j]<minle)&&(matrix[i][j]%2==1)) 
                {
                minle=matrix[i][j];
                }
            }
        }
        return minle;
    }
    public static int tongdong(int row)
    {
        int tong=0;
        for (int i = 0; i < m; i++) 
        {
            tong+=matrix[row][i];
        }
        return tong;
    }
    /**
   
    */
    public static void main(String[] args) 
    {
        int max = tongdong(0),chiso=0;
        nhapmatrix();
        xuatmatrix();
        System.out.println("phan tu nho nhat "+minmatrix());
        System.out.println("phan tu le nho nhat: " + minle());
        for (int i = 0; i < n; i++) 
        {
            if (max<tongdong(i)) 
            {
            max=tongdong(i);
            chiso=i;
            }
        }
        System.out.println("dong co tong lon nhat la dong "+chiso+" co gia tri:"+max);
    }
}