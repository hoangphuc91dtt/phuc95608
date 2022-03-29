/* ĐỀ KIỂM TRA (60 phút)
ĐỀ SỐ 1:
Để hỗ trợ bán hàng cho công ty, giả sử người ta xây dựng mô hình thực thể - mối quan hệ gồm 2 tập thực thể sau:
KHACHHANG là tập thực thể các khách hàng đến mua hàng, gồm các thuộc tính: MaKH (Mã khách hàng), HoTenKH (Họ tên khách hàng), DienThoai (Điện thoại), DiaChi (Địa chỉ).
MATHANG là tập thực thể các mặt hàng có trong công ty, gồm các thuộc tính: MaMH (Mã mặt hàng), TenMH (Tên mặt hàng), DVT (Đơn vị tính), SoLuong (Số lượng).
Ngoài ra, 2 tập thực này có mối quan hệ MUA kèm theo các thuộc tính: Số lượng, Đơn giá. Cụ thể, (e1, e2) thuộc MUA nếu khách hàng e1 mua mặt hàng e2
a. Vẽ mô hình thực thể - mối quan hệ.
b. Xác định mô hình dữ liệu quan hệ.
c. Cho trước một cơ sở dữ liệu tương ứng với mô hình dữ liệu quan hệ đã được xác định trong b, hãy trả lời yêu cầu sau bằng câu lệnh SQL:
1. Liệt kê các khách hàng có địa chỉ ở Đà Nẵng
2. Liệt kê Mã khách hàng, Họ tên khách hàng, Số lượng, Đơn giá của những khách hàng mua mặt hàng Xi măng.
3. Thống kê Tên khách hàng, Tổng số lượng mua
4. Liệt kê các mặt hàng mà không có khách hàng nào mua.
*/
--GIẢI:
--a. Vẽ mô hình thực thể nối quan hệ: 
--b. Xác định mô hình dữ liệu quan hệ:
Select a.MAKH , a.HoTenKH , b.SoLuong , b.DonGia ,c.TenMH
From KHACHHANG a, MUA b ,MATHANG c
WHERE   c.TenMH =N'Xi măng'
AND a.MAKH =b.MAKH AND b.mamh  = c.mamh 


SELECT   a.MaKH, a.HotenKH, b.Soluong, b.Dongia 
	FROM      KHACHHANG a, MUA b, MATHANG c
	WHERE    c.TenMH = N'Xi măng'
	AND         a.MaKH = b.MaKH
	AND         b.mamh  = c.mamh 


	

 
-- Tạo cơ sở dữ liệu với tên: CSDL_De01 trước khi thực hiện câu c
drop database CSDL_De01
create database CSDL_De01
 go
 use CSDL_De01
 go
 --Lược đồ quan hệ KHACHHANG(MaKh, HoTenKH, DienThoai, DiaChi)
 -- Ta có khóa là: MaKH
 -- Ta có phụ thuộc hàm: MaKH --> HoTenKH, DienThoai, DiaChi
 -- Lược đồ quan hệ KHACHHANG thuộc dạng chuẩn BCNF

 create table KHACHHANG
 (
	MaKH			 int identity primary key,
	HoTenKH	 nvarchar(50),
	DienThoai	varchar(15),
	DiaChi			nvarchar(50)
 )
 insert into KHACHHANG values(N'Nguyễn Văn Anh', '0905123123', N'12 Trần Cao Vân, Đà Nẵng')
 insert into KHACHHANG values(N'Nguyễn Văn Bình', '0905123103', N'10 Trần Cao Vân,Tam kỳ, Quảng Nam')
 insert into KHACHHANG values(N'Nguyễn Văn Tuấn', '0905123104', N'20 Trần Cao Vân, Đà Nẵng')
 -- hiển thị
 select * from KhachHang
 create table MATHANG
 (
	MaMH			int identity primary key,
	TenMH		nvarchar(50),
	DVT			nvarchar(100),
	SoLuong		int
 )
 -- nhập dữ liệu cho bảng MATHANG
 insert into MATHANG values(N'Sắt 10', N'Cây', 100)
 insert into MATHANG values(N'Sắt 6 ', 'Kg', 1000)
 insert into MATHANG values(N'Sắt 8', 'Kg', 1000)
  insert into MATHANG values(N'Xi măng', 'Bao', 1000)
 create table Mua
 (
	MaKH		int foreign key references KHACHHANG(MaKh),
	MaMH		int foreign key references MATHANG(MaMH),
	SoLuong int,
	DonGia	float,
	primary key (MaKH, MaMH)
 )
 insert into Mua values(1, 1, 100, 120000)
 insert into Mua values(1, 2, 100, 17000)
 insert into Mua values(2, 4, 100, 70000)
 
--c. Cho trước một cơ sở dữ liệu tương ứng với mô hình dữ liệu quan hệ đã được xác định trong b, hãy trả lời yêu cầu sau bằng câu lệnh SQL:
--1. Liệt kê các khách hàng có địa chỉ ở Đà Nẵng
	SELECT *
	FROM KHACHHANG
	WHERE DiaChi  like N'%Đà Nẵng'
--2. Liệt kê Mã khách hàng, Họ tên khách hàng, Số lượng, Đơn giá của những khách hàng mua mặt hàng Xi măng.
	SELECT   a.MaKH, a.HotenKH, b.Soluong, b.Dongia 
	FROM      KHACHHANG a, MUA b, MATHANG c
	WHERE    c.TenMH = N'Xi măng'
	AND         a.MaKH = b.MaKH
	AND         b.mamh  = c.mamh 
--3. Thống kê Tên khách hàng, Tổng số lượng mua
	SELECT  b.HoTenKH, sum(a.SoLuong) as TongSoLuongMua
	FROM Mua a, KHACHHANG b
	WHERE a.MaKH= b.MaKH
	group by  b.HoTenKH



--4. Liệt kê các mặt hàng mà không có khách hàng nào mua.
	SELECT  * 	FROM MATHANG 	WHERE MaMH not in (SELECT MaMH FROM MUA)






