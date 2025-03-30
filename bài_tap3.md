# BÀI TẬP VỀ NHÀ 03 - MÔN HỆ QUẢN TRỊ CSDL:

# DEADLINE: 23H59 NGÀY 30/03/2025

# ĐIỀU KIỆN: (ĐÃ LÀM XONG BÀI 2)

## BÀI TOÁN: Sửa bài 2 để có csdl như sau:
  + SinhVien(#masv,hoten,NgaySinh)
  + Lop(#maLop,tenLop)
  + GVCN(#@maLop,#@magv,#HK)
  + LopSV(#@maLop,#@maSV,ChucVu)
  + GiaoVien(#magv,hoten,NgaySinh,@maBM)
  + BoMon(#MaBM,tenBM,@maKhoa)
  + Khoa(#maKhoa,tenKhoa)
  + MonHoc(#mamon,Tenmon,STC)
  + LopHP(#maLopHP,TenLopHP,HK,@maMon,@maGV)
  + DKMH(#id_dk, @maLopHP,@maSV,DiemThi,PhanTramThi)
  + Diem(#id, @id_dk, diem)

## YÊU CẦU:
1. Sửa bảng DKMH và bảng Điểm từ bài tập 2 để có các bảng như yêu cầu.
2. Nhập dữ liệu demo cho các bảng (nhập có kiểm soát từ tính năng Edit trên UI của mssm)
3. Viết lệnh truy vấn để: Tính được điểm thành phần của 1 sinh viên đang học tại 1 lớp học phần.

## HÌNH THỨC LÀM BÀI:
1. Tạo file bai_tap3.md trên cùng repository của bài tập 2:
   Nội dung chứa đề bài, và ảnh chụp quá trình thao tác các yêu cầu khác.
2. Chụp ảnh quá trình sửa bảng DKMH và quá trình thêm bảng Diem, chú ý @ là FK, và thêm CK cho trường điểm
3. Hình sau khi chụp paste trực tiếp vào file bai_tap3.md trên github, cần mô tả các phần trên ảnh để tỏ ra là hiểu hết!
4. dùng tính năng: Tasks -> Generate Scrips => sinh ra file: bai_tap_3_schema.sql  (chỉ chứa lệnh tạo cấu trúc của db)
5. dùng tính năng: Tasks -> Generate Scrips => advance => Check Data only => sinh ra file: bai_tap_3_data.sql  (chỉ chứa dữ liệu đã nhập demo vào db)
6. Tạo diagram mô tả các PK, FK của db. Chụp hình kết quả các bảng có các đường nối 1-->nhiều
7. upload 2 file  bai_tap_3_schema.sql và bai_tap_3_data.sql lên repository.
8. nhớ commit để save nội dung file bai_tap3.md

## TẠO BẢNG ĐIỂM

![image](https://github.com/user-attachments/assets/b3e7050f-9f25-42cd-b45a-8e2aad327fc6)

## BẢNG DKMH ĐÃ SỬA

![image](https://github.com/user-attachments/assets/b0f15e0d-c266-473c-9cf3-3093c61d256e)

## ĐẶT ĐIỀU KIỆN CHO BẢNG ĐIỂM

**ĐẶT KHÓA NGOẠI**

![image](https://github.com/user-attachments/assets/a748aaff-3b88-4bf0-a876-cacc00a6e7a5)

**ĐẶT BẢNG CHECK CHO BẢNG ĐIỂM**

![image](https://github.com/user-attachments/assets/7e991f46-0cd3-4b2e-b4aa-1b2fc8377b8e)

![image](https://github.com/user-attachments/assets/cc7fdc2c-7161-4148-9460-c4eaf4057e39)

**MÔ TẢ CÁC PK, FK CỦA DB**

![image](https://github.com/user-attachments/assets/28819cc2-8268-4eba-8389-4d61127e23a6)

## ĐÂY LÀ HÌNH ẢNH CODE TRUY VẤN ĐƯỢC LẤY TỪ NHỮNG BẢNG SAU ĐÂY

**BẢNG SINH VIÊN**

![image](https://github.com/user-attachments/assets/5bd2918d-aa33-41ba-bba3-516ff52f725e)

**BẢNG LỚP HỌC PHẦN**

![image](https://github.com/user-attachments/assets/08104ad9-4f5b-4322-a23a-1b2486d04b10)

**BẢNG MÔN HỌC**

![image](https://github.com/user-attachments/assets/c104ff16-4214-4fb4-af08-7d577daa4f8f)

**BẢNG ĐIỂM**

![image](https://github.com/user-attachments/assets/146ca253-3c4d-44f6-985d-769f8bf1c2f3)

**BẢNG DKMH**

![image](https://github.com/user-attachments/assets/b850fa2f-9eb4-4b53-a00c-428c52dd6252)

**ĐÂY LÀ ĐOẠN TRUY VẤN CODE THÀNH CÔNG**


**XUẤT FILE DỮ LIỆU CỦA DB (bai_tap_3_schema.sql)**

![image](https://github.com/user-attachments/assets/7e5c3325-d094-4b01-a7d5-d8e76fc1f6a7)

**XUẤT FILE DỮ LIỆU ĐÃ NHẬP (bai_tap_3_data.sql)**

![image](https://github.com/user-attachments/assets/27a38e48-7db3-4992-82fb-fc70b4363d89)
