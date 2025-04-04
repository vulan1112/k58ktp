USE [QLSV]
GO
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh]) VALUES (1, N'thanh', CAST(N'2005-09-02' AS Date))
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh]) VALUES (2, N'lan', CAST(N'2004-11-02' AS Date))
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh]) VALUES (3, N'dat', CAST(N'2006-11-11' AS Date))
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh]) VALUES (4, N'ha', CAST(N'2004-12-03' AS Date))
GO
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [STC]) VALUES (11, N'ly', 3)
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [STC]) VALUES (12, N'toan', 1)
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [STC]) VALUES (13, N'van', 2)
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [STC]) VALUES (14, N'anh', 2)
GO
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (123, N'co')
INSERT [dbo].[Khoa] ([MaKhoa], [TenKhoa]) VALUES (1234, N'dien')
GO
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [MaKhoa]) VALUES (8, N'dien tu', 1234)
INSERT [dbo].[BoMon] ([MaBM], [TenBM], [MaKhoa]) VALUES (9, N'co khi', 123)
GO
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen], [NgaySinh], [MaBM]) VALUES (34, N'ba', CAST(N'1967-12-02' AS Date), 9)
INSERT [dbo].[GiaoVien] ([MaGV], [HoTen], [NgaySinh], [MaBM]) VALUES (35, N'bon', CAST(N'1988-12-12' AS Date), 8)
GO
INSERT [dbo].[LopHP] ([MaLopHP], [TenLopHP], [HK], [MaMon], [MaGV]) VALUES (12, N'kmt', N'1', 12, NULL)
INSERT [dbo].[LopHP] ([MaLopHP], [TenLopHP], [HK], [MaMon], [MaGV]) VALUES (13, N'ktp', N'1', 13, NULL)
INSERT [dbo].[LopHP] ([MaLopHP], [TenLopHP], [HK], [MaMon], [MaGV]) VALUES (14, N'klp', N'2', 11, NULL)
GO
SET IDENTITY_INSERT [dbo].[DKMH] ON 

INSERT [dbo].[DKMH] ([id_dk], [MaLopHP], [MaSV], [DiemThi], [PhanTramThi]) VALUES (1, 12, 1, 9, 10)
INSERT [dbo].[DKMH] ([id_dk], [MaLopHP], [MaSV], [DiemThi], [PhanTramThi]) VALUES (2, 13, 2, 9, 9)
INSERT [dbo].[DKMH] ([id_dk], [MaLopHP], [MaSV], [DiemThi], [PhanTramThi]) VALUES (3, 14, 3, 9, 10)
SET IDENTITY_INSERT [dbo].[DKMH] OFF
GO
SET IDENTITY_INSERT [dbo].[Diem] ON 

INSERT [dbo].[Diem] ([id], [id_dk], [diem]) VALUES (4, 1, 9)
INSERT [dbo].[Diem] ([id], [id_dk], [diem]) VALUES (5, 2, 10)
INSERT [dbo].[Diem] ([id], [id_dk], [diem]) VALUES (6, 3, 10)
SET IDENTITY_INSERT [dbo].[Diem] OFF
GO
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (22, N'kmt')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (23, N'ktp')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (24, N'ktt')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (25, N'klp')
GO
INSERT [dbo].[LopSV] ([MaLop], [MaSV], [ChucVu]) VALUES (22, 1, N'sv')
INSERT [dbo].[LopSV] ([MaLop], [MaSV], [ChucVu]) VALUES (22, 4, N'sv')
INSERT [dbo].[LopSV] ([MaLop], [MaSV], [ChucVu]) VALUES (23, 2, N'sv')
INSERT [dbo].[LopSV] ([MaLop], [MaSV], [ChucVu]) VALUES (24, 3, N'sv')
GO
INSERT [dbo].[GVCN] ([MaLop], [MaGV], [HK]) VALUES (22, 34, N'1')
INSERT [dbo].[GVCN] ([MaLop], [MaGV], [HK]) VALUES (23, 35, N'2')
GO
