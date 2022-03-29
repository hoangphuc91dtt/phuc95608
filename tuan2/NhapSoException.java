package HUONGDOITUONG;

import java.util.Scanner;
public class NhapSoException {
    public static void main(String[] args) {
        System.out.print("Nhap vao mot so nguyen: ");
        Scanner sc=new Scanner(System.in);
        int so=0;
        boolean kiemtra=false;
        do{

            try {
            so=sc.nextInt(); //nhap sai loi la do dong nay 
            kiemtra=false;
            } 
            catch (Exception e) {
            System.out.println("Ban nhap sai roi, nho nhap so nguyen");
            sc.nextLine(); //bo qua dong loi 
            } 
            
        }
        while(kiemtra || so <2); //kiem tra= true thi lap lai loi 
        System.out.println("Ban vua nhap so: "+ so);
        sc.close();
    }
}
