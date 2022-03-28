--mở cơ sở dữ liệu master
use master
go
-- xóa cơ sở dữ liệu
--  drop database c4_quanlydaotao
go
-- tạo mới cơ sở dữ liệu
create database c4_quanlydaotao
go
-- mở cơ sở dữ liệu c4_quanlydaotao
use c4_quanlydaotao
go
-- 1. Tạo bảng Khoa
create table KHOA
(
	MAKHOA				VARCHAR(5) PRIMARY KEY,
	TENKHOA				NVARCHAR(70)	
)

-- Kiểm tra thử
--  select len('Kỹ thuật công nghệ điện - điện tử- điện công nghiệp')
-- kết quả bằng: 51

-- Nhập dữ liệu cho bảng Khoa
insert into KHOA(MAKHOA, TENKHOA ) values('IT', N'Công nghệ thông tin')
insert into KHOA(MAKHOA, TENKHOA)values('KT', N'Kế toán')
insert into KHOA(MAKHOA, TENKHOA)values('AE', N'Ô tô')
-- hiển thị dữ liệu
select * from KHOA

--2. Tạo bảng GIAOVIEN
CREATE TABLE GIAOVIEN
(
	MAGV					VARCHAR(5) primary key,
	HOlOT				NVARCHAR(50),
	TEN                 NVARCHAR(50),
	NGAYSINH			DATE,
	GIOITINH            BIT,
	HSL							FLOAT,
	NGAYLAMVIEC  	DATE,
	MAKHOA				VARCHAR(5) FOREIGN KEY REFERENCES KHOA(MAKHOA)
)

-- Nhập dữ liệu cho bảng GIAOVIEN
insert into GIAOVIEN (MAGV,HOLOT,TEN,NGAYSINH,GIOITINH,HSL,NGAYLAMVIEC,MAKHOA)
values ( 'GV001', N'Lê',N' Ánh', '1990/9/9',0,2.34,'2021/1/10','IT')
insert into GIAOVIEN (MAGV,HOLOT,TEN,NGAYSINH,GIOITINH,HSL,NGAYLAMVIEC,MAKHOA)
values ( 'GV002', N'Trần',N'Bình', '1991/9/9',1,2.34,'2021/1/10','IT')
insert into GIAOVIEN (MAGV,HOLOT,TEN,NGAYSINH,GIOITINH,HSL,NGAYLAMVIEC,MAKHOA)
values ( 'GV003', N'Văn Thế',N'Dũng', '1992/9/9',1,2.34,'2021/1/10','AE')
insert into GIAOVIEN (MAGV,HOLOT,TEN,NGAYSINH,GIOITINH,HSL,NGAYLAMVIEC,MAKHOA)
values ( 'GV004', N'Nguyễn',N'Tuấn', '1993/9/9', 1,2.67,'2021/1/10','KT')
insert into GIAOVIEN (MAGV,HOLOT,TEN,NGAYSINH,GIOITINH,HSL,NGAYLAMVIEC,MAKHOA)
values ( 'GV005', N'Nguyễn',N'Tuân', '1990/9/9', 1,2.67,'2021/1/10','KT')
insert into GIAOVIEN (MAGV,HOLOT,TEN,NGAYSINH,GIOITINH,HSL,NGAYLAMVIEC,MAKHOA)
values ( 'GV006', N'Nguyễn Quốc',N'Vương', '1983/4/20', 1,2.67,'2021/1/10','IT')
---hiển thị dữ liệu
select *from GIAOVIEN
---tạo bảng LOP
Create table LOP
(
            MALOP           Varchar(10) Primary key,
            TENLOP          varchar(30),
			KHOAHOC        varchar(30),
            MAKHOA        varchar(5)FOREIGN KEY REFERENCES KHOA(MAKHOA)
)
---Nhập dữ liệu bảng LOP
insert into LOP ( MALOP,TENLOP,KHOAHOC,MAKHOA)
values ( 'IT001', 'IT21A1A','2021','IT')
insert into LOP ( MALOP,TENLOP,KHOAHOC,MAKHOA)
values ( 'IT002', 'IT21A1B','2021','IT')
insert into LOP ( MALOP,TENLOP,KHOAHOC,MAKHOA)
values ( 'IT003', 'IT21A2A','2021','IT')
insert into LOP ( MALOP,TENLOP,KHOAHOC,MAKHOA)
values ( 'KT001', 'AC21A1A','2021','KT')
insert into LOP ( MALOP,TENLOP,KHOAHOC,MAKHOA)
values ( 'AE001', 'AE21A1A','2021','AE')
---hiển thị dữ liệu
select *from LOP

---tạo bảng SINHVIEN
create table SINHVIEN
(
        MASV             varchar(10)primary key,
		HOlOT				NVARCHAR(50),
		TEN                 NVARCHAR(50),		
		DIENTHOAI        varchar(15),
		NGAYSINH         date,
		GIOITINH         BIT,
		DIACHI           NVARCHAR(50),
		MALOP            varchar(10) FOREIGN KEY REFERENCES LOP(MALOP)
)
go
---nhập dữ liệu bảng LOP
insert into SINHVIEN( MASV, HOLOT, TEN, DIENTHOAI, NGAYSINH,GIOITINH,DIACHI,MALOP)
values ( 'SV001',N'NGUYỄN', N'CANH','905123123','2003/11/20',1,N'QUẢNG TRỊ','IT001')
insert into SINHVIEN ( MASV, HOLOT, TEN, DIENTHOAI, NGAYSINH,GIOITINH,DIACHI,MALOP)
values ( 'SV002',N'LÊ ', N'TRƯỜNG','905123124','2003/11/21',1,N'ĐÀ NẴNG','IT001')
insert into SINHVIEN ( MASV, HOLOT, TEN, DIENTHOAI, NGAYSINH,GIOITINH,DIACHI,MALOP)
values ( 'SV003',N'HỮU',N'THỊNH','905123125','2003/11/22',1,N'HÀ NỘI','IT002')
insert into SINHVIEN ( MASV, HOLOT, TEN, DIENTHOAI, NGAYSINH,GIOITINH,DIACHI,MALOP)
values ( 'SV004',N'VIẾT',N'TRƯỜNG','905123126','2003/11/23',1,N'QUẢNG BÌNH','IT002')
insert into SINHVIEN ( MASV, HOLOT, TEN, DIENTHOAI, NGAYSINH,GIOITINH,DIACHI,MALOP)
values ( 'SV005',N'XUÂN', N'TIẾN','905123127','2003/11/24',1,N'PHÚ YÊN','IT003')
insert into SINHVIEN ( MASV, HOLOT,TEN, DIENTHOAI, NGAYSINH,GIOITINH,DIACHI,MALOP)
values ( 'SV006',N'Nguyễn Viết', N'Nhật','905123128','2003/11/25',1,N'QUẢNG NGÃI','IT003')

insert into SINHVIEN ( MASV, HOLOT,TEN, DIENTHOAI, NGAYSINH,GIOITINH,DIACHI,MALOP)
values ( 'SV007',N'Lê Viết', N'Nghị','905123129','2003/01/25',1,N'QUẢNG NGÃI','IT003')

---Hiển thị dữ liệu
select *from SINHVIEN
---tạo bảng MONHOC
create table MONHOC
(
        MAMH            varchar(10) primary key,
		TENMH           Nvarchar(50),
		TINCHI			int
)
---nhập bảng dữ liệu MONHOC
insert into MONHOC (MAMH,TENMH,TINCHI)values ('PLDC ', N'Pháp luật đại cương', 3)
insert into MONHOC (MAMH,TENMH,TINCHI)values ('NN ', N'Ngoại ngữ', 3)
insert into MONHOC (MAMH,TENMH,TINCHI)values ('KTLT', N'Kỹ thuật lập trình', 3)
insert into MONHOC (MAMH,TENMH,TINCHI)values ('THVP ', N'Tin học văn phòng', 3)
insert into MONHOC (MAMH,TENMH,TINCHI)values ('CSDL ', N'Cơ sở dữ liệu', 3)
insert into MONHOC (MAMH,TENMH,TINCHI)values ('HEQT ', N'Hệ quản trị cơ sở dữ liệu', 3)
---hiển thị dữ liệu
select *from MONHOC
---Tạo bảng GIANGDAY
create table GIANGDAY
(
          MAGV         varchar(5) FOREIGN KEY REFERENCES GIAOVIEN(MAGV),
          MALOP        varchar(10)FOREIGN KEY REFERENCES LOP(MALOP),
          MAMH         varchar(10)FOREIGN KEY REFERENCES MONHOC(MAMH),
          HOCKY        varchar(10),
          SOTIET			int,
          NAMHOC      varchar(10),
		  CONSTRAINT PK_GIANGDAY primary key(MAGV, MALOP, MAMH)
)
go
---nhập dữ liệu bảng GIANGDAY
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV001','IT001','KTLT','1',45,'2021-2022')
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV002','AE001','PLDC ','2',15,'2021-2022')
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV003','IT001','NN','1',60,'2021-2022')
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV004','IT002','KTLT','3',45,'2021-2022')
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV006','IT001','CSDL','5',60,'2021-2022')
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV006','IT001','HEQT','4',45,'2021-2022')
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV006','IT003','CSDL','6',15,'2021-2022')
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV006','IT003','HEQT','3',30,'2021-2022')
insert into GIANGDAY (MAGV,MALOP,MAMH,HOCKY,SOTIET,NAMHOC)
values ('GV006','IT002','CSDL','2',60,'2021-2022')
---hiển thị dữ liệu
select *from GIANGDAY
--tạo bảng DIEM
create table DIEM
(
        MASV					varchar(10)FOREIGN KEY REFERENCES SINHVIEN(MASV),
		MAMH                varchar(10)FOREIGN KEY REFERENCES MONHOC(MAMH),
		DIEMCHUYENCAN   FLOAT,
		DIEMTHUONGXUYEN  FLOAT,
		DIEMGIUAKI      FLOAT,
		DIEMLAN1		float,
		DIEMLAN2         float,
		CONSTRAINT PK_DIEM PRIMARY KEY(MASV, MAMH)
)
go
---nhập dữ liệu bảng DIEM
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV001','CSDL',7.5,8,7,6)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV001','HEQT',5.6,5,6,7)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV002','CSDL',7.7,5.5,8,8.5)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV002','HEQT',8.2,8.3,8,8.5)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV003','CSDL',4.3,5,6,7)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV003','HEQT',5.1,5.5,7,8)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV004','CSDL',3.5,4,5,6)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV004','HEQT',6,5.5,6.5,7)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV005','CSDL',5.5,7,7,7)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV005','HEQT',5.6,8,6,8)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1) Values ('SV006','CSDL',5.8,5.5,6.8,7)
insert into DIEM (MASV,MAMH,DIEMCHUYENCAN,DIEMTHUONGXUYEN,DIEMGIUAKI,DIEMLAN1)values ('SV006','HEQT',8.8,9,9,8.5)
---hiển thị dữ liệu
select *from DIEM

