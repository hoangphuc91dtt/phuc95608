use master 
go

drop database THIHSG
create database THIHSG 
go

use THIHSG
go

drop table KHOA
create table KHOA(
MAKHOA NVARCHAR(10) primary key,
TENKHOA nvarchar(50),
DIENTHOAI nvarchar(10)
)

insert into KHOA(MAKHOA,TENKHOA,DIENTHOAI)
values 
('CNTT',N'Công nghệ thông tin',N'0990123456'),
('NN'  ,N'Ngoại ngữ'		  ,N'0990123456'),
('CNMT',N'Công nghệ máy tính' ,N'0990123456')

select 
MAKHOA AS [Mã khoa],
TENKHOA AS [Tên khoa],
DIENTHOAI AS [Điện thoại]
from KHOA



--2 
drop table LOP
create table LOP (
MALOP NVARCHAR(10) primary key,
TENLOP nvarchar(50),
MAKHOA NVARCHAR(10) foreign key references KHOA(MAKHOA)
)

insert into LOP(MALOP,TENLOP,MAKHOA)
values 
('ITA1',N'IT21A1A','CNTT'),
('ITA2',N'IT21A2A','CNTT'),
('ITB1',N'IT21A1B','CNTT'),
('NNA1',N'NN21A1A','NN'),
('NNA2',N'NN21A1A','NN'),
('NNA3',N'NN21A3A','NN'),
('CNMTA1',N'CNMT21A1A','CNMT'),
('CNMTA2',N'CNMT21A2A','CNMT')

select 
MALOP AS [Mã lớp],
TENLOP AS [Tên lớp],
MAKHOA AS [Mã khoa]
from LOP



--3
drop table THISINH
create table THISINH(
MASV NVARCHAR(10) primary key ,
HOTEN nvarchar (50),
NGAYSINH datetime ,
MALOP NVARCHAR(10) foreign key references LOP(MALOP)
)

insert into THISINH(MASV,HOTEN,NGAYSINH,MALOP)
values 
('SV1',N'Hoàng Phúc'        ,01/01/2002,'ITA1'),
('SV2',N'Phan Thanh Khánh Duy'    ,01/01/2003,'ITA1'),
('SV3',N'Văn Thị Thùy Linh ',25/12/2002,'ITA1'),
('SV4',N'Nguyễn Quốc '		,01/07/2003,'CNMTA1'),
('SV5',N'Nguyễn Thị Hồng '  ,22/03/2003,'NNA2')

select 
MASV AS [Mã sinh viên],
HOTEN AS [Họ tên],
NGAYSINH AS [Ngày sinh],
MALOP AS [Mã lớp]
from THISINH



--4
create table MONTHI (
MAMT NVARCHAR(10)primary key,
TENMONTHI nvarchar(50)
)

insert into MONTHI(MAMT,TENMONTHI)
values 
('KTLT',N'Kỹ thuật lập trình'),
('MMT' ,N'Mạng máy tính'     ),
('VB' ,N'Visual basic'),
('CSDL' ,N'Cơ sở dũ liệu')

  


--5
drop table KETQUA
create table KETQUA ( 
MASV NVARCHAR(10) foreign key references THISINH(MASV),
MAMT NVARCHAR (10) foreign key references MONTHI(MAMT),
DIEMTHI float 
)

insert into KETQUA(MASV,MAMT,DIEMTHI)
values 
('SV1','VB',8.0),
('SV1','MMT',8.5),

('SV2','VB',7.5),
('SV2','KTLT',8.5),

('SV3','MMT',8.5),
('SV3','CSDL',8.0),

('SV4','KTLT',8.0),
('SV4','VB',9.0),

('SV5','MMT',7.5),
('SV5','CSDL',7.5)


select 
MASV AS [Mã sinh viên],
MAMT AS [Mã môn thi]
from KETQUA








































