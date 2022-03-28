
/**
 * Nguoi
 */
public class Nguoi{
    private String ten;
    private int tuoi;
    Nguoi n1;
    Nguoi n2;

    public Nguoi(String ten, int tuoi){
        this.ten =ten;
        if (tuoi>0)
            this.tuoi =tuoi;
        else System.out.println("tuoi nhap k hop le");
    }

    public void inNguoi(){
        System.out.println("ten: " +ten + "  " +"tuoi: " +tuoi);
    }

    public void setTen(String ten){
        this.ten=ten;
    }
    public String getTen(){
        return ten;
    }
    public void setTuoi(int tuoi) {
        if (tuoi>0)
            this.tuoi =tuoi;
        else System.out.println("tuoi nhap k hop le");
    }
    public int getTuoi(){
        return tuoi;
    }
    
}