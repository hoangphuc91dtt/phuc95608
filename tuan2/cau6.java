
import java.util.Random;
import java.util.Scanner;

/**
 * nhap
 */
public class cau6 
{

    public static void main(String[] args) 
    {
        int score = 7; 
        int soCuaMay, soNguoiChoiDoan;
        String ketQua = "";
        Scanner scanner = new Scanner(System.in);

        while (true) 
        {
            Random rd = new Random();
           
            soCuaMay = 1 + rd.nextInt(100);
     
            System.out.print("Moi ban doan so: ");
            soNguoiChoiDoan = scanner.nextInt();
                 
            if (soNguoiChoiDoan != soCuaMay) 
            {
                ketQua = " Ban doan sai!";
                    if (soNguoiChoiDoan<soCuaMay) 
                    {
                        System.out.println("so cua ban nho hon so cua may");
                    }else 
                    {
                        System.out.println("so cua ban lon hon so cua may");

                    }
                System.out.println(ketQua);
                score--;
            } else 
            {
                ketQua = "==> Ban chon dung !";
                System.out.println(ketQua);
                break;
            }
     
            if (score == 0) 
            {
                System.out.println("Game Over!");
                System.out.println("Ban co muon choi lai khong ?");
                System.out.println("Chon 1 de choi lai ");
                System.out.println("Chon 0 de exit ");
                int x =scanner.nextInt();
                if (x==1) 
                {
                    score=7;
                    continue; 
                }if (x==0) 
                {
                    break;
                } else
                {
                    break;
                }
               
            } 
                 
            
        }
    }
}
