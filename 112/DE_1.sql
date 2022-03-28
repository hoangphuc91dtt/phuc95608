create database GIAIDE_1
go

use database GIAIDE_1 
go

create table KHACHHANG
(
 MAKH int identity primary key,
 HoTenKH nvarchar(50),
 DienThoai varchar(15),
  DiaChi nvarchar(50)
 )
insert into KHACHHANG values
(N'Nguyễn Văn Anh', '0905123123', N'12 Trần Cao Vân, Đà Nẵng'),
(N'Nguyễn Văn Bình', '0905123103', N'10 Trần Cao Vân,Tam kỳ, Quảng Nam'),
(N'Nguyễn Văn Tuẩn', '0905123104', N'20 Trần Cao Vân, Đà Nẵng')


------------------------------------------------------
create Table MATHANG
(
MaMH int identity primary key,
TenMH nvarchar(50),
DVT nvarchar(100),
SOLuong int
)

insert into KHACHHANG values
(N'Sắt 10', N'Cây', 100),
(N'Sắt 6 ', 'Kg', 1000),
(N'Sắt 8', 'Kg', 1000),
(N'Xi măng', 'Bao', 1000)
-------------------------------------------------------
create table Mua(
 MaKH int foreign key references KHACHHANG(MaKh),
 MaMH int foreign key references MATHANG(MAMH),
  SOLuong int,
 DonGia float,
 primary key (MAKH, MAMH)
 )

insert into Mua values
(1, 1, 100, 120000),
(1, 2, 100, 17000),
(2, 4, 100, 70000)



--1. Liệt kê các khách hàng có địa chỉ ở Đà Năng
   SELECT *
   FROM KHACHHANG
   WHERE DiaChi like N'%Đà Năng'
--2. Liệt kê Mã khách hàng, Họ tên khách hàng, Số lượng, Đơn giá của những khách hàng mua mặt hàng Xi măng.
   SELECT a.MAKH, a.HotenKH, b.Soluong, b.Dongia
   FROM KHÁCHHANG a, MUA b, MATHANG c
   WHERE c. TenMH = N'Xi măng'
  AND a.MAKH = b.MAKH
  AND b.mamh = c.mamh
--3. Thống kê Tên khách hàng, Tổng số lượng mua
   SELECT b.HoTenKH, sum(a.SoLuong) as TongSoLuongMua
   FROM Mua a, KHÁCHHANG b
   WHERE a.MaKH= b.MaKH
  group by b.HoTenKH
--4. Liệt kê các mặt hàng mà không có khách hàng nào mua.
   SELECT * FROM MATHANG WHERE MAMH not in (SELECT MAMH FROM MUA)