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

bước đầu tạo mới database :

![image](https://github.com/user-attachments/assets/b1c601b5-472f-4c20-a0d0-139c6d0f159e)


![image](https://github.com/user-attachments/assets/672f9d01-1c0e-415f-8421-a24e351d3b1a)


![image](https://github.com/user-attachments/assets/cdb613dc-aa6a-4541-b2d4-bfa7722318cc)

### CODE
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

...

***CODE VÀ HÌNH ẢNH MÔ TẢ DỮ LIỆU TỪNG PHẦN***

...

CREATE DATABASE QLSV;
GO
USE QLSV;
GO
![image](https://github.com/user-attachments/assets/15cf162e-e6b4-412e-9e2f-83c128c331f6)

**CÁCH TẠO BẢNG**

![image](https://github.com/user-attachments/assets/4f0351b4-2a55-4fed-91d9-1f44971cb2c0)

**MÔ TẢ ĐỂ TẠO KHÓA CHÍNH**

![image](https://github.com/user-attachments/assets/cc613a54-d330-4a47-b318-d14c1817910b)

**KHÓA PHỤ**

![image](https://github.com/user-attachments/assets/58743d05-870a-43a3-bda2-ea51361697cf)

**TẠO KIỂM TRA BẢNG**

![image](https://github.com/user-attachments/assets/dce229f2-4002-499e-810b-d7850486e6d1)

![image](https://github.com/user-attachments/assets/2fd8d8b9-5932-4d2f-853d-2f71c8a5dc25)

**CÁCH HIỆN MÃ RA NGOÀI MÀN HÌNH**

![image](https://github.com/user-attachments/assets/6966c115-d6cd-4b3b-96e8-495411699723)

![image](https://github.com/user-attachments/assets/2438dfe2-1133-469b-bc2b-ddbe4e1b5ff7)

CREATE TABLE SinhVien (
    MaSV INT PRIMARY KEY,
    HoTen VARCHAR(100),
    NgaySinh DATE
);
GO

![image](https://github.com/user-attachments/assets/0cbd06c4-00b0-4814-818b-58c14ff39920)

![image](https://github.com/user-attachments/assets/ef25926f-2d37-4a8b-a46e-0dc6c55a244d)

![image](https://github.com/user-attachments/assets/71e6247d-d81d-4208-a09e-3aed391f3a2c)

CREATE TABLE Lop (
    MaLop INT PRIMARY KEY,
    TenLop VARCHAR(100)
);
GO

![image](https://github.com/user-attachments/assets/d26e2b07-7fd2-465c-aed4-0259027f1ec5)

![image](https://github.com/user-attachments/assets/7569ff0b-0fe2-4119-84ce-492c194732ab)

![image](https://github.com/user-attachments/assets/411c7dc9-2184-4ce8-9242-cf4682db2fd0)

CREATE TABLE Khoa (
    MaKhoa INT PRIMARY KEY,
    TenKhoa VARCHAR(100)
);
GO

![image](https://github.com/user-attachments/assets/6eb2baef-f174-4dd4-9358-13beff3f933f)

![image](https://github.com/user-attachments/assets/72e70eff-f1f9-40df-aeb9-5714ee91dc19)

![image](https://github.com/user-attachments/assets/fc2e2b08-0399-4850-beb5-fab85d55cd38)

CREATE TABLE MonHoc (
    MaMon INT PRIMARY KEY,
    TenMon VARCHAR(100),
    STC INT CHECK (STC > 0)
);
GO

![image](https://github.com/user-attachments/assets/c979d20f-4956-4998-a9ed-034eb402d4d4)

![image](https://github.com/user-attachments/assets/193660c4-e1e8-4b3c-b95c-338e44720ec6)

![image](https://github.com/user-attachments/assets/c35e4ef7-1497-42a1-87c9-08720088816f)

CREATE TABLE BoMon (
    MaBM INT PRIMARY KEY,
    TenBM VARCHAR(100),
    MaKhoa INT,
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
);
GO

![image](https://github.com/user-attachments/assets/bc326dee-caae-465a-9740-e08ae85a79cf)

![image](https://github.com/user-attachments/assets/e6783b7a-9cb6-4481-9bc2-8198c8cb9ddc)

![image](https://github.com/user-attachments/assets/9db6fd33-2931-4f5b-952b-497c08e4eb87)

CREATE TABLE LopSV (
    MaLop INT,
    MaSV INT,
    ChucVu VARCHAR(50),
    PRIMARY KEY (MaLop, MaSV),
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
);
GO

![image](https://github.com/user-attachments/assets/24887dad-45a5-4fdb-bfdb-3081e708f894)

![image](https://github.com/user-attachments/assets/01469baa-1f56-4033-8fbf-f7da74cc1047)

![image](https://github.com/user-attachments/assets/e6f7c51d-a052-44a7-86a6-827df78cab12)

CREATE TABLE GiaoVien (
    MaGV INT PRIMARY KEY,
    HoTen VARCHAR(100),
    NgaySinh DATE,
    MaBM INT,
    FOREIGN KEY (MaBM) REFERENCES BoMon(MaBM)
);
GO

![image](https://github.com/user-attachments/assets/f56283a6-2a88-4ed9-b146-61cf269eb55b)

![image](https://github.com/user-attachments/assets/5f888719-7462-46fd-b714-8652b94ff063)

![image](https://github.com/user-attachments/assets/a3705548-43c1-46d1-aa94-0c8d64c1cd8b)

CREATE TABLE GVCN (
    MaLop INT,
    MaGV INT,
    HK VARCHAR(10),
    PRIMARY KEY (MaLop, MaGV, HK),
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop),
    FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV)
);
GO

![image](https://github.com/user-attachments/assets/2ed14062-0007-4886-806a-2ab544382eda)

![image](https://github.com/user-attachments/assets/40727bfb-dd09-4749-b264-7124133d9bd9)

![image](https://github.com/user-attachments/assets/4c55562b-a34c-418d-a285-a556916922cb)

![image](https://github.com/user-attachments/assets/9dab3384-c37d-44a5-8e9e-703995326d44)

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

![image](https://github.com/user-attachments/assets/b3a8acfc-0b1d-4f20-90d9-e4925f30e638)

![image](https://github.com/user-attachments/assets/387f1e12-6315-4f3d-976f-c4ca1495bf1c)

![image](https://github.com/user-attachments/assets/c7ce72b4-afe4-48cb-8655-053e8d949822)

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


![image](https://github.com/user-attachments/assets/f54f8cff-f000-4d8f-9f52-a6ea8eaed3ff)

![image](https://github.com/user-attachments/assets/07a515dd-9a0f-4cd8-b65a-32bde7ba12d8)

![image](https://github.com/user-attachments/assets/d1919364-87fc-41dd-a8b2-3fd3abddf483)

....

***tạo sơ đồ dữ liệu mới:***


![image](https://github.com/user-attachments/assets/722df56c-81ef-46fe-8317-2a9dd06e52e0)

![image](https://github.com/user-attachments/assets/932e7c97-8099-4704-abfc-97eef9b603a3)

![image](https://github.com/user-attachments/assets/db96641a-c88c-44f4-a010-0f1aac91de96)




