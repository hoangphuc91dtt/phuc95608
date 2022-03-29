package HUONGDOITUONG;

public class UyquyenException {

            //tính giá trị phân số: tu/mau
            public static double giaTriPhanSo(int tu, int mau) throws ArithmeticException
           
            {
                if(mau==0)  {
                throw new ArithmeticException("Mau so bang 0");
                }else{
                    return (double) tu/mau;
                }
            }
            public static void main(String[] args) {
            try {
                System.out.println(giaTriPhanSo(3, 2));
            } catch (ArithmeticException e) {
                System.out.println("Loi: "+e.getMessage());
                            
            }
        }
     
}
