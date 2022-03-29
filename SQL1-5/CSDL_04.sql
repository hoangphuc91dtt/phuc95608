/*ĐỀ KIỂM TRA (60 Phút)
Đề 04:
Để hỗ trợ công tác quản lý thư viện, giả sử người ta xây dựng mô hình thực thể - mối quan hệ gồm có 2 tập thực thể sau:
DocGia là tập thực thể các độc giả, gồm các thuộc tính: MaDG (Mã độc giả), HoTen (Họ tên độc giả), NgaySinh (Ngày sinh), DiaChi (Địa chỉ).
Sach là tập thực thể các đầu sách có trong thư viện, gồm các thuộc tính: MaSach (Mã sách), TenSach (Tên sách), TenTG (Tên tác giả), SoLuong (Số lượng).
Ngoài ra, 2 tập thực này có mối quan hệ Muon kèm theo các thuộc tính Ngày mượn, Số lượng mượn, Ngày hẹn trả. Cụ thể, (e1, e2)  Muon nếu độc giả e1 mượn cuốn sách e2
a.	Vẽ sơ đồ thực thể - mối quan hệ.
 
b.	Xác định mô hình dữ liệu quan hệ.
*/
 -- Tạo dữ liệu cho câu c:
 --Tạo cơ sở dữ liệu CSDL_De04
 create database CSDL_De04
 go
 -- mở cơ sở dữ liệu CSDL_De04
use CSDL_De04
go

--DROP TABLE SACH
go

DROP TABLE SACH
-- 1. Tạo bảng SACH
CREATE TABLE SACH
(	MaSach				INT primary key,
	TENSACH			NVARCHAR(100),
	TenTG					NVARCHAR(100),
	SOLUONG			INT,
)
insert into	SACH(MaSach,TENSACH,TenTG,SoLuong)VALUES(1, N'Dế mèn phiêu lưu ký',N'Tô Hoài',1)
insert into 	SACH(MaSach,TENSACH,TenTG,SoLuong)VALUES(2, N'Cơ Sở Dữ Liệu',N'Trần Quốc Chiến',1)
insert into 	SACH(MaSach,TENSACH,TenTG,SoLuong)VALUES(3, N'Thiết kế đồ họa',N'Nguyễn Quốc Nam',1)
select*from SACH

CREATE TABLE DOCGIA
(
  MADG			    INT primary key,
  HOTEN				NVARCHAR(100),
  NGAYSINH     DATETIME,
  DIACHI				NVARCHAR(100)

 )
insert into	DOCGIA(MADG, HOTEN, NGAYSINH, DIACHI) VALUES	(1, N'Nguyễn Xuân Thái','2003/12/13',N'Quảng Nam')
insert into	DOCGIA(MADG, HOTEN, NGAYSINH, DIACHI) VALUES	(2, N'Nguyễn Xuân Thành','2003/7/13',N'Quảng Bình')

select*from DOCGIA

DROP TABLE MUON
CREATE TABLE MUON
(	
	MADG			INT FOREIGN KEY(MADG) REFERENCES DOCGIA(MADG),
    MASACH		INT FOREIGN KEY(MASACH) REFERENCES SACH(MASACH),
	NGAYMUON DATETIME,
	Ngayhentra		DATETIME,
	SoLuong			int                                       
	PRIMARY KEY(MADG,MASACH)	
)
insert into	MUON(MADG,MaSach,NGAYMUON,Ngayhentra,SoLuong)
VALUES(1,'001','2021/01/11','2021/03/21',1)
insert into MUON(MADG,MaSach,NGAYMUON,Ngayhentra,SoLuong)
VALUES(2,'002','2021/02/11','2021/05/11',2)
insert into	MUON(MADG,MaSach,NGAYMUON,Ngayhentra,SoLuong)
VALUES(1,'00','2021/01/11','2021/04/21',1)

select*from MUON

--c.	Cho trước một cơ sở dữ liệu tương ứng với mô hình dữ liệu quan hệ đã được xác định trong b, hãy trả lời câu hỏi sau bằng câu lệnh SQL: 
--1. Liệt kê các độc giả có địa chỉ tại Quảng Nam.
	SELECT *
	FROM DOCGIA
	WHERE DIACHI like N'%Quảng Nam'

	 --Liệt kê họ tên và địa chỉ các độc giả mượn cuốn sách Cơ sở dữ liệu của PGS. Trần Quốc Chiến.



--2. Liệt kê họ tên và địa chỉ các độc giả mượn cuốn sách Cơ sở dữ liệu của PGS. Trần Quốc Chiến.
	SELECT   HoTen, DiaChi 
	FROM      SACH s, MUON m, DOCGIA d
	WHERE   s.MaSach = m.MaSach
	AND        m.MaDG = d.MaDG
	AND        tensach = N'Cơ sở dữ liệu'
	AND       tentg    = N'Trần Quốc Chiến'
	
--3. Liệt kê những cuốn sách không có độc giả nào mượn.
	SELECT   * 
	FROM SACH 
	WHERE MaSach not in (SELECT MaSach FROM MUON)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

--4. Thống kê Họ tên độc giả, Tổng số lần mượn.
	SELECT a.HOTEN,a.MADG, count(MASACH) as TongSoLanMuon
	FROM DOCGIA a, MUON b
	where a.MADG= b.MADG
	group by a.HOTEN ,a.MADG


