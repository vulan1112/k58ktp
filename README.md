# k58ktp
## bài tập 02 -MSSV: k225480106036 - vũ lân - Môn hệ quản trị csdl

## DEADLINE: 23H59 NGày 25/3/2025

## ĐIỀU KIỆN: (ĐÃ LÀM XONG BÀI 1)

1. Đã cài đặt SQL Server 2022 Dev.
2. Đã cài đặt SQL Managerment Studio bản mới nhất.
3. Đã kết nối từ SQL Managerment Studio vào SQL Server.
4. Đã có tài khoản github, biết cách tạo repository(kho lưu trữ) cho phép truy cập public.

## BÀI TOÁN:
- Tạo csdl quan hệ với tên QLSV gồm các bảng sau:
  + SinhVien(#masv,hoten,NgaySinh)
  + Lop(#maLop,tenLop)
  + GVCN(#@maLop,#@magv,#HK)
  + LopSV(#@maLop,#@maSV,ChucVu)
  + GiaoVien(#magv,hoten,NgaySinh,@maBM)
  + BoMon(#MaBM,tenBM,@maKhoa)
  + Khoa(#maKhoa,tenKhoa)
  + MonHoc(#mamon,Tenmon,STC)
  + LopHP(#maLopHP,TenLopHP,HK,@maMon,@maGV)
  + DKMH(#@maLopHP,#@maSV,DiemTP,DiemThi,PhanTramThi)

## YÊU CẦU:
1. Thực hiện các hành động sau trên giao diện đồ hoạ để tạo cơ sở dữ liệu cho bài toán:
  + Tạo database mới, mô tả các tham số(nếu có) trong quá trình.
  + Tạo các bảng dữ liệu với các trường như mô tả, chọn kiểu dữ liệu phù hợp với thực tế (tự tìm hiểu)
  + Mỗi bảng cần thiết lập PK, FK(s) và CK(s) nếu cần thiết. (chú ý dấu # và @: # là chỉ PK, @ chỉ FK)
2. Chuyển các thao tác đồ hoạ trên thành lệnh SQL tương đương. lưu tất cả các lệnh SQL trong file: Script_DML.sql

**Giải:**
code
...

CREATE DATABASE QLSV;
GO
USE QLSV;
GO

CREATE TABLE SinhVien (
    MaSV INT PRIMARY KEY,
    HoTen VARCHAR(100),
    NgaySinh DATE
);
GO

CREATE TABLE Lop (
    MaLop INT PRIMARY KEY,
    TenLop VARCHAR(100)
);
GO

CREATE TABLE Khoa (
    MaKhoa INT PRIMARY KEY,
    TenKhoa VARCHAR(100)
);
GO

CREATE TABLE MonHoc (
    MaMon INT PRIMARY KEY,
    TenMon VARCHAR(100),
    STC INT CHECK (STC > 0)
);
GO

CREATE TABLE BoMon (
    MaBM INT PRIMARY KEY,
    TenBM VARCHAR(100),
    MaKhoa INT,
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
);
GO

CREATE TABLE LopSV (
    MaLop INT,
    MaSV INT,
    ChucVu VARCHAR(50),
    PRIMARY KEY (MaLop, MaSV),
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
);
GO

CREATE TABLE GiaoVien (
    MaGV INT PRIMARY KEY,
    HoTen VARCHAR(100),
    NgaySinh DATE,
    MaBM INT,
    FOREIGN KEY (MaBM) REFERENCES BoMon(MaBM)
);
GO

CREATE TABLE GVCN (
    MaLop INT,
    MaGV INT,
    HK VARCHAR(10),
    PRIMARY KEY (MaLop, MaGV, HK),
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop),
    FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV)
);
GO

CREATE TABLE LopHP (
    MaLopHP INT PRIMARY KEY,
    TenLopHP VARCHAR(100),
    HK VARCHAR(10),
    MaMon INT,
    MaGV INT,
    FOREIGN KEY (MaMon) REFERENCES MonHoc(MaMon),
    FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV)
);
GO

CREATE TABLE DKMH (
    MaLopHP INT,
    MaSV INT,
    DiemTP FLOAT CHECK (DiemTP BETWEEN 0 AND 10),
    DiemThi FLOAT CHECK (DiemThi BETWEEN 0 AND 10),
    PhanTramThi FLOAT CHECK (PhanTramThi BETWEEN 0 AND 100),
    PRIMARY KEY (MaLopHP, MaSV),
    FOREIGN KEY (MaLopHP) REFERENCES LopHP(MaLopHP),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
);
GO

....
