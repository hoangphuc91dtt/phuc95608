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
DIENTHOAI nvarchar(11)
)

insert into KHOA(MAKHOA,TENKHOA,DIENTHOAI)
values 
('CNTT',N'Công ngh? thông tin',N'0990123456'),
('NN'  ,N'Ngo?i ng?'		  ,N'0990123456'),
('CNMT',N'Công ngh? máy tính' ,N'0990123456')

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
MASV NVARCHAR(5) primary key ,
HOTEN nvarchar (50),
NGAYSINH datetime 
MALOP NVARCHAR(5) foreign key references LOP(MALOP)
)

insert into THISINH(MASV,HOTEN,NGAYSINH,MALOP)
values 
('SV1',N'Hoàng Phúc'        ,'01/01/2002','ITA1'),
('SV2',N'Phan Thanh Khánh Duy'    ,'01/01/2003','ITA1'),
('SV3',N'V?n Th? Thùy Linh ','25/12/2002','ITA1'),
('SV4',N'Nguy?n Qu?c '		,'01/07/2003','CNMTA1'),
('SV5',N'Nguy?n Th? H?ng '  ,'22/03/2003','NNA2'),


select * from THISINH

--4

create table MONTHI (
MAMT NVARCHAR(10)primary key,
TENMONTHI nvarchar(50)
)

insert into MONTHI(MAMT,TENMONTHI)
values 
('KTLT',N'K? thu?t l?p trình'),
('MMT' ,N'M?ng máy tính'     ),
('PL' ,N'Pháp lu?t ??i c??ng'),
('LS?' ,N'L?ch s? ??ng')

select *from MONTHI 

--5

create table KETQUA ( 
MASV NVARCHAR(10) foreign key references THISINH(MASV),
MAMT NVARCHAR (10) foreign key references MONTHI(MAMT),
DIEMTHI float 
)

insert into KETQUA(MASV,MAMT)
values 
('SV1','KTLT'),
('SV1','MMT'),

('SV2','LS?'),
('SV2','KTLT'),

('SV3','KTLT'),
('SV3','PL'),

('SV4','KTLT'),
('SV4','LS?'),

('SV5','LS?'),
('SV5','PL')

select * from KETQUA

























