CREATE TABLE GiaoVien (
    MaGV INT PRIMARY KEY,
    HoTen VARCHAR(100),
    NgaySinh DATE,
    MaBM INT,
    FOREIGN KEY (MaBM) REFERENCES BoMon(MaBM)
);
Go