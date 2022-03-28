﻿use master
go 

drop database	QUANLYKHOA
create database Quanlykhoa 
go

use Quanlykhoa
go 
--1
drop table KHOA	
create table KHOA (
MAKHOA nvarchar(10) primary key,
TENKHOA nvarchar(50)
)

insert into KHOA(MAKHOA,TENKHOA)
values 
('IT', N'Công nghệ thông tin' ),
('KT', N'Kế toán' ),
('AE', N'Ô tô' )

SELECT *FROM KHOA


--2

create table LOP (
MALOP NVARCHAR(50) primary key,
TENLOP NVARCHAR(50),
MAKHOA nvarchar(10) FOREIGN KEY REFERENCES KHOA(MAKHOA)
)

insert into LOP(MALOP,TENLOP,MAKHOA)
VALUES 
(N'IT001',N'IT21A1A','IT'),
(N'IT002',N'IT21A1B','IT'),
(N'IT003',N'IT21A2A','IT')

SELECT *FROM LOP


--3
DROP table GIAOVIEN
create table GIAOVIEN (
MAGV NVARCHAR(3) PRIMARY KEY,
HOLOT NVARCHAR (20),
TEN NVARCHAR(10),
NGAYSINH DATETIME,
HSL FLOAT,
GIOITINH BIT,
MAKHOA nvarchar(10) FOREIGN KEY REFERENCES KHOA(MAKHOA)
)

insert into GIAOVIEN(MAGV,HOLOT,TEN,NGAYSINH,HSL,GIOITINH,MAKHOA)
values 
('001',N'Nguyễn Quốc ',N'Vương',  '1988/08/09','2.4', '1',  'IT'),
('002',N'Hoàng       ',N'Phúc' ,  '1999/01/01','4.0', '1',  'IT'),
('003',N'Ngô         ',N'Thiện',  '1997/02/15','3.5', '1',  'IT'),
('004',N'Nguyễn      ',N'Nữ'   ,  '1998/01/07','3.1', '0',  'IT')

SELECT *FROM GIAOVIEN

--4

create table MONHOC
(MAMH  NVARCHAR(10) PRIMARY KEY,
TENMH NVARCHAR(30),
TINCHI VARCHAR(5)
)

insert into MONHOC(MAMH,TENMH,TINCHI)
values 
('CSDL',N'Cơ sở dữ liệu','2'),
('PLDC',N'Pháp luật đại cương','3'),
('KTLT',N'Kỹ thuật lập trình','3'),
('NN',N'Ngoại ngữ','3'),
('THVP',N'Tin học văn phòng','3'),
('HQTCSDL',N'Hệ quản trị cơ sở dữ liệu','2'),
('NMN', N'Nhập môn ngành','1')

SELECT * FROM MONHOC


--5
DROP TABLE SINHVIEN
create table SINHVIEN
(
MASV NVARCHAR(5) PRIMARY KEY,
HOLOT NVARCHAR(20),
TEN NVARCHAR(20),
NGAYSINH DATETIME,
GIOITINH BIT,
DIENTHOAI NVARCHAR(20),
DIACHI NVARCHAR(40),
MALOP NVARCHAR(50) FOREIGN KEY REFERENCES LOP(MALOP)
)

insert into SINHVIEN(MASV,HOLOT,TEN,NGAYSINH,GIOITINH,DIENTHOAI,DIACHI,MALOP)
values 
('SV001',N'Hoàng         ',N'Phúc' ,'2002/01/01','1','0862922502',N'Đà Nẵng','IT001'),
('SV002',N'Lê Thị Ngọc   ',N'Huyền','2003/05/27','0','0862922500',N'Gia Lai ','IT002'),
('SV003',N'Lê Thị Bích   ',N'Ngọc' ,'2003/02/02','0','0862922501',N'Đà Nẵng ','IT001'),
('SV004',N'Nguyễn Thị Thùy',N'LINH' ,'2002/12/24','0','0905123126',N'Quảng Trị','IT003'),
('SV005',N'Nguyễn Thị Kiều',N'Diễm' ,'2003/02/01','0','0902728327',N'KonTum  ','IT001')

SELECT *FROM SINHVIEN

--6
DROP TABLE GIANGDAY
create table GIANGDAY
(
MAGV NVARCHAR(3) FOREIGN KEY REFERENCES GIAOVIEN(MAGV),
MAMH NVARCHAR(10) FOREIGN KEY REFERENCES MONHOC(MAMH),
MALOP NVARCHAR(50) FOREIGN KEY REFERENCES LOP(MALOP),
SOTIET VARCHAR(10),
HOCKY VARCHAR(5),
NAMHOC NVARCHAR(20)
PRIMARY KEY (MAGV,MAMH,MALOP)
)

insert into GIANGDAY(MAGV,MAMH,MALOP,SOTIET,HOCKY,NAMHOC)
values
('001','CSDL','IT001','45','2','2021-2022'),
('002','NMN','IT001','15','1','2021-2022'),
('003','HQTCSDL','IT002','45','2','2021-2022'),
('004','CSDL','IT002','15','1','2021-2022'),
('001','NN','IT002','60','2','2021-2022'),
('003','HQTCSDL','IT003','45','1','2021-2022'),
('004','CSDL','IT003','15','2','2021-2022'),
('002','THVP','IT003','60','1','2021-2022')

SELECT*FROM GIANGDAY

--7

DROP TABLE DIEM
create table DIEM
(
MASV NVARCHAR(5) FOREIGN KEY REFERENCES SINHVIEN(MASV),
MAMH NVARCHAR(10) FOREIGN KEY REFERENCES MONHOC(MAMH),
DIEMCHUYENCAN FLOAT,
DIEMTHUONGXUYEN FLOAT,
DIEMGIUAKI FLOAT,
DIEMLAN1 FLOAT(5),
DIEMLAN2 FLOAT(5),
)

insert into DIEM(MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1,DIEMLAN2)
values
('SV001','HQTCSDL','','','','',''),
('SV002','HQTCSDL','','','','',''),
('SV003','HQTCSDL','','','','',''),
('SV004','HQTCSDL','','','','',''),
('SV005','HQTCSDL','','','','',''),

('SV001','CSDL','','','','',''),
('SV002','CSDL','','','','',''),
('SV003','CSDL','','','','',''),
('SV004','CSDL','','','','',''),
('SV005','CSDL','','','','',''),

('SV001','NMN','','','','',''),
('SV002','NMN','','','','',''),
('SV003','NMN','','','','',''),
('SV004','NMN','','','','',''),
('SV005','NMN','','','','','')

SELECT*FROM DIEM


SELECT *FROM KHOA
SELECT *FROM LOP
SELECT *FROM GIAOVIEN
SELECT *FROM MONHOC
SELECT *FROM SINHVIEN
SELECT *FROM DIEM