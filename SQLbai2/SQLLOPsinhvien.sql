CREATE TABLE LopSV (
    MaLop INT,
    MaSV INT,
    ChucVu VARCHAR(50),
    PRIMARY KEY (MaLop, MaSV),
    FOREIGN KEY (MaLop) REFERENCES Lop(MaLop),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
);
Go
