/*
Đề 02:
Để hỗ trợ công tác quản lý điểm, giả sử người ta xây dựng mô hình thực thể - mối quan hệ gồm 2 tập thực thể sau:
SINHVIEN là tập thực thể các sinh viên, gồm các thuộc tính: MaSV (Mã sinh viên),
HoTen (Họ tên), NgaySinh (Ngày sinh), DienThoai (Điện thoại), DiaChi (địa chỉ), MaLop (Mã lớp).
MONHOC là tập thực thể các môn học, gồm các thuộc tính: MaMH (Mã môn học), TenMH (Tên môn học), SoTC (Số tín chỉ), HocKy (Học kỳ).
Ngoài ra, 2 tập thực thể này có mối quan hệ THI kèm theo thuộc tính Điểm thi. Cụ thể, (e1,e2)THI nếu sinh viên e1 thi môn học e2
a.	Vẽ mô hình thực thể - mối quan hệ.
 
b.	Xác định mô hình dữ liệu quan hệ.
 */
 	-- Chuẩn bị dữ liệu cho câu c

	CREATE DATABASE CSDL_De02
	GO
	USE CSDL_De02
	GO
	--drop table SINHVIEN
	CREATE TABLE SINHVIEN
	(
		MASV				VARCHAR(5) PRIMARY KEY,
		HOTEN			NVARCHAR(50),
		NGAYSINH	VARCHAR(20),
		GIOITINH		BIT,
		DIENTHOAI	VARCHAR(20),
		DIACHI		   NVARCHAR(50),
		MALOP			VARCHAR(15)	
	)
	INSERT INTO SINHVIEN(MASV,HOTEN,NGAYSINH,DIENTHOAI,DIACHI,MALOP)	
	VALUES ('SV001', N'Nguyễn Cảnh','28-01-2003','905123123',N'Đà Nẵng','IT001')
	INSERT INTO SINHVIEN(MASV,HOTEN,NGAYSINH,DIENTHOAI,DIACHI,MALOP)	
	VALUES ('SV002', N'LÊ TRƯỜNG','28-01-2003','905123123',N'Quảng Nam','IT001')
	INSERT INTO SINHVIEN(MASV,HOTEN,NGAYSINH,DIENTHOAI,DIACHI,MALOP)
	VALUES ('SV003', N'NGUYỄN HỮU THỊNH','28-01-2003','905123123',N'Ninh Bình','IT002')
	INSERT INTO SINHVIEN(MASV,HOTEN,NGAYSINH,DIENTHOAI,DIACHI,MALOP)
	VALUES ('SV004', N'LÊ VIẾT TRƯỜNG','28-01-2003','905123123',N'Thanh Hóa','IT002')
	INSERT INTO SINHVIEN(MASV,HOTEN,NGAYSINH,DIENTHOAI,DIACHI,MALOP)
	VALUES ('SV005', N'LÊ XUÂN TIẾN','28-01-2003','905123123',N'Gia Lai','IT003')
	INSERT INTO SINHVIEN(MASV,HOTEN,NGAYSINH,DIENTHOAI,DIACHI,MALOP)
	VALUES ('SV006', N'Nguyễn Viết Nhật','28-01-2003','905123123',N'Cao Bằng','IT003')
	-- hiển thị dữ liệu
	select * from SINHVIEN

--drop table MONHOC
CREATE TABLE MONHOC
	(
		MAMH		VARCHAR(15) PRIMARY KEY,
		TENMH		NVARCHAR(50),
		TINCHI      INT,
		HOCKY      VARCHAR(10)
	)
	INSERT INTO MONHOC(MAMH,TENMH,TINCHI,HOCKY)	
	VALUES ('PLDC', N'Pháp luật đại cương',3,'2021-2025')

	INSERT INTO MONHOC(MAMH,TENMH,TINCHI,HOCKY)	
	VALUES ('NN', N'Ngoại ngữ',3,'2021-2025')
	INSERT INTO MONHOC(MAMH,TENMH,TINCHI,HOCKY)	
	VALUES ('KTLT', N'Kỹ thuật lập trình',3,'2021-2025')
	INSERT INTO MONHOC(MAMH,TENMH,TINCHI,HOCKY)	
	VALUES ('THVP', N'Tin học văn phòng',3,'2021-2025')
	INSERT INTO MONHOC(MAMH,TENMH,TINCHI,HOCKY)	
	VALUES ('CSDL', N'Cơ sở dữ liệu',3,'2021-2025')
	INSERT INTO MONHOC(MAMH,TENMH,TINCHI,HOCKY)	
	VALUES ('CSDL&GT', N'Cấu trúc dữ liệu và giải thuật',3,'2021-2025')

	SELECT * FROM MONHOC
--drop table THI
	CREATE TABLE THI
	(
		MASV					VARCHAR(5)			FOREIGN KEY REFERENCES SINHVIEN(MASV),
		MAMH				VARCHAR(15)		FOREIGN KEY REFERENCES MONHOC(MAMH),
		DIEMTHI			FLOAT,
		PRIMARY KEY (MASV,MAMH)
	)
	-- select * from thi
	INSERT INTO THI(MASV,MAMH,DIEMTHI) VALUES ('SV001','CSDL',9)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV001','CSDL&GT',9)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV002','CSDL',9)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV002','CSDL&GT',9)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV003','CSDL',9)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV003','CSDL&GT',10)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV004','CSDL',8)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV004','CSDL&GT',8)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV005','CSDL',8)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV005','CSDL&GT',8)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV006','CSDL',8)
	INSERT INTO THI(MASV,MAMH,DIEMTHI)	VALUES ('SV006','CSDL&GT',9.5)
	SELECT * FROM THI


--c.	Cho trước một cơ sở dữ liệu tương ứng với mô hình dữ liệu quan hệ đã được xác định trong b, hãy trả lời câu hỏi sau bằng câu lệnh SQL: 
--1. Liệt kê các sinh viên có địa chỉ tại Đà Nẵng.
	select * from SINHVIEN 
	WHERE DIACHI like N'%Đà Nẵng'
--2. Hãy cho biết Mã sinh viên, họ tên của những sinh viên thi môn cơ sở dữ liệu mà có điểm thi bằng 8.
	SELECT  sv.MASV, Hoten 
	FROM SINHVIEN sv, THI t, MONHOC mh
	WHERE tenmh =N'Cơ sở dữ liệu' 
	AND  Diemthi =8     AND  sv.Masv = t.Masv	AND  t.Mamh= mh.Mamh
--3. Hãy cho biết những sinh viên có địa chỉ tại Đà Nẵng có Điểm thi môn Cấu trúc dữ liệu lớn hơn hoặc bằng 9.
	SELECT   sv.Masv, Hoten 
	FROM SINHVIEN sv, THI t, MONHOC mh
	WHERE tenmh =N'Cấu trúc dữ liệu và giải thuật' 
	AND  Diemthi >=9  
	AND DiaChi like N'%Đà Nẵng'
	AND  sv.Masv = t.Masv AND    t.Masv= t.Masv
--4. Hãy thống kê số lượng sinh viên theo từng lớp.
	select MALOP, count(*) as SoLuongSinhVien
	from SINHVIEN
	group by MALOP


