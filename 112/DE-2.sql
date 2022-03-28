create database GIAIDE_2
go

use database GIAIDE_2
go

CREATE DATABASE CSDL De02
GO
USE CSDL_De02
GO
--drop table SINHVIEN
CREATE TABLE SINHVIEN
 (      
 MASV VARCHAR(5) PRIMARY KEY,
 HOTENN	VARCHAR(50),
 NGAYSINH VARCHAR(20),
 GIOITINH BIT,
 DIENTHOAI VARCHAR(20),
 DIACHI NVARCHAR(50),
 MALOP VARCHAR(15)
 )


 --1. Liệt kê các sinh viên có địa chỉ tại Đà Nẵng.
   select * from SINHVIEN
  WHERE DIACHI like N'%Đà Nẵng

--2. Hãy cho biết Mã sinh viên, họ tên của những sinh viên thi môn cơ sở dữ liệu mà có điểm thi bằng 8.
   SELECT sv.MASV, Hoten
   FROM SINHVIEN sv, THI t, MONHOC mh
   WHERE tenmh =N'Cơ sở dữ liệu'
   AND Diemthi =8 AND sv.Masv =t.Masv AND t.Mamh= mh.Mamh
--3. Hãy cho biết những sinh viên có địa chỉ tại Đà Nẵng có Điểm thi môn Cấu trúc dữ liệu lớn hơn hoặc bằng 9.
   SELECT sv.Masv, Hoten
   FROM SINHVIEN sv, THI t, MONHOC mh
  WHERE tenmh =N'Cấu trúc dữ liệu và giải thuật'
   AND Diemthi >=9
  AND DiaChi like N'%Đà Nẵng'
   AND sv.Masv = t.Masv AND t.Masv= t.Masv
--4. Hãy thống kê số lượng sinh viên theo từng lớp.
   select MALOP, count(*) as SoLuongSinhVien from SINHVIEN group by MALOP