
--  Tạo cơ sở dữ liệu qlsinhvien

create database qlsinhvien
go 
use  qlsinhvien
go
-- Tạo bảng Lop
create table Lop
(
	MaLop		varchar(4) primary key, --Mã lớp cho phép nhập giá trị chuỗi có độ dài tối đa là 4 ký tự, và MaLop là khóa chính của bảng: có nghĩa là mã lớp không được nhập trùng lặp
	TenLop    varchar(20)
)
-- Nhập giá trị 
insert into Lop values('L001', 'IT20A1A')
insert into Lop values('L002', 'IT20A2A')
insert into Lop values('L003', 'AE20A1A')

-- Hiển thị dữ liệu
select * from Lop