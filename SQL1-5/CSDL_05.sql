/* ĐỀ KIỂM TRA (60 phút)
Đề 05:
Để hỗ trợ bán hàng cho công ty, giả sử người ta xây dựng mô hình thực thể - mối quan hệ gồm 2 tập thực thể sau:
KHACHHANG là tập thực thể các khách hàng đến mua hàng, gồm các thuộc tính: MaKH (Mã khách hàng), HoTenKH (Họ tên khách hàng), DienThoai (Điện thoại), DiaChi (Địa chỉ).
MATHANG là tập thực thể các mặt hàng có trong công ty, gồm các thuộc tính: MaMH (Mã mặt hàng), TenMH (Tên mặt hàng), DVT (Đơn vị tính), SoLuong (Số lượng).
Ngoài ra, 2 tập thực này có mối quan hệ MUA kèm theo các thuộc tính: Số lượng, Đơn giá. Cụ thể, (e1, e2) thuộc MUA nếu khách hàng e1 mua mặt hàng e2
a. Vẽ mô hình thực thể - mối quan hệ.
b. Xác định mô hình dữ liệu quan hệ.
 */
 -- Tạo dữ liệu cho câu c
-- Tạo cơ sở dữ liệu với tên: CSDL_De05
create database CSDL_De05
 go
 use CSDL_De05
 go
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

 create table MATHANG
 (
	MaMH				int identity primary key,
	TenMH			nvarchar(50),
	DVT				nvarchar(100),
	SoLuong			int,
	DonGia			float,
	GiamGia			bit,
	TienGiamGia  float
 )
 -- nhập dữ liệu cho bảng MATHANG
 -- Lưu ý: quy định GiamGia =1 thì mặt hàng đó giảm giá

 insert into MATHANG values(N'Sắt 10', N'Cây', 100, 140000, 0,0)
 insert into MATHANG values(N'Sắt 6 ', 'Kg', 1000, 17000, 1, 1000)
 insert into MATHANG values(N'Sắt 8', 'Kg', 100,18000, 1, 1000)
 insert into MATHANG values(N'Xi măng', 'Bao', 1000, 75000,1, 5000)
  
 create table Mua
 (
	MaKH	 int foreign key references KHACHHANG(MaKh),
	MaMH	 int foreign key references MATHANG(MaMH),
	SoLuong int,
	DonGia float,
	primary key (MaKH, MaMH)
 )
 insert into Mua values(1, 1, 100, 120000)
 insert into Mua values(1, 2, 100, 17000)
  insert into Mua values(2, 4, 100, 70000)
 
--c. Cho trước một cơ sở dữ liệu tương ứng với mô hình dữ liệu quan hệ đã được xác định trong b, hãy trả lời yêu cầu sau bằng câu lệnh SQL:
--1. Liệt kê các khách hàng có địa chỉ ở Quảng Nam
	SELECT *
	FROM KHACHHANG
	WHERE DiaChi like N'%Quảng Nam'

--2. Liệt kê Mã khách hàng, Họ tên khách hàng, Số lượng, Đơn giá của những khách hàng ở Đà Nẵng mua mặt hàng Gạch đồng tâm.
	SELECT   a.MaKH, a.HotenKH, b.Soluong, b.Dongia 
	FROM      KHACHHANG a, MUA b, MATHANG c
	WHERE    c.TenMH = N'Gạch đồng tâm'
	AND        a.DiaChi like N'%Đà Nẵng'
	AND          a.MaKH = b.MaKH
	AND          b.mamh  = c.mamh
--3. Thống kê tổng mặt hàng mua của mỗi khách hàng gồm các cột sau: Họ tên khách hàng, Tổng số lượng mua, của những khách hàng có địa chỉ ở Quảng Nam.
	select a.HOTENKH, sum(b.SoLuong) as TongSoLuong
	 from KhachHang a, Mua b
	 where a.MAKH= b.MaKH
	 and a.DiaChi like N'%Quảng Nam'
	 group by a.HOTENKH

--4. Liệt kê các mặt hàng Giảm giá mà không có khách hàng mua.
	SELECT   * 
	FROM MATHANG
	WHERE GiamGia=1
	AND MaMH not in (SELECT MaMH FROM MUA)


