use master 
go 

 create database Quanlibanhang
 go 
 use Quanlibanhang

 drop table Nhanvien
 create table Nhanvien (
IdNhanVien NVARCHAR (3) primary key ,
HoLot nvarchar (20),
Ten nvarchar (10),
GioiTinh bit ,
NgaySinh datetime ,
HeSoLuong float ,
NgayLamViec nvarchar(30)
)

insert into Nhanvien(IdNhanVien, HoLot,Ten,GioiTinh,NgaySinh,HeSoLuong, NgayLamViec)
values 
('NV1',N'Hoàng '     , N'Phúc'  ,'1','2002-01-01','2.7',N'2018-12-16'),
('NV2',N'Nguyễn Thị ', N'Phương','0','2003-01-02','1.7',N'2022-01-16'),
('NV3',N'Nguyễn '    , N'Huyền' ,'0','2003-02-02','2.5',N'2020-07-01')

select *from Nhanvien

drop table KhachHang
create table KhachHang (
IdKhacHHang NVARCHAR (3) primary key ,
TenKhachHang nvarchar (30),
DienThoai nvarchar (20),
DiaChi nvarchar (50)
)

insert into KhachHang(IdKhacHHang,TenKhachHang,DienThoai,DiaChi)
values
('KH1',N'Nguyễn Thọ',N'0906002822',N'Đà Nẵng'),
('KH2',N'Nguyễn Văn Khách',N'0902239907',N'Hồ Chí Minh'),
('KH3',N'Nguyễn Thọ',N'0728923821',N'Hà Nội')


select *from KhachHang

create table ChungTu (
IdChungTu nvarchar(3) primary key ,
IdNhanvien  NVARCHAR(3) foreign key references NhanVien(Idnhanvien),
IdKhachHang NVARCHAR(3) foreign key references KhachHang(IdKhachHang),
LoaiChungTu nvarchar (20),
NgayLap nvarchar (10),
MoTa nvarchar(50)
)

insert into ChungTu(IdChungTu,IdNhanvien,IdKhachHang,LoaiChungTu,NgayLap,MoTa)
values 
('001','NV1','KH1',N'biên lai','2021-12-15',N'màu đỏ'),
('002','NV1','KH2',N'biên lai','2021-12-11',N'màu xanh'),
('003','NV2','KH3',N'hóa đơn','2021-12-16',N'màu trắng'),
('004','NV3','KH3',N'hóa đơn','2021-12-10',N'màu tím')

select *from ChungTu


create table SanPham (
IdSanPham nvarchar(3) primary key ,
TenSanPham nvarchar (20),
SoLuong int ,
DonGia float 
)

insert into SanPham(IdSanPham,TenSanPham,SoLuong,DonGia)
values  
('SP1',N'máy lạnh','1','3200000'),
('SP2',N'tivi','1','1400000'),
('SP3',N'máy quạt','2','300000')

select *from SanPham

create table ChiTietChungTu (
IdChungTu nvarchar(3) foreign key references ChungTu(IdChungTu),
IdSanPham nvarchar(3) foreign key references SanPham(IdSanPham),
SoLuong int ,
DonGia float 
)

insert into ChiTietChungTu(IdChungTu,IdSanPham,SoLuong,DonGia)
values
('001','SP1','1','3200000'),
('002','SP3','1','300000'),
('004','SP2','1','1400000') 

select *from ChiTietChungTu