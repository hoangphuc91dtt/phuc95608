use c4_quanlydaotao
go
-- 1. Hiển thị thông tin của các sinh viên.
		SELECT * FROM SINHVIEN
-- 2 Hiển thị thông tin của các sinh viên, trong đó Họ tên được ghép bởi trường Họ lót và tên.
	    SELECT MASV, HOLOT+ ' '  +TEN AS HOTEN,
		DIENTHOAI, NGAYSINH, GIOITINH, DIACHI, MALOP
		FROM SINHVIEN
-- 3. Hiển thị thông tin của các sinh viên, trong đó các tiêu trường đều phải viết tiếng việt có dấu.
	 SELECT MASV AS [Mã sinh viên], HOLOT+ ' '  +TEN AS [Họ tên],
		DIENTHOAI, NGAYSINH, GIOITINH, DIACHI, MALOP
		FROM SINHVIEN
-- 4.Hiển thị hệ số lương của các giáo viên có trong trường.
	SELECT   HSL FROM GIAOVIEN
	
	SELECT DISTINCT  HSL FROM GIAOVIEN
	-- Lưu ý: để loại các dòng trùng nhau ta sử dụng từ khóa DISTINCT	 
-- 5. Hiển thị 2 sinh viên đầu tiên trong bảng Sinh viên
		


--6. Hiển thị thông tin của các sinh viên, trong đó Họ tên được ghép bởi trường
-- holot + tên, ngày sinh hiển thị dưới dạng: dd/mm/yyyy
	
	SELECT MASV, HOLOT+ ' '  +TEN AS [Họ tên] ,DIENTHOAI,
		convert(varchar(10),NGAYSINH,103) AS NGAYSINH
		,GIOITINH, DIACHI, MALOP
		FROM SINHVIEN

--7. Hiển thị thông tin của các sinh viên, trong đó Họ tên được ghép bởi trường
-- holot + tên, ngày sinh hiển thị dưới dạng: dd/mm/yyyy,giới tính hiển thị Nam hoặc Nữ
		SELECT MASV, HOLOT+ ' '  +TEN AS [Họ tên] ,DIENTHOAI,
		convert(varchar(10),NGAYSINH,103) AS NGAYSINH,
		case when GIOITINH = 1 then 'Nam' else 'Nữ' END AS GIOITINH,
		DIACHI, MALOP
		FROM SINHVIEN

--7. Hiển thị các môn học có số tín chỉ >= 3
	SELECT * FROM MONHOC WHERE TINCHI >=3
--8. Hiển thị thông tin các sinh viên có họ lót là Lê.
	SELECT * FROM SINHVIEN WHERE HOLOT LIKE N'Lê%'

	-- Lưu ý: % đại diện cho nhóm ký tự bất kỳ

--9. Hiển thị thông tin các sinh viên có họ lót là Nguyễn.
	

--10. Sắp xếp các giáo viên theo thứ tự tăng dần theo tên
	SELECT * 
	FROM GIAOVIEN
	ORDER BY TEN ASC
	
	 -- trong đó: asc: sắp xếp tăng dần
--11. Sắp xếp các giáo viên theo thứ tự giảm dần theo tên
	SELECT * 
	FROM GIAOVIEN
	ORDER BY TEN DESC
	 -- trong đó: desc: sắp xếp giảm dần
--12. Hiển thị thông tin các lớp thuộc khoa Công nghệ thông tin.
  -- Trong đó: Sắp xếp giảm dần theo Tên Lớp. 
		--C1:
			SELECT  LOP.*,KHOA.TENKHOA 
			FROM LOP,KHOA
			WHERE LOP.MAKHOA = KHOA.MAKHOA
			AND KHOA.TENKHOA =N'Công nghệ thông tin' order by LOP.TENLOP DESC


		--C2:
			SELECT * 
			FROM LOP
			ORDER BY MALOP DESC
		
		

		-- Ví dụ: lỗi tại MAKHOA vì: MAKHOA tồn tại ở 2 bảng: LOP VÀ KHOA,
		-- SQL không biết lấy MAKHOA của bảng nào nên nó báo lỗi
	
		-- Sửa lỗi:
			

		


--13. Hiển thị các sinh viên thuộc lớp IT21A1A, có địa chỉ ở Quảng Trị.
 -- Trong đó: Sắp xếp tăng dần theo trường Tên sinh viên.
	SELECT * FROM SINHVIEN WHERE  LIKE N'IT21A1A%'
	
--14.Thống kê số lượng giáo viên theo từng Khoa
		
	
--15. Thống kê số lượng giáo viên thuộc khoa Công nghệ thông tin
	
--16.Thống kê số lượng sinh viên theo từng lớp

--17.Thống kê số lượng sinh viên của khoa Công nghệ thông tin





