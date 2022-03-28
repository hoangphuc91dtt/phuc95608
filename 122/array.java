

import java.util.Scanner;

public class array {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int sum = 0 ;
        int[] number = new int[5];
        
        for (int i = 0; i < number.length; i++) {
            System.out.print("nhap so thu " + (i+1) + " : ");
            number[i] = input.nextInt();
            sum = sum + number[i];
        }
        System.out.println("sum = "+ sum);
    }
}
