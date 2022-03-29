import java.util.Scanner;

public class nhap {
    
    
    private static Scanner sc = new Scanner(System.in);

    public static void bai_4(String strs) 
    { 
        
        int upperCount = 0;
        int lowerCount = 0;
        int numberCount = 0;
        int blankCount = 0;
        for (char charAt : strs.toCharArray()) 
        {
            int toNumber = (int) charAt;
            if (toNumber == 32) 
            {
                blankCount++;
            } else if (48 <= toNumber && toNumber <= 57) 
            {
                numberCount++;
            } else if (65 <= toNumber && toNumber <= 90) 
            {
                upperCount++;
            } else if (97 <= toNumber && toNumber <= 122) 
            {
                lowerCount++;
            }
        }
        // in hoa 
        System.out.println("Uppercase   " + upperCount);
        //in thuong
        System.out.println("Lowercase  " + lowerCount);
        //so 
        System.out.println("Number   " + numberCount);
        // khoang trong
        System.out.println("blankCount  " + blankCount);
    }

    public static void main(String[] args) 
    {
        System.out.println("nhap chuoi :");
        String chuoi = sc.nextLine();
        bai_4(chuoi);

    }
}
