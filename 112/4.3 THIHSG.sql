use master 
go

create database THIHSG 
go

use THIHSG
go

drop table KHOA
create table KHOA (
MAKHOA NVARCHAR(10) primary key,
TENKHOA nvarchar(50),
DIENTHOAI nvarchar(10)
)

insert into KHOA(MAKHOA,TENKHOA,DIENTHOAI)
values 
('CNTT',N'Công nghệ thông tin',N'0990123456'),
('NN'  ,N'Ngoại ngữ'		  ,N'0990123456'),
('CNMT',N'Công nghệ máy tính' ,N'0990123456')

select * from KHOA



--2
drop table LOP
create table LOP (
MALOP NVARCHAR(10),
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


select *from LOP

--3

drop table THISINH
create table THISINH(
MASV NVARCHAR(10) primary key ,
HOTEN nvarchar (50),
NGAYSINH datetime 
MALOP NVARCHAR(10) foreign key references LOP(MALOP)
)

insert into THISINH(MASV,HOTEN,NGAYSINH,MALOP)
values 
('SV1',N'Hoàng Phúc'        ,'01/01/2002','ITA1'),
('SV2',N'Phan Thanh Khánh Duy'    ,'01/01/2003','ITA1'),
('SV3',N'Văn Thị Thùy Linh ','25/12/2002','ITA1'),
('SV4',N'Nguyễn Quốc '		,'01/07/2003','CNMTA1'),
('SV5',N'Nguyễn Thị Hồng '  ,'22/03/2003','NNA2'),


select * from THISINH

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

select *from MONTHI 

--5

create table KETQUA ( 
MASV NVARCHAR(10) foreign key references THISINH(MASV),
MAMT NVARCHAR (10) foreign key references MONTHI(MAMT),
DIEMTHI float 
)

insert into KETQUA(MASV,MAMT)
values 
('SV1','VB'),
('SV1','MMT'),

('SV2','VB'),
('SV2','KTLT'),

('SV3','KTLT'),
('SV3','CSDL'),

('SV4','KTLT'),
('SV4','VB'),

('SV5','LSĐ'),
('SV5','CSDL')

select * from KETQUA

























