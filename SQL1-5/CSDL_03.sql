/* ĐỀ KIỂM TRA (60 phút)
Đề: 03
Để biên chế giáo viên cho từng khoa trong các Trường Đai Học, giả sử người ta xây dựng mô hình thực thể - mối quan hệ gồm 2 tập thực thể sau:
GIAOVIEN là tập thực thể các giáo viên, gồm các thuộc tính: MaGV (Mã giáo viên), HoTen (Họ tên), NgaySinh (Ngày sinh), TrinhĐo (Trình độ), DienThoai (Điện thoại), DiaChi (Địa chỉ).
KHOA là tập thực thể các khoa, gồm các thuộc tính: MaKhoa (Mã khoa), TenKhoa (Tên khoa), TruongKhoa (Trưởng khoa), DienThoai (Điện thoại), DiaChi (Địa chỉ).
Ngoài ra, 2 tập thực thể này có mối quan hệ LAMVIEC kèm theo thuộc tính: Ngày làm việc. Cụ thể, (e1,e2)  LAMVIEC nếu giáo viên e1 làm việc tại khoa e2
a.	Vẽ mô hình thực thể - mối quan hệ.
b.	Xác định mô hình dữ liệu quan hệ.
*/
 
 -- Tạo dữ liệu cho câu c

CREATE DATABASE CSDL_De03
go
use CSDL_De03
GO
--1.Tạo bảng KHOA
create table KHOA
(
            MaKhoa         varchar(5)primary key,
			TenKhoa        Nvarchar(50),
			TruongKhoa     Nvarchar(50),
			DienThoai       int,
			DiaChi          Nvarchar(70)
)
--Nhập dữ liệu
insert into KHOA(MaKhoa, TenKhoa, TruongKhoa, DienThoai, DiaChi)
values('IT', N'Công nghệ thông tin', N'Đỗ Sính', '0905456789', N'Đà Nẵng')
insert into KHOA(MaKhoa, TenKhoa, TruongKhoa, DienThoai, DiaChi)
values('AE', N'Công nghệ Ô TÔ', N'Đỗ An', '0505123456', N'Đà Nẵng')
insert into KHOA(MaKhoa, TenKhoa, TruongKhoa, DienThoai, DiaChi)
values('KT', N'Kế Toán', N'Đỗ Bình', '025812345', N'Quảng Nam')

insert into KHOA(MaKhoa, TenKhoa, TruongKhoa, DienThoai, DiaChi)
values('XD', N'Xây dựng', N'Lương Vĩnh Phú', '025812312', N'Đà Nẵng')

--Hiển thị dữ liệu
select*from KHOA
--2.Tạo bảng GIAOVIEN
create table GIAOVIEN
(
          MaGV          varchar(5)primary key,
		  HoTen         Nvarchar(70),
		  NgaySinh       datetime,
		  TrinhDo        Nvarchar(20),
		  DienThoai      int,
		  DiaChi          Nvarchar(70),
		  MaKhoa          varchar(5)foreign key references KHOA(MaKhoa)
)
--Nhập dữ liệu
insert into GIAOVIEN(MaGV, HoTen, NgaySinh, TrinhDo, DienThoai, DiaChi, MaKhoa)
values('GV001', N'Đỗ Sinhs', '2003/08/09', N'Tiến Sỹ', '0905012345', N'Đà Nẵng', 'IT')
insert into GIAOVIEN(MaGV, HoTen, NgaySinh, TrinhDo, DienThoai, DiaChi, MaKhoa)
values('GV002', N'Nguyễn Quốc Vương', '2003/08/09', N'Thạc Sỹ', '0905012345', N'Đà Nẵng', 'IT')
insert into GIAOVIEN(MaGV, HoTen, NgaySinh, TrinhDo, DienThoai, DiaChi, MaKhoa)
values('GV003', N'Đỗ Mạnh', '2003/08/09', N'Thạc sỹ', '0905012345', N'Quảng Bình', 'KT')
insert into GIAOVIEN(MaGV, HoTen, NgaySinh, TrinhDo, DienThoai, DiaChi, MaKhoa)
values('GV004', N'Trần An', '2003/08/09', N'Tiến Sỹ', '0905012345', N'Đà Nẵng', 'AE')

insert into GIAOVIEN(MaGV, HoTen, NgaySinh, TrinhDo, DienThoai, DiaChi, MaKhoa)
values('GV005', N'Đỗ Mạnh Khang', '2003/08/09', N'Tiến Sỹ', '0905012345', N'Quảng Ngãi', 'IT')


--Hiển thị dữ liệu
select*from GIAOVIEN
create table LAMVIEC
(
            MaKhoa     varchar(5) foreign key references KHOA(MaKhoa),
			MaGV       varchar(5) foreign key references GIAOVIEN(MaGV),
			NgayLamViec     datetime
)
--Nhập dữ liệu
insert into  LAMVIEC(MaKhoa,MaGV,NgayLamViec)
values('IT', 'GV001', '2021/05/08')
insert into  LAMVIEC(MaKhoa,MaGV,NgayLamViec)
values('KT', 'GV003', '2021/05/08')

--Hiển thị dữ liệu
select*from LAMVIEC



--1. Hiển thị các giáo viên có địa chỉ ở Đà Nẵng.
	SELECT*
	FROM GIAOVIEN
	where DiaChi like N'Đà Nẵng' 
	
	select HoTen from GIAOVIEN 
WHERE Diachi like N'Đà Nẵng'

--2. Hãy cho biết Mã giáo viên, họ tên giáo viên làm việc tại khoa Công nghệ thông tin mà có Địa chỉ ở Đà nẵng.
	select GIAOVIEN.*
	from KHOA,GIAOVIEN
	where GIAOVIEN.MaKhoa=KHOA.MaKhoa
	and KHOA.TenKhoa=N'Công nghệ thông tin'
	and GIAOVIEN.DiaChi=N'Đà Nẵng'

	SELECT a.MAGV ,a.HoTen ,a.DiaChi
	FROM GIAOVIEN a ,LAMVIEC b,KHOA c
	WHERE a.MAGV =b.MaGV AND b.MAKHOA=c.MAKHOA
	AND c.TenKhoa =N'Công nghệ thông tin'
	AND a.Diachi =N'Đà nẵng'

	
--3. Hãy thống kế số lượng giảng viên theo từng khoa.  
  SELECT A.TENKHOA, COUNT(B.MAKHOA) as SoLuongGiaoVien
		FROM KHOA a left join GIAOVIEN b
		on a.MAKHOA= b.MAKHOA
		GROUP BY  a.TENKHOA

		select TenKhoa ,count(B.MAKHOA) as soluonggianvien
		FROm KHOA a,GIAOVIEN b
		WHERE a.MAKHOA =b.MAKHOA
		GROUp by TenKhoa





--4. Thống kê số lượng giảng viên của khoa công nghệ thông tin
		SELECT A.TENKHOA, COUNT(B.MAKHOA) as SoLuongGiaoVien
		FROM KHOA a, GIAOVIEN b
		WHERE a.MAKHOA= b.MAKHOA
		and A.TENKHOA=N'Công nghệ thông tin'
		GROUP BY  a.TENKHOA


		select c.TenKhoa,count(B.MAKHOA) as soluonggianvienccntt
		From GIAOVIEN b,KHOA c 
		WHERE b.MAKHOA=c.MAKHOA
		AND c.TenKhoa =N'Công nghệ thông tin'
		Group by c.TenKhoa
